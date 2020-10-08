USE Taverns;

--'Ensure tables start empty'
-- need to reverse list of drop statements
DROP TABLE IF EXISTS [RoomStays];
DROP TABLE IF EXISTS [Rooms];
DROP TABLE IF EXISTS [RoomStatus];
DROP TABLE IF EXISTS [Rats];
DROP TABLE IF EXISTS [SuppliesSales];
DROP TABLE IF EXISTS [GuestClassLevel];
DROP TABLE IF EXISTS [Guests];
DROP TABLE IF EXISTS [Classes];
DROP TABLE IF EXISTS [GuestStatus];
DROP TABLE IF EXISTS [ServicesSold];
DROP TABLE IF EXISTS [Inventory];
DROP TABLE IF EXISTS [Users];
DROP TABLE IF EXISTS [Taverns];
DROP TABLE IF EXISTS [Owners];
DROP TABLE IF EXISTS [Services];
DROP TABLE IF EXISTS [Supplies];
DROP TABLE IF EXISTS [Location];
DROP TABLE IF EXISTS [Roles];
DROP TABLE IF EXISTS [ServicesStatus];
GO


--'Create tables'
CREATE TABLE [ServicesStatus] (
    ID INT IDENTITY(1, 1),
	StatusName varchar(250),
	StatusDescription varchar(250)
);

CREATE TABLE [Roles] (
    ID INT IDENTITY(1, 1),
	TavernRole varchar(250),
	RoleDescription varchar(8000)
);

CREATE TABLE [Location] (
    ID INT IDENTITY(1, 1),
	City varchar(250),
	States varchar(250)
);

CREATE TABLE [Supplies] (
    ID INT IDENTITY(1, 1),
	SupplyName varchar(250),
	SupplyDescription varchar(250),
	SupplyUnit varchar(250),
	SupplyCount int,
	DateUpdated date,
	UnitCost int
);

CREATE TABLE [Services] (
    ID INT IDENTITY(1, 1),
	ServicesName varchar(250),
	ServicesStatusID int, --'use ServicesStatus ID'
);

CREATE TABLE [Owners] (
	ID INT IDENTITY(1, 1),
	OwnerName varchar(250),
	TavernsOwned int, --'use Taverns ID'
	RolesID int, --'use Roles ID'
);

CREATE TABLE [Taverns] (
    ID INT IDENTITY(1, 1),
    TavernName varchar(250),
	TavernDescription varchar(8000),
	LocationID int, --'use Location ID'
	OwnerID int, --'use Owner ID'
	RolesID int, --'use Roles ID'
	ServicesID int --'use Services ID'

);

CREATE TABLE [Users] (
    ID INT IDENTITY(1, 1),
	UserName varchar(250),
	TavernAt int, --'use Taverns ID'
	RolesID int --'use Roles ID'
);

CREATE TABLE [Inventory] (
	ID INT IDENTITY(1, 1),
	SupplyID int, --'use Supplies ID'
	TavernID int, --'use Taverns ID'
	Cost money,
	SupplyCount int,
	DateRecieved datetime
);

CREATE TABLE [ServicesSold] (
    ID INT IDENTITY(1, 1),
	ServiceID int, --'use Services ID'
	TavernID int, --'useTavern ID'
	UserSoldTo int, --'use Users ID'
	ServicePrice money,
	DateSold date,
	AmountSold int
);

CREATE TABLE [Rats] (
    ID INT IDENTITY(1, 1),
	RatName varchar(250),
	RatDescription varchar(8000),
	FavoratHobby varchar(250),
	TavernID int --'use Taverns ID'
);
GO

-- Assign primary keys
-- Pattern
-- ALTER TABLE [Table] ADD PRIMARY KEY ([Column Name]);

ALTER TABLE [Taverns] ADD PRIMARY KEY (ID);
ALTER TABLE [Location] ADD PRIMARY KEY (ID);
ALTER TABLE [Owners] ADD PRIMARY KEY (ID);
ALTER TABLE [Roles] ADD PRIMARY KEY (ID);
ALTER TABLE [Users] ADD PRIMARY KEY (ID);
ALTER TABLE [Supplies] ADD PRIMARY KEY (ID);
ALTER TABLE [Inventory] ADD PRIMARY KEY (ID);
ALTER TABLE [Services] ADD PRIMARY KEY (ID);
ALTER TABLE [ServicesStatus] ADD PRIMARY KEY (ID);
ALTER TABLE [ServicesSold] ADD PRIMARY KEY (ID);
ALTER TABLE [Rats] ADD PRIMARY KEY (ID);
GO

-- Assign foreign keys to establish relationships
-- Pattern
-- ALTER TABLE [Table] ADD FOREIGN KEY ([Column Name]) References [Table]([Column Name]);

--Rats Table
ALTER TABLE [Rats] ADD FOREIGN KEY (TavernID) References [Taverns](ID);

--ServicesSold Table
ALTER TABLE [ServicesSold] 
	ADD FOREIGN KEY (ServiceID) References [Services](ID),
		FOREIGN KEY (TavernID) References [Taverns](ID),
		FOREIGN KEY (UserSoldTo) References [Users](ID);

-- Inventory Table
ALTER TABLE [Inventory] 
	ADD FOREIGN KEY (SupplyID) References [Supplies](ID),
		FOREIGN KEY (TavernID) References [Taverns](ID);

--Users Table

ALTER TABLE [Users] 
	ADD FOREIGN KEY (TavernAt) References [Taverns](ID),
		FOREIGN KEY (RolesID) References [Roles](ID);

--Taverns Table
ALTER TABLE [Taverns] 
	ADD FOREIGN KEY (LocationID) References [Location](ID),
		FOREIGN KEY (OwnerID) References [Owners](ID),
		FOREIGN KEY (RolesID) References [Roles](ID),
		FOREIGN KEY (ServicesID) References [Services](ID);

--Services Table
ALTER TABLE [Services] ADD FOREIGN KEY (ServicesStatusID) References [ServicesStatus](ID);

--Owners Table
ALTER TABLE [Owners] ADD FOREIGN KEY (RolesID) References [Roles](ID);
GO

--Goodbye Rats :'(
DROP TABLE [Rats];


--More Creation
CREATE TABLE [GuestStatus](
	ID int IDENTITY(1,1),
	StatusName varchar(250),
	StatusDescription varchar(MAX)
);

CREATE TABLE [Classes](
	ID INT IDENTITY(1,1),
	ClassName varchar(250),
	ClassDescription varchar(MAX)
);

CREATE TABLE [Guests](
	ID INT IDENTITY(1,1),
	GuestName varchar(250),
	GuestNotes varchar(MAX),
	Birthday date,
	Cakeday date,
	StatusID int --use GuestStatus ID
);

CREATE TABLE [GuestClassLevel](
	ID int IDENTITY(1,1),
	GuestID int, --use Guests ID
	ClassID int, --use Classes ID
	CurrentLevel int
);

CREATE TABLE [SuppliesSales](
	ID int IDENTITY(1,1),
	GuestID int, --use Guests ID
	TavernID int, --use Taverns
	SuppliesID int, --use Supplies ID
	AmountSold int,
	TotalCost money,
	DateSold date
);
GO

--Add Keys
ALTER TABLE [Classes] ADD PRIMARY KEY (ID);

ALTER TABLE [GuestStatus] ADD PRIMARY KEY (ID);

ALTER TABLE [Guests]
	ADD 
		PRIMARY KEY (ID),
		FOREIGN KEY (StatusID) REFERENCES [GuestStatus](ID);

ALTER TABLE [GuestClassLevel]
	ADD 
		PRIMARY KEY (ID),
		FOREIGN KEY (GuestID) REFERENCES [Guests](ID),
		FOREIGN KEY (ClassID) REFERENCES [Classes](ID);

ALTER TABLE [SuppliesSales]
	ADD
		PRIMARY KEY (ID),
		FOREIGN KEY (GuestID) REFERENCES [Guests](ID),
		FOREIGN KEY (TavernID) REFERENCES [Taverns](ID),
		FOREIGN KEY (SuppliesID) REFERENCES [Supplies](ID);
GO

--Now to demonstrate limitations!


--This statement is invalid since the single quote was not escaped, 
-- at the moment there is not ID of 30 for a tavern,
-- and there is no ID of 600 for roles
--INSERT 
--	INTO [Users] (UserName, TavernAt, RolesID)
--	VALUES
--		('One's own!', 30, 600); 
--Would add more, but running short on time.

--More table creation
CREATE TABLE [RoomStatus](
ID int IDENTITY(1,1),
StatusName varchar(250),
StatusDescription varchar(MAX)
);

CREATE TABLE [Rooms](
ID int IDENTITY(1,1),
RoomDescription varchar(MAX),
TavernID int, --use Taverns ID
StatusID int, --use RoomStatus ID
);

CREATE TABLE [RoomStays](
ID int IDENTITY(1,1),
GuestID int, --use Guests ID
RoomID int,--use Rooms ID
SalesID int, --use SuppliesSalesID
Rate money,
DateStayed date
);

--Add keys
ALTER TABLE [RoomStatus] ADD PRIMARY KEY (ID);

ALTER TABLE [Rooms]
	ADD
		PRIMARY KEY (ID),
		FOREIGN KEY (TavernID) REFERENCES [Taverns](ID),
		FOREIGN KEY (StatusID) REFERENCES [RoomStatus](ID);

ALTER TABLE [RoomStays]
	ADD
		PRIMARY KEY (ID),
		FOREIGN KEY	(GuestID) REFERENCES [Guests](ID),
		FOREIGN KEY (RoomID) REFERENCES [Rooms](ID),
		FOREIGN KEY (SalesID) REFERENCES [SuppliesSales](ID);

