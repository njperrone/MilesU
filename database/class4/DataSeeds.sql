USE Taverns;

--'Insert data into tables'

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
	INTO [Roles] (TavernRole, RoleDescription)
	VALUES
		('Owner', 'Pretty straight forward. Owns a tavern. Does owner things.'), --'ID 1'
		('Quiet Drinker', 'A person who likes a drink or two or several. Generally quiet.'), --'ID 2'
		('Dada', 'Dada comes from the dictionary. It is terribly simple. In French it means hobby horse. In German it means good-bye, Get off my back, Be seeing you sometime. In Romanian: Yes, indeed, you are right, thats it. But of course, yes, definitely, right. And so forth.'), --'ID 3'
		('CLASSIFIED', 'CLASSIFIED'), --'ID 4'
		('Admin', 'Does taxes and stuff'), --ID 5
		('The Talker', 'They just wont be quiet no matter how much you ask'); --'ID 6'

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
	INTO [ServicesStatus] (StatusName, StatusDescription)
	VALUES 
		('Active', 'This service is currently available'), --'ID 1'
		('Inactive', 'This service is currently not available'), --'ID 2'
		('CLASSIFIED', 'WOULDNT YOU LIKE TO KNOW'); --'ID 3'

INSERT 
	INTO [Services] (ServicesName, ServicesStatusID)
	VALUES
		('Mad mad mad singing', 1), --'ID 1'
		('CLASSIFIED', 3), --'ID 2'
		('Smoking', 2), --'ID 3'
		('A Game of Marco Polo', 1), --'ID 4'
		('Being Politely Asked To Leave', 1); --'ID 5'

INSERT 
	INTO [Taverns] (TavernName, TavernDescription, LocationID, OwnerID, RolesID, ServicesID)
	VALUES 
		('Null Tavern', 'A wonderful tavern where NULL is the experience', 3, 1, 3, 1), --'ID 1'
		('CLASSIFIED', 'CLASSIFIED REDACTED', 7, 5, 4, 2), --'ID 2'
		('Club Dada', 'A hobby-hosres dream', 6, 4, 5, 4), --'ID 3'
		('Championships Sportsbar and Grill', 'Come for the punks, but sorry theres no food', 1, 6, 2, 3), --'ID 4'
		('Scary Spooky Skelletons', 'Self explanatory what goes on in this tavern', 5, 3, 2, 5); --'ID 5'

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
	INTO [ServicesSold] (ServiceID, TavernID, UserSoldTo, ServicePrice, DateSold, AmountSold)
	VALUES 
		(2, 2, 3, 350, '2020-07-04', 1), --'ID 1'
		(1, 5, 4, 0, '2020-03-16', 1), --'ID 2'
		(1, 4, 5, 20, '2020-05-25', 75), --'ID 3'
		(4, 1, 1, 45, '2019-10-31', 3000), --'ID 4'
		(5, 2, 3, 0, '2018-07-07', 420); --'ID 5'


--INSERT 
--	INTO [Rats] (RatName, RatDescription, FavoratHobby, TavernID)
--	VALUES 
--		('Rizzo', 'A rat who loves to eat and play tricks on others. He speaks with a Brooklyn accent and is often paired with Gonzo and the two have been best friends ever since.', 'Eating', 2), --'ID 1'
--		('Hank', 'Just your plane brown rat', 'Long walks', 3), --'ID 2'
--		('Gonzo', 'Big blue nose', 'Buggin Rizzo', 5), --'ID 3'
--		('Scabby', 'A lot of rats dont like Scabby', 'Pickin scabs', 5), --'ID 4'
--		('Stix', 'Not a lot is known about this cool cat', 'Air guitar', 4); --'ID 5'

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

INSERT
	INTO [Guests] (GuestName, GuestNotes, Birthday, Cakeday, StatusID)
	VALUES
		('Bobby-o', 'Just a Bobby.', '1964-02-23', '2010-06-07', 6),
		('Mike', 'Real name is Nitro, but trying out Mike as a nickname.', '1980-06-29', NULL, 2),
		('Izzy', 'Still finding her class', '2003-03-11', '2014-01-01', 1),
		('Dimitri', 'Not much to say.', '2006-11-10', NULL, 3);

INSERT
	INTO [GuestClassLevel] (GuestID, ClassID, CurrentLevel)
	VALUES
		(1, 4, 3),
		(2, 3, 12),
		(3, 5, 1),
		(3, 4, 6),
		(3, 3, 7),
		(4, 1, 25);

INSERT
	INTO [SuppliesSales] (GuestID, TavernID, SuppliesID, AmountSold, TotalCost, DateSold)
	VALUES
		(1, 1, 3, 20, 3000, '2020-06-05'),
		(2, 1, 3, 20, 3000, '2020-06-20'),
		(3, 1, 3, 20, 3000, '2020-06-09'),
		(4, 1, 3, 20, 3000, '2020-06-07');

INSERT 
	INTO [RoomStatus] (StatusName, StatusDescription)
	VALUES
		('Filled', 'The room is filled.'),
		('Vacant', 'The room is vacant.'),
		('Gross', 'The last guest was absolutely disgusting.');

INSERT
	INTO [Rooms] (RoomDescription, TavernID, StatusID)
	VALUES
		('Dingy but livable', 1, 1),
		('The best kept for the best guests', 3, 2),
		('Not even rats like it.', 5, 3);

INSERT
	INTO [RoomStays] (GuestID, RoomID, SalesID, Rate, DateStayed)
	VALUES
		(1, 2, 3, 100, '2020-10-01'),
		(2, 2, 3, 100, '2020-10-02'),
		(1, 1, 3, 100, '2020-07-04'),
		(3,1, 3, 100, '2020-08-29');