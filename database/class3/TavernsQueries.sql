USE Taverns;

-- Select Guests with birthdays before 2000
SELECT * FROM Guests
	WHERE Birthday <= '2000-01-01';

-- Select Rooms that cost more than 100 gold per night

SELECT * FROM Rooms
	WHERE Rooms.ID in 
		(SELECT ID FROM RoomStays
			WHERE RoomStays.Rate >= 100);

-- Select that returns unique guest names

SELECT DISTINCT GuestName FROM Guests;

-- Write a query that returns all guests ordered by name (ascending)
SELECT * FROM Guests
	ORDER BY GuestName ASC;

-- Write a query that returns the top 10 highest price sales

SELECT TOP 10 TotalCost FROM SuppliesSales
	ORDER BY TotalCost;

-- Write a query to return all the values stored in all Lookup Tables
SELECT DISTINCT TABLE_NAME FROM INFORMATION_SCHEMA.CONSTRAINT_COLUMN_USAGE
EXCEPT
SELECT DISTINCT TABLE_NAME FROM INFORMATION_SCHEMA.CONSTRAINT_COLUMN_USAGE
	WHERE CONSTRAINT_NAME LIKE 'FK%'

-- I couldn't quite figure out how to use a table of table names to union all desired tables together

SELECT *, NULL, NULL, NULL, NULL FROM Classes
UNION ALL
SELECT *, NULL, NULL, NULL, NULL FROM [Location]
UNION ALL
SELECT *, NULL, NULL, NULL, NULL FROM Roles
UNION ALL
SELECT *, NULL, NULL, NULL, NULL FROM [GuestStatus]
UNION ALL
SELECT *, NULL, NULL, NULL, NULL FROM [ServicesStatus]
UNION ALL
SELECT *, NULL, NULL, NULL, NULL FROM [RoomStatus]
UNION ALL
SELECT * FROM Supplies

-- Write a query that returns Guest Classes with Levels and Generate a new column with a label for their level grouping (lvl 1-10, 10-20, etc)
SELECT *, CASE WHEN GuestClassLevel.CurrentLevel <= 10 THEN 'lvl 1-10'
			   WHEN GuestClassLevel.CurrentLevel > 10 AND GuestClassLevel.CurrentLevel <= 20 THEN 'lvl 11-20'
			   WHEN GuestClassLevel.CurrentLevel > 20 AND GuestClassLevel.CurrentLevel <= 30 THEN 'lvl 21-30'
			   WHEN GuestClassLevel.CurrentLevel > 30 AND GuestClassLevel.CurrentLevel <= 40 THEN 'lvl 31-40'
			   END AS LevelGroup
	FROM GuestClassLevel

-- Write a series of INSERT commands that will insert the statuses of one table into another of your choosing using SELECT statements
INSERT INTO [RoomStatus] (StatusName, StatusDescription)
	SELECT StatusName, StatusDescription FROM GuestStatus

SELECT * FROM RoomStatus