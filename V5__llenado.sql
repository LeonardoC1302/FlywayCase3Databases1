-- Inserting Producers
INSERT INTO [dbo].[producers] ([producerName], [grade], [balance])
VALUES 
    ('John Doe', 8.5, 1000.00),
    ('Jane Smith', 7.8, 2500.00),
    ('Bob Johnson', 9.2, 500.00),
    ('Sarah Lee', 4.4, 750.00),
    ('David Kim', 8.9, 2000.00);

-- Inserting Car Types
INSERT INTO [dbo].carTypes ([carTypeName])
VALUES 
	('Automóvil'), 
	('4x4');

-- Inserting cars
INSERT INTO [dbo].[cars] ([carPlate], [carTypeId], [carCapacity])
VALUES 
    ('ABC123', 1, 100),
    ('DEF454', 1, 200),
    ('GHI789', 1, 300),
    ('JKL012', 1, 400),
    ('MNO345', 1, 500);

-- Inserting Countries
INSERT INTO [dbo].[countries] ([countryName])
VALUES ('United States'),
       ('Canada'),
       ('France'),
       ('Germany'),
       ('Japan');

-- Inserting States
INSERT INTO [dbo].[states] ([stateName], [countryId])
VALUES 
    ('California', 1),
    ('Texas', 1),
    ('New York', 1),
    ('Florida', 1),
    ('Illinois', 1)

-- Inserting Cities
INSERT INTO [dbo].[cities] ([zipcode], [stateId], [cityName])
VALUES 
	(12345, 1, 'New York'),
	(23454, 2, 'Los Angeles'),
	(34547, 3, 'Chicago'),
	(45478, 4, 'Houston'),
	(54789, 5, 'Miami');

-- Inserting Addresses
INSERT INTO [dbo].[addresses] ([countryId], [stateId], [cityId], [geoLocation])
VALUES
  (1, 1, 1, geography::Point(47.4205, -122.3493, 4324)),
  (2, 2, 2, geography::Point(40.7128, -74.0040, 4324)),
  (3, 3, 3, geography::Point(51.5074, -0.1278, 4324)),
  (4, 4, 4, geography::Point(35.4895, 139.4917, 4324)),
  (5, 5, 5, geography::Point(-33.8451, 151.2094, 4324));

-- Inserting Users
INSERT INTO [dbo].[usersResponsibles] ([userId], [userName], [userApellido], [userEmail], [enabled], [password], [checksum]) 
VALUES
	(1, 'John', 'Doe', 'johndoe@example.com', 1, 'password123', NULL),
	(2, 'Jane', 'Doe', 'janedoe@example.com', 1, 'mypassword', NULL),
	(3, 'Alice', 'Smith', 'alicesmith@example.com', 1, 'letmein', NULL),
	(4, 'Bob', 'Johnson', 'bobjohnson@example.com', 1, 'test123', NULL),
	(5, 'Emily', 'Brown', 'emilybrown@example.com', 1, 'secretpassword', NULL);

-- Inserting Contract Status
INSERT INTO [dbo].[contractStatus] ([contractStatusName])
VALUES
	('Enabled'),
	('Disabled');

--Inserting Brands
INSERT INTO [dbo].[brands] ([brandName])
VALUES 
	('Samsung'), 
	('Apple'), 
	('LG'), 
	('Sony'), 
	('Google');

-- Inserting Models
INSERT INTO [dbo].[models] ([modelName])
VALUES 
	('Model 1'),
	('Model 2'),
	('Model 3');

-- Inserting measures
INSERT INTO [dbo].[measures] ([measureName])
VALUES 
	('Kilogramo'), 
	('Litro');

-- Inserting Container Types
INSERT INTO [dbo].[containerTypes] ([typeName], [brandId], [modelId], [capacity], [measureId])
VALUES
	('Type A', 1, 1, 10.5, 1),
	('Type B', 1, 1, 8.2, 1),
	('Type C', 1, 1, 15.0, 1),
	('Type D', 1, 1, 12.3, 1),
	('Type E', 1, 1, 7.9, 1);

-- Inserting Movement Types
INSERT INTO [dbo].[movementTypes] ([moveName])
VALUES 
	('Return'), 
	('Transfer');

-- Inserting Contract Status
INSERT INTO [dbo].[contractStatus] ([contractStatusName])
VALUES 
	('Enabled'), 
	('Disabled');


-- Inserting Contracts
INSERT INTO [dbo].[contracts] ([startDate], [endDate], [contractStatusId])
VALUES 
    ('2023-05-01', '2024-04-30', 1),
    ('2023-04-01', '2024-05-31', 1),
    ('2023-07-01', '2024-04-30', 1),
    ('2023-08-01', '2024-07-31', 1),
    ('2023-09-01', '2024-08-31', 1);


-- Inserting into containers
INSERT INTO [dbo].[containers] ([containerName], [description], [containerTypeId])
VALUES 
	('Container A', 'This is container A', 2),
	('Container B', 'This is container B', 2),
	('Container C', 'This is container C', 2),
	('Container D', 'This is container D', 2),
	('Container E', 'This is container E', 2);

-- Inserting Waste Types
INSERT INTO [dbo].[wasteTypes] ([typeName], [recyclable])
VALUES ( 'Paper', 1),
       ('Plastic', 0),
       ('Glass', 1),
       ( 'Metal', 0),
       ( 'Organic', 1)

-- Inserting Wastes
INSERT INTO [dbo].[wastes] ([wasteType], [wasteName])
VALUES 
    (1, 'Organic Waste'),
    (2, 'Plastic Waste'),
    (3, 'Metal Waste'),
     (4, 'Glass Waste'),
    (5, 'Paper Waste')

INSERT INTO [dbo].[containerActions]([actionName])
VALUES
 ('Cleaning')

INSERT INTO [dbo].[producers] ([producerName], [grade], [balance])
VALUES 
    ('John Doe', 8.5, 1000.00),
    ('Jane Smith', 7.8, 2500.00),
    ('Bob Johnson', 9.2, 500.00),
    ('Sarah Lee', 4.4, 750.00),
    ('David Kim', 8.9, 2000.00);

-- Inserting Car Types
INSERT INTO [dbo].carTypes ([carTypeName])
VALUES 
	('Automóvil'), 
	('4x4');

-- Inserting cars
INSERT INTO [dbo].[cars] ([carPlate], [carTypeId], [carCapacity])
VALUES 
    ('ABC123', 1, 100),
    ('DEF454', 1, 200),
    ('GHI789', 1, 300),
    ('JKL012', 1, 400),
    ('MNO345', 1, 500);

-- Inserting Countries
INSERT INTO [dbo].[countries] ([countryName])
VALUES ('United States'),
       ('Canada'),
       ('France'),
       ('Germany'),
       ('Japan');

-- Inserting States
INSERT INTO [dbo].[states] ([stateName], [countryId])
VALUES 
    ('California', 1),
    ('Texas', 1),
    ('New York', 1),
    ('Florida', 1),
    ('Illinois', 1)

-- Inserting Cities
INSERT INTO [dbo].[cities] ([zipcode], [stateId], [cityName])
VALUES 
	(12345, 1, 'New York'),
	(23454, 2, 'Los Angeles'),
	(34547, 3, 'Chicago'),
	(45478, 4, 'Houston'),
	(54789, 5, 'Miami');

-- Inserting Addresses
INSERT INTO [dbo].[addresses] ([countryId], [stateId], [cityId], [geoLocation])
VALUES
  (1, 1, 1, geography::Point(47.4205, -122.3493, 4324)),
  (2, 2, 2, geography::Point(40.7128, -74.0040, 4324)),
  (3, 3, 3, geography::Point(51.5074, -0.1278, 4324)),
  (4, 4, 4, geography::Point(35.4895, 139.4917, 4324)),
  (5, 5, 5, geography::Point(-33.8451, 151.2094, 4324));

-- Inserting Contract Status
INSERT INTO [dbo].[contractStatus] ([contractStatusName])
VALUES
	('Enabled'),
	('Disabled');

--Inserting Brands
INSERT INTO [dbo].[brands] ([brandName])
VALUES 
	('Samsung'), 
	('Apple'), 
	('LG'), 
	('Sony'), 
	('Google');

-- Inserting Models
INSERT INTO [dbo].[models] ([modelName])
VALUES 
	('Model 1'),
	('Model 2'),
	('Model 3');

-- Inserting measures
INSERT INTO [dbo].[measures] ([measureName])
VALUES 
	('Kilogramo'), 
	('Litro');

-- Inserting Container Types
INSERT INTO [dbo].[containerTypes] ([typeName], [brandId], [modelId], [capacity], [measureId])
VALUES
	('Type A', 1, 1, 10.5, 1),
	('Type B', 1, 1, 8.2, 1),
	('Type C', 1, 1, 15.0, 1),
	('Type D', 1, 1, 12.3, 1),
	('Type E', 1, 1, 7.9, 1);

-- Inserting Movement Types
INSERT INTO [dbo].[movementTypes] ([moveName])
VALUES 
	('Return'), 
	('Transfer');

-- Inserting Contract Status
INSERT INTO [dbo].[contractStatus] ([contractStatusName])
VALUES 
	('Enabled'), 
	('Disabled');


-- Inserting Contracts
INSERT INTO [dbo].[contracts] ([startDate], [endDate], [contractStatusId])
VALUES 
    ('2023-05-01', '2024-04-30', 1),
    ('2023-04-01', '2024-05-31', 1),
    ('2023-07-01', '2024-04-30', 1),
    ('2023-08-01', '2024-07-31', 1),
    ('2023-09-01', '2024-08-31', 1);


-- Inserting into containers
INSERT INTO [dbo].[containers] ([containerName], [description], [containerTypeId])
VALUES 
	('Container A', 'This is container A', 2),
	('Container B', 'This is container B', 2),
	('Container C', 'This is container C', 2),
	('Container D', 'This is container D', 2),
	('Container E', 'This is container E', 2);

-- Inserting Waste Types
INSERT INTO [dbo].[wasteTypes] ([typeName], [recyclable])
VALUES ( 'Paper', 1),
       ('Plastic', 0),
       ('Glass', 1),
       ( 'Metal', 0),
       ( 'Organic', 1)

-- Inserting Wastes
INSERT INTO [dbo].[wastes] ([wasteType], [wasteName])
VALUES 
    (1, 'Organic Waste'),
    (2, 'Plastic Waste'),
    (3, 'Metal Waste'),
     (4, 'Glass Waste'),
    (5, 'Paper Waste')

INSERT INTO [dbo].[containerActions]([actionName])
VALUES
 ('Cleaning')

