
--'Ensure tables start empty'
-- need to reverse list of drop statements
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
	ServicesStatusID int, --'use Status ID'
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
	ServicesID int --'use ServiceServices ID'

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

--'Insert data into tables'
INSERT 
	INTO [Taverns] (TavernName, TavernDescription, LocationID, OwnerID, RolesID, ServicesID)
	VALUES 
		('Null Tavern', 'A wonderful tavern where NULL is the experience', 3, 1, 3, 1), --'ID 1'
		('CLASSIFIED', 'CLASSIFIED REDACTED', 7, 5, 4, 2), --'ID 2'
		('Club Dada', 'A hobby-hosres dream', 6, 4, 5, 4), --'ID 3'
		('Championships Sportsbar and Grill', 'Come for the punks, but sorry theres no food', 1, 6, 2, 3), --'ID 4'
		('Scary Spooky Skelletons', 'Self explanatory what goes on in this tavern', 5, 3, 2, 5); --'ID 5'


INSERT 
	INTO [Location] (City, States)
	VALUES 
		('Trenton', 'New Jersey'), --'ID 1'
		('Morrisville', 'Pennsylvania'), --'ID 2'
		('Nowhere', 'Quit Asking'), --'ID 3'
		('Princeton', 'New Jersey'), --'ID 4'
		('Phialdelphia', 'Pennsylvania'), --'ID 5'
		('Denver', 'Colorado'), --'ID 6'
		('CLASSIFIED', 'CLASSIFIED'); --'ID 7'


INSERT 
	INTO [Owners] (OwnerName, TavernsOwned, RolesID)
	VALUES 
		('Mr. Nobody', 1, 1), --'ID 1'
		('Bob the Builder', NULL, 1), --'ID 2'
		('Mrs. Nesbit', 5, 1), --'ID 3'
		('Angelica Pickles', 3, 1), --'ID 4'
		('CLASSIFIED', 2, 1), --'ID 5'
		('Nikky Nailbomb', 4, 1); --'ID 6'


INSERT 
	INTO [Roles] (TavernRole, RoleDescription)
	VALUES
		('Owner', 'Pretty straight forward. Owns a tavern. Does owner things.'), --'ID 1'
		('Quiet Drinker', 'A person who likes a drink or two or several. Generally quiet.'), --'ID 2'
		('Dada', 'Dada comes from the dictionary. It is terribly simple. In French it means hobby horse. In German it means good-bye, Get off my back, Be seeing you sometime. In Romanian: Yes, indeed, you are right, thats it. But of course, yes, definitely, right. And so forth.'), --'ID 3'
		('CLASSIFIED', 'CLASSIFIED'), --'ID 4'
		('The Talker', 'They just wont be quiet no matter how much you ask'); --'ID 5'


INSERT 
	INTO [Users] (UserName, TavernAt, RolesID)
	VALUES
		('The Quiz', 1, 3), --'ID 1'
		('Artie', 4, 5), --'ID 2'
		('Mike', 5, 2), --'ID 3'
		('Queen Meave', 1, 5), --'ID 4'
		('Annette', 4, 5); --'ID 5'


INSERT 
	INTO [Supplies] (SupplyName, SupplyDescription, SupplyUnit, SupplyCount, DateUpdated, UnitCost)
	VALUES
		('Strong Ale', 'Its an ale, its strong, its drinkable', 'pint', 1000, '2020-02-03', 7), --'ID 1'
		('Weak Ale', 'Not as strong as the Strong Ale', 'pint', 942, '2018-02-03', 5), --'ID 2'
		('Ale', 'Not strong, not weak, just ale', 'pint', 500, '2020-09-22', 6), --'ID 3'
		('The Void', 'Self explanatory, yet its bounded and compact', 'Nietzsche', 10000000, '2000-01-01', 35), --'ID 4'
		('A can of oxygen', 'You use it to breathe in smoke filled rooms', 'can', 300, '2020-07-04', 300); --'ID 5'


INSERT 
	INTO [Inventory] (SupplyID, TavernID, Cost, SupplyCount, DateRecieved)
	VALUES
		(5, 2, 3000, 10, 2020-08-13), --'ID 1'
		(5, 4, 30000, 100, 2019-03-11), --'ID 2'
		(1, 3, 7000, 1000, 2018-05-04), --'ID 3'
		(3, 1, 6000, 1000, 2020-09-21), --'ID 4'
		(4, 5, 35, 1, 2020-07-04); --'ID 5'


INSERT 
	INTO [Services] (ServicesName, ServicesStatusID)
	VALUES
		('Mad mad mad singing', 1), --'ID 1'
		('CLASSIFIED', 3), --'ID 2'
		('Smoking', 2), --'ID 3'
		('A Game of Marco Polo', 1), --'ID 4'
		('Being Politely Asked To Leave', 1); --'ID 5'


INSERT 
	INTO [ServicesStatus] (StatusName, StatusDescription)
	VALUES 
		('Active', 'This service is currently available'), --'ID 1'
		('Inactive', 'This service is currently not available'), --'ID 2'
		('CLASSIFIED', 'WOULDNT YOU LIKE TO KNOW'); --'ID 3'


INSERT 
	INTO [ServicesSold] (ServiceID, TavernID, UserSoldTo, ServicePrice, DateSold, AmountSold)
	VALUES 
		(2, 2, 3, 350, '2020-07-04', 1), --'ID 1'
		(1, 5, 4, 0, '2020-03-16', 1), --'ID 2'
		(1, 4, 5, 20, '2020-05-25', 75), --'ID 3'
		(4, 1, 1, 45, '2019-10-31', 3000), --'ID 4'
		(5, 2, 3, 0, '2018-07-07', 420); --'ID 5'


INSERT 
	INTO [Rats] (RatName, RatDescription, FavoratHobby, TavernID)
	VALUES 
		('Rizzo', 'A rat who loves to eat and play tricks on others. He speaks with a Brooklyn accent and is often paired with Gonzo and the two have been best friends ever since.', 'Eating', 2), --'ID 1'
		('Hank', 'Just your plane brown rat', 'Long walks', 3), --'ID 2'
		('Gonzo', 'Big blue nose', 'Buggin Rizzo', 5), --'ID 3'
		('Scabby', 'A lot of rats dont like Scabby', 'Pickin scabs', 5), --'ID 4'
		('Stix', 'Not a lot is known about this cool cat', 'Air guitar', 4); --'ID 5'
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
	ID INT IDENTITY(1,1),
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

--Add Keys
ALTER TABLE [GuestStatus] ADD PRIMARY KEY (ID);
ALTER TABLE [Classes] ADD PRIMARY KEY (ID);

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

--More Seeds

INSERT 
	INTO [GuestStatus] (StatusName, StatusDescription)
	VALUES 
		('Alright Alright Alright', 'This is pretty self explanatory'),
		('Meh', 'Not good, not bad, just meh'),
		('Hangry', 'Best to give them what they want, especially if a barbarian'),
		('Sick', 'Its best not to wear nice clothes around people who are sick'),
		('Raging', 'Its like hangry, but you could have a fully belly and still be raging'),
		('Placid', 'Pretty dang complaint. Also a lake with crocodiles');

INSERT 
	INTO [Classes] (ClassName, ClassDescription)
	VALUES 
		('Mage', 'Does magic, no coins'),
		('Fighter', 'Really really really likes to fight'),
		('Drinker', 'Useless for adventuring, but has many skills required to drink'),
		('Werewolf', 'There wolf.'),
		('Batman', 'Honestly, you probably cannot afford this one.');

--Will seed more later, running out of time

--Now to demonstrate limitations!


--This statement is invalid since the single quote was not escaped, 
-- at the moment there is not ID of 30 for a tavern,
-- and there is no ID of 600 for roles
--INSERT 
--	INTO [Users] (UserName, TavernAt, RolesID)
--	VALUES
--		('One's own!', 30, 600); 
--Would add more, but running short on time.