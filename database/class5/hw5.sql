USE Taverns;

-- 1
SELECT u.UserName, r.TavernRole, r.RoleDescription 
FROM (Users as u LEFT JOIN Roles as r
	ON u.RolesID = r.ID)
GO

--2
SELECT c.ClassName, COUNT(g.ID) as ClassCount
FROM (Classes as c LEFT JOIN GuestClassLevel as gc
		ON c.ID = gc.ClassID
	LEFT JOIN Guests as g
		ON gc.GuestID = g.ID)
GROUP BY c.ClassName
GO

--3
SELECT g.GuestName, c.ClassName, gc.CurrentLevel, LevelType =
	(CASE
		WHEN gc.CurrentLevel <=5 THEN 'Beginner'
		WHEN gc.CurrentLevel BETWEEN 5 AND 11 THEN 'Intermediate'
		WHEN gc.CurrentLevel > 10 THEN 'Expert'
	END)
		 
	FROM (Guests as g LEFT JOIN GuestClassLevel as gc
		ON g.ID = gc.GuestID
	LEFT JOIN Classes as c
		ON gc.ClassID = c.ID)
ORDER BY g.GuestName ASC
GO

--4
IF OBJECT_ID (N'dbo.getLevelGroup', N'FN') IS NOT NULL  
    DROP FUNCTION dbo.getLevelGroup;  
GO  
CREATE FUNCTION dbo.getLevelGroup(@level int)  
RETURNS varchar(250)
AS   
BEGIN  
    RETURN  
		CASE
			WHEN @level <=5 THEN 'Beginner'
			WHEN @level BETWEEN 5 AND 11 THEN 'Intermediate'
			WHEN @level > 10 THEN 'Expert'
		END
END
GO

-- qyery to show it works
SELECT g.GuestName, c.ClassName, gc.CurrentLevel, dbo.getLevelGroup(gc.CurrentLevel) as LevelType		 
	FROM (Guests as g LEFT JOIN GuestClassLevel as gc
		ON g.ID = gc.GuestID
	LEFT JOIN Classes as c
		ON gc.ClassID = c.ID)
ORDER BY g.GuestName ASC
GO

--5
IF OBJECT_ID (N'dbo.reportEmptyRooms', N'IF') IS NOT NULL  
    DROP FUNCTION dbo.reportEmptyRooms;  
GO  
CREATE FUNCTION dbo.reportEmptyRooms (@date date)  
RETURNS TABLE  
AS  
RETURN   
(  
	SELECT t.TavernName, r.RoomDescription
		FROM (Rooms as r LEFT JOIN RoomStays as rs
			ON rs.RoomID = r.ID
			LEFT JOIN Taverns as t
				ON r.TavernID = t.ID)
		WHERE rs.DateStayed != @date
);  
GO

--query to show it works
SELECT r.RoomID, r.DateStayed FROM RoomStays as r
SELECT * FROM dbo.reportEmptyRooms ('2020-10-02')
GO

-- 6
IF OBJECT_ID (N'dbo.emptyRoomPrice', N'IF') IS NOT NULL  
    DROP FUNCTION dbo.emptyRoomPrice;  
GO  
CREATE FUNCTION dbo.emptyRoomPrice (@min money, @max money)  
RETURNS TABLE  
AS  
RETURN   
(  
	SELECT t.TavernName, rs.RoomID, rs.Rate
		FROM (Rooms as r LEFT JOIN RoomStays as rs
			ON rs.RoomID = r.ID
			LEFT JOIN Taverns as t
				ON r.TavernID = t.ID)
		WHERE rs.Rate BETWEEN @min AND @max
);  
GO

--query to show it works
SELECT r.RoomID, r.Rate FROM RoomStays as r
SELECT * FROM dbo.emptyRoomPrice(75,200)

--7
DROP FUNCTION IF EXISTS dbo.undercutPrice;  
GO  

CREATE FUNCTION dbo.undercutPrice()  
RETURNS TABLE 
AS
RETURN
(
	SELECT TOP 1 r.GuestID, r.RoomID, r.SalesID, cheapRoom.cheapPrice - .01 as Rate, r.DateStayed
	FROM RoomStays as r
	JOIN
		(SELECT TOP 1 prices.RoomID, MIN(prices.Rate) as cheapPrice
			FROM dbo.emptyRoomPrice(0, 100000000)as prices
		GROUP BY prices.RoomID
		ORDER BY cheapPrice
		) AS cheapRoom
	ON r.RoomID = cheapRoom.RoomID
	ORDER BY Rate DESC
);
GO

INSERT
	INTO RoomStays (GuestID, RoomID, SalesID, Rate, DateStayed)
		SELECT TOP 1 * FROM dbo.undercutPrice();

SELECT * FROM RoomStays