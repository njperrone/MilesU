--'
--DROP TABLE IF EXISTS [Table Name]; -- Only Sql Server 2016+

--IF OBJECT_ID(‘dbo.[Table Name], ‘U’) IS NOT NULL DROP TABLE
--dbo.[Table Name]; -- U - User-Defined (Versions < 2016)

--CREATE TABLE [Table Name] (
--    [Column Name] [Column Type] IDENTITY([seed], [increment]),
--    [Column Name] [Column Type]
--);

--CREATE TABLE [Tavern] (
--    ID INT IDENTITY(1, 1),
--    TavernName varchar(250) 
--);

--INSERT INTO [TABLENAME] (columnnames)
--	VALUES (value1, value2, ... , valuen);

--'
--'Ensure tables start empty'
DROP TABLE IF EXISTS [Taverns];
DROP TABLE IF EXISTS [Owners];
DROP TABLE IF EXISTS [Users];
DROP TABLE IF EXISTS [Roles];
DROP TABLE IF EXISTS [Rats];
DROP TABLE IF EXISTS [Location];
DROP TABLE IF EXISTS [Supplies];
DROP TABLE IF EXISTS [Services];
DROP TABLE IF EXISTS [Inventory];
DROP TABLE IF EXISTS [ServiceStatus];
DROP TABLE IF EXISTS [ServicesSold];

--'Create tables'

CREATE TABLE [Taverns] (
    ID INT IDENTITY(1, 1),
    TavernName varchar(250),
	TavernDescription varchar(MAX),
	TavernLocation int, --'use Location ID'
	TavernOwner int, --'use Owner ID'
	TavernRoles int, --'use Roles ID'
	TavernServices int --'use ServiceServices ID'

);

CREATE TABLE [Location] (
    ID INT IDENTITY(1, 1),
	City varchar(250),
	States varchar(250)
);

CREATE TABLE [Owners] (
	ID INT IDENTITY(1, 1),
	OwnerName varchar(250),
	TavernsOwned int, --'use Taverns ID'
	UserRoles int, --'use Roles ID'
);

CREATE TABLE [Roles] (
    ID INT IDENTITY(1, 1),
	TavernRole varchar(250),
	RoleDescription varchar(MAX)
);

CREATE TABLE [Users] (
    ID INT IDENTITY(1, 1),
	UserName varchar(250),
	TavernAt int, --'use Taverns ID'
	UserRole int --'use Roles ID'
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

CREATE TABLE [Inventory] (
	ID INT IDENTITY(1, 1),
	SupplyID int, --'use Supplies ID'
	TavernID int, --'use Taverns ID'
	Cost money,
	SupplyCount int,
	DateRecieved datetime
);

CREATE TABLE [Services] (
    ID INT IDENTITY(1, 1),
	ServicesName varchar(250),
	ServicesStatus int, --'use Status ID'
);

CREATE TABLE [ServiceStatus] (
    ID INT IDENTITY(1, 1),
	StatusName varchar(250),
	StatusDescription varchar(250)
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
	RatDescription varchar(MAX),
	FavoratHobby varchar(250),
	TavernID int --'use Taverns ID'
);

--'Insert data into tables'

INSERT INTO [Taverns] (TavernName, TavernDescription, TavernLocation, TavernOwner, TavernRoles, TavernServices)
VALUES 
	("Null Tavern", "A wonderful tavern where NULL is the experience", 3, 1, 3, 1), --'ID 1'
	("CLASSIFIED", "CLASSIFIED REDACTED", 7, 5, 4, 2), --'ID 2'
	("Club Dada", "A hobby-hosre's dream", 6, 4, 5, 4), --'ID 3'
	("Championships Sportsbar and Grill", "Come for the punks, but sorry there's no food", 1, 6, 2, 3), --'ID 4'
	("Scary Spooky Skelletons", "Self explanatory what goes on in this tavern", 5, 3, 2, 5); --'ID 5'

INSERT INTO [Location] (City, States)
VALUES 
	("Trenton", "New Jersey"), --'ID 1'
	("Morrisville", "Pennsylvania"), --'ID 2'
	("Nowhere", "Quit Asking"), --'ID 3'
	("Princeton", "New Jersey"), --'ID 4'
	("Phialdelphia", "Pennsylvania"), --'ID 5'
	("Denver", "Colorado"), --'ID 6'
	("CLASSIFIED", "CLASSIFIED"); --'ID 7'


INSERT INTO [Owners] (OwnerName, TavernsOwned, UserRoles)
VALUES 
	("Mr. Nobody", 1, 1), --'ID 1'
	("Bob the Builder", NULL, 1), --'ID 2'
	("Mrs. Nesbit", 5, 1), --'ID 3'
	("Angelica Pickles", 3, 1), --'ID 4'
	("CLASSIFIED", 2, 1), --'ID 5'
	("Nikky Nailbomb", 4, 1); --'ID 6'

INSERT INTO [Roles] (TavernRole, RoleDescription)
VALUES
	("Owner", "Pretty straight forward. Owns a tavern. Does owner things."), --'ID 1'
	("Quiet Drinker", "A person who likes a drink or two or several. Generally quiet."), --'ID 2'
	("Dada", "Dada comes from the dictionary. It is terribly simple. In French it means hobby horse. In German it means good-bye, Get off my back, Be seeing you sometime. In Romanian: Yes, indeed, you are right, that's it. But of course, yes, definitely, right. And so forth."), --'ID 3'
	("CLASSIFIED", "CLASSIFIED"), --'ID 4'
	("The Talker", "They just wont be quiet no matter how much you ask"); --'ID 5'

INSERT INTO [Users] (UserName, TavernAt, UserRole)
VALUES
	("The Quiz", 1), --'ID 1'
	("Artie", 4, 5), --'ID 2'
	("Mike", 5, 2), --'ID 3'
	("Queen Meave", 1, 5), --'ID 4'
	("Annette", 4, 5); --'ID 5'

INSERT INTO [Supplies] (SupplyName, SupplyDescription, SupplyUnit, SupplyCount, DateUpdated, UnitCost)
VALUES
	("Strong Ale", "It's an ale, it's strong, it's drinkable", "pint", 1000, 2020-02-03, 7), --'ID 1'
	("Weak Ale", "Not as strong as the Strong Ale", "pint", 942, 2018-02-03, 5), --'ID 2'
	("Ale", "Not strong, not weak, just ale", 500, 2020-09-22, 6), --'ID 3'
	("The Void", "Self explanatory, yet it's bounded and compact", "Nietzsche", 10000000, 2000-01-01, 35), --'ID 4'
	("A can of oxygen", "You use it to breathe in smoke filled rooms", "can", 300, 2020-07-04, 300); --'ID 5'

INSERT INTO [Inventory] (SupplyID, TavernID, Cost, SupplyCount, DateRecieved)
VALUES
	(5, 2, 3000, 10, 2020-08-13), --'ID 1'
	(5, 4, 30000, 100, 2019-03-11), --'ID 2'
	(1, 3, 7000, 1000, 2018-05-04), --'ID 3'
	(3, 1, 6000, 1000, 2020-09-21), --'ID 4'
	(4, 5, 35, 1, 2020-07-04); --'ID 5'

INSERT INTO [Services] (ServicesName, ServicesStatus)
VALUES
	("Mad mad mad singing", 1), --'ID 1'
	("CLASSIFIED", 3), --'ID 2'
	("Smoking", 2), --'ID 3'
	("A Game of Marco Polo", 1), --'ID 4'
	("Being Politely Asked To Leave", 1); --'ID 5'

INSERT INTO [ServicesStatus] (StatusName, StatusDescription)
VALUES 
	("Active", "This service is currently available"), --'ID 1'
	("Inactive", "This service is currently not available"), --'ID 2'
	("CLASSIFIED", "WOULDNT YOU LIKE TO KNOW"); --'ID 3'

INSERT INTO [ServicesSold] (ServiceID, TavernID, UserSoldTo, ServicePrice, DateSold, AmountSold)
VALUES 
	(2, 2, 3, 350, 2020-07-04, 1), --'ID 1'
	(1, 5, 4, 0, 2020-03-16, 1), --'ID 2'
	(1, 4, 5, 20, 2020-05-25, 75), --'ID 3'
	(4, 1, 1, 45, 2019-10-31, 3000), --'ID 4'
	(5, 2, 3, 0, 2018-07-07, 420); --'ID 5'

INSERT INTO [Rats] (RatName, RatDescription, FavoratHobby, TavernID)
VALUES 
	("Rizzo", "A rat who loves to eat and play tricks on others. He speaks with a Brooklyn accent and is often paired with Gonzo and the two have been best friends ever since.", "Eating", 2), --'ID 1'
	("Hank", "Just your plane brown rat", "Long walks", 3), --'ID 2'
	("Gonzo", "Big blue nose", "Buggin Rizzo", 5), --'ID 3'
	("Scabby", "A lot of rats don't like Scabby", "Pickin scabs", 5), --'ID 4'
	("Stix", "Not a lot is known about this cool cat", "Air guitar", 4), --'ID 5'
