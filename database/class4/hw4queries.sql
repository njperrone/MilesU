USE Taverns;

-- 1
SELECT u.UserName, r.TavernRole
	FROM Users AS u JOIN Roles AS r
		ON u.RolesID = r.ID
	WHERE r.TavernRole LIKE 'Admin'

-- 2
SELECT u.UserName, r.TavernRole, t.TavernName, t.TavernDescription
	FROM Users AS u LEFT JOIN Roles AS r
		ON u.RolesID = r.ID
	LEFT JOIN Taverns AS t
		ON u.TavernAt = t.ID
	WHERE r.TavernRole LIKE 'Admin'

--3
SELECT g.GuestName, c.ClassName, gc.CurrentLevel
	FROM Guests AS g LEFT JOIN GuestClassLevel AS gc
		ON gc.GuestID = g.ID
	LEFT JOIN Classes as c
		ON gc.ClassID = c.ID
	ORDER BY g.GuestName ASC

-- 4
SELECT TOP 10 serv.ServicesName, sold.ServicePrice
	FROM ServicesSold AS sold JOIN [Services] AS serv
		ON sold.ServiceID = serv.ID
	ORDER BY sold.ServicePrice DESC

-- 5
-- ugh i don't like the syntax for this one
SELECT g.GuestName, COUNT(gc.GuestID) as NumClasses
	FROM Guests AS g JOIN GuestClassLevel AS gc
		ON gc.GuestID = g.ID
	GROUP BY g.GuestName
	HAVING COUNT(gc.GuestID) > 1

-- 6
SELECT g.GuestName, COUNT(gc.GuestID) as NumClasses
	FROM Guests AS g JOIN GuestClassLevel AS gc
		ON gc.GuestID = g.ID
	WHERE gc.CurrentLevel > 5
	GROUP BY g.GuestName
	HAVING COUNT(gc.GuestID) > 1 

-- 7
SELECT g.GuestName, MAX(DISTINCT gc.CurrentLevel) as MaxLvl
	FROM Guests AS g JOIN GuestClassLevel AS gc
		ON gc.GuestID = g.ID
	GROUP BY g.GuestName

-- 8
SELECT g.GuestName, r.DateStayed 
	FROM Guests AS g LEFT JOIN RoomStays AS r
		ON g.ID = r.GuestID
	WHERE r.DateStayed BETWEEN '2020-06-01' AND '2020-09-01'

-- 9
-- Still working on this
SELECT 
CONCAT('CREATE TABLE ',TABLE_NAME, ' (') as queryPiece 
FROM INFORMATION_SCHEMA.TABLES
 WHERE TABLE_NAME = 'Taverns'
UNION ALL
SELECT CONCAT(cols.COLUMN_NAME, ' ', cols.DATA_TYPE, 
(
    CASE WHEN CHARACTER_MAXIMUM_LENGTH IS NOT NULL 
    Then CONCAT
        ('(', CAST(CHARACTER_MAXIMUM_LENGTH as varchar(100)), ')') 
    Else '' 
    END)
, 
    CASE WHEN refConst.CONSTRAINT_NAME IS NOT NULL
    Then 
        (CONCAT(' FOREIGN KEY REFERENCES ', constKeys.TABLE_NAME, '(', constKeys.COLUMN_NAME, ')')) 
    Else '' 
    END
, 
	CASE WHEN TABLE_NAME = sysStuff.ObjName AND sysStuff.isID = 1
	THEN 
		(CONCAT(' IDENTITY(1,1) PRIMARY KEY'))
',') as queryPiece FROM 
INFORMATION_SCHEMA.COLUMNS as cols
	LEFT JOIN INFORMATION_SCHEMA.KEY_COLUMN_USAGE as keys 
		ON (keys.TABLE_NAME = cols.TABLE_NAME and keys.COLUMN_NAME = cols.COLUMN_NAME)
	LEFT JOIN INFORMATION_SCHEMA.REFERENTIAL_CONSTRAINTS as refConst 
		ON (refConst.CONSTRAINT_NAME = keys.CONSTRAINT_NAME)
	LEFT JOIN 
		(SELECT DISTINCT CONSTRAINT_NAME, TABLE_NAME, COLUMN_NAME 
			FROM INFORMATION_SCHEMA.KEY_COLUMN_USAGE) as constKeys 
		ON (constKeys.CONSTRAINT_NAME = refConst.UNIQUE_CONSTRAINT_NAME)
	LEFT JOIN -- This is where I joined my stuff
		(select sysObj.name ObjName, sysCol.name ColName, sysCol.is_identity isID, sysOjb2.name isPK
			from sys.objects sysObj inner join sys.columns sysCol 
				ON sysObj.object_id = sysCol.object_id
			JOIN sys.objects as sysOjb2
				ON sysCol.object_id = sysOjb2.parent_object_id
			WHERE sysCol.is_identity = 1 AND sysOjb2.name LIKE 'PK%') as sysStuff
	WHERE cols.TABLE_NAME = 'Taverns'
UNION ALL
SELECT ')'; 


select sysObj.name, sysCol.name, sysCol.is_identity, sysOjb2.name 
	from sys.objects sysObj inner join sys.columns sysCol 
		on sysObj.object_id = sysCol.object_id
	JOIN sys.objects as sysOjb2
		ON sysCol.object_id = sysOjb2.parent_object_id
	WHERE sysCol.is_identity = 1
		AND sysOjb2.name LIKE 'PK%'
	

SELECT * FROM sys.objects

SELECT * FROM sys.columns

SELECT * FROM sys.key_constraints

select sysObj.name, sysCol.name, sysCol.is_identity 
	from sys.objects sysObj inner join sys.columns sysCol 
		on sysObj.parent_object_id = sysCol.object_id