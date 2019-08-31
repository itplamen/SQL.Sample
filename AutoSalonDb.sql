USE master
GO

CREATE DATABASE AutoSalonDb
GO

USE AutoSalonDb
GO

------------------------------ Tables and data ------------------------------

CREATE TABLE Logs(
    Id INT IDENTITY NOT NULL,
	EntityId INT NOT NULL,
	TableName NVARCHAR(30) NOT NULL,
	Command NVARCHAR(30) NOT NULL CHECK(Command IN('INSERT', 'UPDATE', 'DELETE')),
	Description NVARCHAR(200) NULL,
	CreatedOn DATETIME NOT NULL DEFAULT(GETDATE()),
	CONSTRAINT PK_Logs PRIMARY KEY CLUSTERED (Id ASC),
);
GO

PRINT 'Created Logs table'
GO

CREATE TABLE Countries(
	Id INT IDENTITY NOT NULL,
	Name NVARCHAR(50) NOT NULL,
	Code NVARCHAR(3) NOT NULL,
	CreatedOn DATETIME NOT NULL DEFAULT(GETDATE()),
	ModifiedOn DATETIME NULL,
	IsDeleted BIT NOT NULL DEFAULT(0),
	DeletedOn DATETIME NULL,
	CONSTRAINT PK_Countries PRIMARY KEY CLUSTERED (Id ASC),
	CONSTRAINT AK_Countries_Name UNIQUE NONCLUSTERED (Name),
	CONSTRAINT AK_Countries_Code UNIQUE NONCLUSTERED (Code)
);
GO

CREATE NONCLUSTERED INDEX IX_Countries_Code ON Countries (Code)
GO

SET IDENTITY_INSERT Countries ON

INSERT INTO Countries(Id, Name, Code)
VALUES (1, 'United Kingdom', 'GBR')

INSERT INTO Countries(Id, Name, Code)
VALUES (2, 'Germany', 'DEU')

INSERT INTO Countries(Id, Name, Code)
VALUES (3, 'France', 'FRA')

INSERT INTO Countries(Id, Name, Code)
VALUES (4, 'Canada', 'CAN')

INSERT INTO Countries(Id, Name, Code)
VALUES (5, 'Spain', 'ESP')

INSERT INTO Countries(Id, Name, Code)
VALUES (6, 'Italy', 'ITA')

INSERT INTO Countries(Id, Name, Code)
VALUES (7, 'Japan', 'JPN')

SET IDENTITY_INSERT Countries OFF
GO

PRINT 'Created Countries table'
GO

CREATE TABLE Phones(
	Id INT IDENTITY NOT NULL,
	Phone NVARCHAR(20) NOT NULL CHECK (Phone NOT LIKE '%[^0-9]%'),
	CreatedOn DATETIME NOT NULL DEFAULT(GETDATE()),
	ModifiedOn DATETIME NULL,
	IsDeleted BIT NOT NULL DEFAULT(0),
	DeletedOn DATETIME NULL,
	CONSTRAINT PK_Phones PRIMARY KEY CLUSTERED (Id ASC),
	CONSTRAINT AK_Phones_Phone UNIQUE NONCLUSTERED (Phone)
);
GO

SET IDENTITY_INSERT Phones ON

INSERT INTO Phones(Id, Phone)
VALUES (1, '55519980731')

INSERT INTO Phones(Id, Phone)
VALUES (2, '035919990226')

INSERT INTO Phones(Id, Phone)
VALUES (3, '019991212')

INSERT INTO Phones(Id, Phone)
VALUES (4, '20000105')

INSERT INTO Phones(Id, Phone)
VALUES (5, '20000111')

INSERT INTO Phones(Id, Phone)
VALUES (6, '20000120')

INSERT INTO Phones(Id, Phone)
VALUES (7, '20000126')

INSERT INTO Phones(Id, Phone)
VALUES (8, '20000206')

INSERT INTO Phones(Id, Phone)
VALUES (9, '05520000206')

INSERT INTO Phones(Id, Phone)
VALUES (10, '20000207')

INSERT INTO Phones(Id, Phone)
VALUES (11, '8820000224')

INSERT INTO Phones(Id, Phone)
VALUES (12, '2550000303')

INSERT INTO Phones(Id, Phone)
VALUES (13, '200003051')

INSERT INTO Phones(Id, Phone)
VALUES (14, '20000321311')

INSERT INTO Phones(Id, Phone)
VALUES (15, '20000777323')

INSERT INTO Phones(Id, Phone)
VALUES (16, '20000366630')

INSERT INTO Phones(Id, Phone)
VALUES (17, '2000013411')

INSERT INTO Phones(Id, Phone)
VALUES (18, '200004178')

INSERT INTO Phones(Id, Phone)
VALUES (19, '200004291313')

INSERT INTO Phones(Id, Phone)
VALUES (20, '200166550102')

INSERT INTO Phones(Id, Phone)
VALUES (21, '209910010102')

INSERT INTO Phones(Id, Phone)
VALUES (22, '20010103765')

INSERT INTO Phones(Id, Phone)
VALUES (23, '200101313103')

INSERT INTO Phones(Id, Phone)
VALUES (24, '20010555103')

INSERT INTO Phones(Id, Phone)
VALUES (25, '2001010409191')

INSERT INTO Phones(Id, Phone)
VALUES (26, '2001033105')

INSERT INTO Phones(Id, Phone)
VALUES (27, '20066610105')

INSERT INTO Phones(Id, Phone)
VALUES (28, '200101051313')

INSERT INTO Phones(Id, Phone)
VALUES (29, '200532410106')

INSERT INTO Phones(Id, Phone)
VALUES (30, '200107641107')

INSERT INTO Phones(Id, Phone)
VALUES (31, '555191231980731')

INSERT INTO Phones(Id, Phone)
VALUES (32, '035312919990226')

INSERT INTO Phones(Id, Phone)
VALUES (33, '0199791212')

INSERT INTO Phones(Id, Phone)
VALUES (34, '20000121105')

INSERT INTO Phones(Id, Phone)
VALUES (35, '20131000111')

INSERT INTO Phones(Id, Phone)
VALUES (36, '20133000120')

INSERT INTO Phones(Id, Phone)
VALUES (37, '20001110126')

INSERT INTO Phones(Id, Phone)
VALUES (38, '200002013136')

INSERT INTO Phones(Id, Phone)
VALUES (39, '05511320000206')

INSERT INTO Phones(Id, Phone)
VALUES (40, '41244141414')

INSERT INTO Phones(Id, Phone)
VALUES (41, '14213313300')

INSERT INTO Phones(Id, Phone)
VALUES (42, '2550414000303')

INSERT INTO Phones(Id, Phone)
VALUES (43, '2014140003051')

INSERT INTO Phones(Id, Phone)
VALUES (44, '20014141400321311')

INSERT INTO Phones(Id, Phone)
VALUES (45, '200010777323')

INSERT INTO Phones(Id, Phone)
VALUES (46, '24366630')

INSERT INTO Phones(Id, Phone)
VALUES (47, '20143411')

INSERT INTO Phones(Id, Phone)
VALUES (48, '200004145178')

INSERT INTO Phones(Id, Phone)
VALUES (49, '2001004291313')

INSERT INTO Phones(Id, Phone)
VALUES (50, '20015')

INSERT INTO Phones(Id, Phone)
VALUES (51, '20955910010102')

INSERT INTO Phones(Id, Phone)
VALUES (52, '200152355')

INSERT INTO Phones(Id, Phone)
VALUES (53, '2025050101313103')

INSERT INTO Phones(Id, Phone)
VALUES (54, '225255555103')

INSERT INTO Phones(Id, Phone)
VALUES (55, '200105')

INSERT INTO Phones(Id, Phone)
VALUES (56, '200103255')

INSERT INTO Phones(Id, Phone)
VALUES (57, '20066610125505')

INSERT INTO Phones(Id, Phone)
VALUES (58, '2001252501051313')

INSERT INTO Phones(Id, Phone)
VALUES (59, '200525666')

INSERT INTO Phones(Id, Phone)
VALUES (60, '20066666')

SET IDENTITY_INSERT Phones OFF
GO

PRINT 'Created Phones table';
GO

CREATE TABLE Clients(
    Id INT IDENTITY NOT NULL,
    FirstName NVARCHAR(50) NOT NULL,
	LastName NVARCHAR(50) NOT NULL,
	Address NVARCHAR(100) NOT NULL,
	PhoneId INT NOT NULL,
	CountryId INT NOT NULL,
	CreatedOn DATETIME NOT NULL DEFAULT(GETDATE()),
	ModifiedOn DATETIME NULL,
	IsDeleted BIT NOT NULL DEFAULT(0),
	DeletedOn DATETIME NULL,
	CONSTRAINT PK_Clients PRIMARY KEY CLUSTERED (Id ASC),
	CONSTRAINT FK_Clients_Phones FOREIGN KEY (PhoneId) REFERENCES Phones (Id),
	CONSTRAINT FK_Clients_Countries FOREIGN KEY (CountryId) REFERENCES Countries (Id),
	CONSTRAINT AK_Clients_PhoneId UNIQUE NONCLUSTERED (PhoneId)
);
GO

CREATE NONCLUSTERED INDEX IX_Clients_Name ON Clients (FirstName, LastName)
GO

SET IDENTITY_INSERT Clients ON

INSERT INTO Clients(Id, FirstName, LastName, Address, PhoneId, CountryId)
VALUES (1, 'Guy', 'Gilbert', '108 Lakeside Court', 1, 1)

INSERT INTO Clients (Id, FirstName, LastName, Address, PhoneId, CountryId)
VALUES (2, 'Kevin', 'Brown', '1343 Prospect St', 2, 2)

INSERT INTO Clients (Id, FirstName, LastName, Address, PhoneId, CountryId)
VALUES (3, 'Roberto', 'Tamburello', '1648 Eastgate Lane', 3, 3)

INSERT INTO Clients (Id, FirstName, LastName, Address, PhoneId, CountryId)
VALUES (4, 'Rob', 'Walters', '2284 Azalea Avenue', 4, 4)

INSERT INTO Clients (Id, FirstName, LastName, Address, PhoneId, CountryId)
VALUES (5, 'Thierry', 'D''Hers', '2947 Vine Lane', 5, 5)

INSERT INTO Clients (Id, FirstName, LastName, Address, PhoneId, CountryId)
VALUES (6, 'David', 'Bradley', '3067 Maya', 6, 6)

INSERT INTO Clients (Id, FirstName, LastName, Address, PhoneId, CountryId)
VALUES (7, 'JoLynn', 'Dobney', '3197 Thornhill Place', 7, 7)

INSERT INTO Clients (Id, FirstName, LastName, Address, PhoneId, CountryId)
VALUES (8, 'Ruth', 'Ellerbrock', '3284 S. Blank Avenue', 8, 1)

INSERT INTO Clients (Id, FirstName, LastName, Address, PhoneId, CountryId)
VALUES (9, 'Gail', 'Erickson', '332 Laguna Niguel', 9, 2)

INSERT INTO Clients (Id, FirstName, LastName, Address, PhoneId, CountryId)
VALUES (10, 'Barry', 'Johnson', '3454 Bel Air Drive', 10, 3)

INSERT INTO Clients (Id, FirstName, LastName, Address, PhoneId, CountryId)
VALUES (11, 'Jossef', 'Goldberg', '3670 All Ways Drive', 11, 4)

INSERT INTO Clients (Id, FirstName, LastName, Address, PhoneId, CountryId)
VALUES (12, 'Terri', 'Duffy', '3708 Montana', 12, 5)

INSERT INTO Clients (Id, FirstName, LastName, Address, PhoneId, CountryId)
VALUES (13, 'Sidney', 'Higa', '3711 Rollingwood Dr', 13, 6)

INSERT INTO Clients (Id, FirstName, LastName, Address, PhoneId, CountryId)
VALUES (14, 'Taylor', 'Maxwell', '3919 Pinto Road', 14, 7)

INSERT INTO Clients (Id, FirstName, LastName, Address, PhoneId, CountryId)
VALUES (15, 'Jeffrey', 'Ford', '4311 Clay Rd', 15, 1)

INSERT INTO Clients (Id, FirstName, LastName, Address, PhoneId, CountryId)
VALUES (16, 'Jo', 'Brown', '4777 Rockne Drive', 16, 2)

INSERT INTO Clients (Id, FirstName, LastName, Address, PhoneId, CountryId)
VALUES (17, 'Doris', 'Hartwig', '5678 Clear Court', 17, 3)

INSERT INTO Clients (Id, FirstName, LastName, Address, PhoneId, CountryId)
VALUES (18, 'John', 'Campbell', '5863 Sierra', 18, 4)

INSERT INTO Clients (Id, FirstName, LastName, Address, PhoneId, CountryId)
VALUES (19, 'Diane', 'Glimp', '6058 Hill Street', 19, 5)

INSERT INTO Clients (Id, FirstName, LastName, Address, PhoneId, CountryId)
VALUES (20, 'Steven', 'Selikoff', '6118 Grasswood Circle', 20, 6)

INSERT INTO Clients (Id, FirstName, LastName, Address, PhoneId, CountryId)
VALUES (21, 'Peter', 'Krebs', '620 Woodside Ct.', 21, 7)

INSERT INTO Clients (Id, FirstName, LastName, Address, PhoneId, CountryId)
VALUES (22, 'Stuart', 'Munson', '6307 Greenbelt Way', 22, 1)

INSERT INTO Clients (Id, FirstName, LastName, Address, PhoneId, CountryId)
VALUES (23, 'Greg', 'Alderson', '6448 Castle Court', 23, 2)

INSERT INTO Clients (Id, FirstName, LastName, Address, PhoneId, CountryId)
VALUES (24, 'David', 'Johnson', '6774 Bonanza', 24, 3)

INSERT INTO Clients (Id, FirstName, LastName, Address, PhoneId, CountryId)
VALUES (25, 'Zheng', 'Mu', '6968 Wren Ave.', 25, 4)

INSERT INTO Clients (Id, FirstName, LastName, Address, PhoneId, CountryId)
VALUES (26, 'Ivo', 'Salmre', '7221 Peachwillow Street', 26, 5)

INSERT INTO Clients (Id, FirstName, LastName, Address, PhoneId, CountryId)
VALUES (27, 'Paul', 'Komosinski', '7270 Pepper Way', 27, 6)

INSERT INTO Clients (Id, FirstName, LastName, Address, PhoneId, CountryId)
VALUES (28, 'Ashvini', 'Sharma', '7396 Stratton Circle', 28, 7)

INSERT INTO Clients (Id, FirstName, LastName, Address, PhoneId, CountryId)
VALUES (29, 'Kendall', 'Keil', '7808 Brown St.', 29, 1)

INSERT INTO Clients (Id, FirstName, LastName, Address, PhoneId, CountryId)
VALUES (30, 'Paula', 'Barreto de Mattos', '7902 Grammercy Lane', 30, 2)

SET IDENTITY_INSERT Clients OFF
GO

PRINT 'Created Clients table'
GO

CREATE TABLE JobPositions(
	Id INT IDENTITY NOT NULL,
	Position NVARCHAR(50) NOT NULL,
	CreatedOn DATETIME NOT NULL DEFAULT(GETDATE()),
	ModifiedOn DATETIME NULL,
	IsDeleted BIT NOT NULL DEFAULT(0),
	DeletedOn DATETIME NULL,
	CONSTRAINT PK_JobPositions PRIMARY KEY CLUSTERED (Id ASC),
	CONSTRAINT AK_JobPositions_Position UNIQUE NONCLUSTERED (Position)  
);
GO

SET IDENTITY_INSERT JobPositions ON

INSERT INTO JobPositions (Id, Position)
VALUES (1, 'Junior Dealer')

INSERT INTO JobPositions (Id, Position)
VALUES (2, 'Senior Dealer')

INSERT INTO JobPositions (Id, Position)
VALUES (3, 'PR')

INSERT INTO JobPositions (Id, Position)
VALUES (4, 'CEO')

INSERT INTO JobPositions (Id, Position)
VALUES (5, 'Marketing Specialist')

SET IDENTITY_INSERT JobPositions OFF
GO

PRINT 'Created JobPositions table'
GO

CREATE TABLE Employees(
    Id INT IDENTITY NOT NULL,
	FirstName NVARCHAR(50) NOT NULL,
	LastName NVARCHAR(50) NOT NULL,
	Email NVARCHAR(50) NOT NULL CHECK (Email LIKE '%_@__%.__%'),
	JobPositionId INT NOT NULL,
	PhoneId INT NOT NULL,
	CreatedOn DATETIME NOT NULL DEFAULT(GETDATE()),
	ModifiedOn DATETIME NULL,
	IsDeleted BIT NOT NULL DEFAULT(0),
	DeletedOn DATETIME NULL,
	CONSTRAINT PK_Employees PRIMARY KEY CLUSTERED (Id ASC),
	CONSTRAINT FK_Employees_JobPositions FOREIGN KEY (JobPositionId) REFERENCES JobPositions (Id),
	CONSTRAINT FK_Employees_Phones FOREIGN KEY (PhoneId) REFERENCES Phones (Id),
	CONSTRAINT AK_Employees_PhoneId UNIQUE NONCLUSTERED (PhoneId)
);
GO

CREATE NONCLUSTERED INDEX IX_Employees_Names ON Employees (FirstName, LastName)
GO

CREATE NONCLUSTERED INDEX IX_Employees_Email ON Employees (Email)
GO

SET IDENTITY_INSERT Employees ON

INSERT INTO Employees (Id, FirstName, LastName, Email, JobPositionId, PhoneId)
VALUES (1, 'Alejandro', 'McGuel', 'alex@gmail.com', 4, 1)

INSERT INTO Employees (Id, FirstName, LastName, Email, JobPositionId, PhoneId)
VALUES (2, 'Garrett', 'Young', 'young@gg.com', 1, 2)

INSERT INTO Employees (Id, FirstName, LastName, Email, JobPositionId, PhoneId)
VALUES (3, 'Jian Shuo', 'Wang', 'wang@gmail.com', 1, 3)

INSERT INTO Employees (Id, FirstName, LastName, Email, JobPositionId, PhoneId)
VALUES (4, 'Susan', 'Eaton', 'dev@gmail.com', 1, 4)

INSERT INTO Employees (Id, FirstName, LastName, Email, JobPositionId, PhoneId)
VALUES (5, 'Vamsi', 'Kuppa', 'kuppa@gmail.com', 1, 5)

INSERT INTO Employees (Id, FirstName, LastName, Email, JobPositionId, PhoneId)
VALUES (6, 'Alice', 'Ciccu', 'ciccu@gmai.com', 1, 6)

INSERT INTO Employees (Id, FirstName, LastName, Email, JobPositionId, PhoneId)
VALUES (7, 'Simon', 'Rapier', 'simon@gmai.com', 2, 7)

INSERT INTO Employees (Id, FirstName, LastName, Email, JobPositionId, PhoneId)
VALUES (8, 'Jinghao', 'Liu', 'liu@gmai.com', 2, 8)

INSERT INTO Employees (Id, FirstName, LastName, Email, JobPositionId, PhoneId)
VALUES (9, 'Michael', 'Hines', 'hines@gmai.com', 2, 9)

INSERT INTO Employees (Id, FirstName, LastName, Email, JobPositionId, PhoneId)
VALUES (10, 'Yvonne', 'McKay', 'kay@mail.com', 2, 10)

INSERT INTO Employees (Id, FirstName, LastName, Email, JobPositionId, PhoneId)
VALUES (11, 'Peng', 'Wu', 'wu@gmai.com', 2, 11)

INSERT INTO Employees (Id, FirstName, LastName, Email, JobPositionId, PhoneId)
VALUES (12, 'Jean', 'Trenary', 'jea@dn.dd', 2, 12)

INSERT INTO Employees (Id, FirstName, LastName, Email, JobPositionId, PhoneId)
VALUES (13, 'Russell', 'Hunter', 'dev@ggg.cc', 3, 13)

INSERT INTO Employees (Id, FirstName, LastName, Email, JobPositionId, PhoneId)
VALUES (14, 'A. Scott', 'Wright', 'dev_d@gg.dda', 3, 14)

INSERT INTO Employees (Id, FirstName, LastName, Email, JobPositionId, PhoneId)
VALUES (15, 'Fred', 'Northup', 'fred@gmail.com', 3, 15)

INSERT INTO Employees (Id, FirstName, LastName, Email, JobPositionId, PhoneId)
VALUES (16, 'Sariya', 'Harnpadoungsataya', 'ss@gg.ddd', 3, 16)

INSERT INTO Employees (Id, FirstName, LastName, Email, JobPositionId, PhoneId)
VALUES (17, 'Willis', 'Johnson', 'will@gg.dev', 3, 17)

INSERT INTO Employees (Id, FirstName, LastName, Email, JobPositionId, PhoneId)
VALUES (18, 'Jun', 'Cao', 'cao@dd.com', 3, 18)

INSERT INTO Employees (Id, FirstName, LastName, Email, JobPositionId, PhoneId)
VALUES (19, 'Christian', 'Kleinerman', 'cri@gmail.com', 5, 19)

INSERT INTO Employees (Id, FirstName, LastName, Email, JobPositionId, PhoneId)
VALUES (20, 'Susan', 'Metters', 'susan@gg.dad', 5, 20)

INSERT INTO Employees (Id, FirstName, LastName, Email, JobPositionId, PhoneId)
VALUES (21, 'Reuben', 'D''sa', 'sa@gmail.com', 5, 21)

INSERT INTO Employees (Id, FirstName, LastName, Email, JobPositionId, PhoneId)
VALUES (22, 'Kirk', 'Koenigsbauer', 'kirk@dad.com', 5, 22)

INSERT INTO Employees (Id, FirstName, LastName, Email, JobPositionId, PhoneId)
VALUES (23, 'David', 'Ortiz', 'ortiz@gmail.com', 5, 23)

INSERT INTO Employees (Id, FirstName, LastName, Email, JobPositionId, PhoneId)
VALUES (24, 'Tengiz', 'Kharatishvili', 'dev3@gg.bg', 5, 24)

INSERT INTO Employees (Id, FirstName, LastName, Email, JobPositionId, PhoneId)
VALUES (25, 'Hanying', 'Feng', 'feng@feng.com', 1, 25)

INSERT INTO Employees (Id, FirstName, LastName, Email, JobPositionId, PhoneId)
VALUES (26, 'Kevin', 'Liu', 'kev@gg.vv', 2, 26)

INSERT INTO Employees (Id, FirstName, LastName, Email, JobPositionId, PhoneId)
VALUES (27, 'Annik', 'Stahl', 'annik@aa.mail', 1, 27)

INSERT INTO Employees (Id, FirstName, LastName, Email, JobPositionId, PhoneId)
VALUES (28, 'Suroor', 'Fatima', 'surror@gg.com', 2, 28)

INSERT INTO Employees (Id, FirstName, LastName, Email, JobPositionId, PhoneId)
VALUES (29, 'Deborah', 'Poe', 'poe@poe.bg', 1, 29)

INSERT INTO Employees (Id, FirstName, LastName, Email, JobPositionId, PhoneId)
VALUES (30, 'Jim', 'Scardelis', 'jim@jim.com', 2, 30)

SET IDENTITY_INSERT Employees OFF
GO

PRINT 'Created Employees table'
GO

CREATE TABLE Brands(
    Id INT IDENTITY NOT NULL,
	Brand NVARCHAR(50) NOT NULL,
	CountryId INT NOT NULL,
	CreatedOn DATETIME NOT NULL DEFAULT(GETDATE()),
	ModifiedOn DATETIME NULL,
	IsDeleted BIT NOT NULL DEFAULT(0),
	DeletedOn DATETIME NULL,
	CONSTRAINT PK_Brands PRIMARY KEY CLUSTERED (Id ASC),
	CONSTRAINT FK_Brands_Countries FOREIGN KEY (CountryId) REFERENCES Countries (Id),
	CONSTRAINT AK_Brands_Brand UNIQUE NONCLUSTERED (Brand)
);
GO

SET IDENTITY_INSERT Brands ON

INSERT INTO Brands (Id, Brand, CountryId)
VALUES (1, 'BMW', 2)

INSERT INTO Brands (Id, Brand, CountryId)
VALUES (2, 'Audi', 2)

INSERT INTO Brands (Id, Brand, CountryId)
VALUES (3, 'Seat', 5)

INSERT INTO Brands (Id, Brand, CountryId)
VALUES (4, 'Renault', 3)

SET IDENTITY_INSERT Brands OFF
GO

PRINT 'Created Brands table'
GO

CREATE TABLE Models(
    Id INT IDENTITY NOT NULL,
	Model NVARCHAR(50) NOT NULL,
	CreatedOn DATETIME NOT NULL DEFAULT(GETDATE()),
	ModifiedOn DATETIME NULL,
	IsDeleted BIT NOT NULL DEFAULT(0),
	DeletedOn DATETIME NULL,
	CONSTRAINT PK_Models PRIMARY KEY CLUSTERED (Id ASC),
	CONSTRAINT AK_Models_Model UNIQUE NONCLUSTERED (Model)
);
GO

SET IDENTITY_INSERT Models ON

INSERT INTO Models (Id, Model)
VALUES (1, 'M1')

INSERT INTO Models (Id, Model)
VALUES (2, 'M2')

INSERT INTO Models (Id, Model)
VALUES (3, 'R8')

INSERT INTO Models (Id, Model)
VALUES (4, 'TT')

INSERT INTO Models (Id, Model)
VALUES (5, 'M12')

INSERT INTO Models (Id, Model)
VALUES (6, 'Jet 8')

INSERT INTO Models (Id, Model)
VALUES (7, 'R18')

INSERT INTO Models (Id, Model)
VALUES (8, 'TT-mod')

INSERT INTO Models (Id, Model)
VALUES (9, 'FF888')

INSERT INTO Models (Id, Model)
VALUES (10, 'F-09')

INSERT INTO Models (Id, Model)
VALUES (11, 'F-10')

INSERT INTO Models (Id, Model)
VALUES (12, 'MP10')

INSERT INTO Models (Id, Model)
VALUES (13, 'F10PP')

INSERT INTO Models (Id, Model)
VALUES (14, 'R019')

INSERT INTO Models (Id, Model)
VALUES (15, 'FGH')

INSERT INTO Models (Id, Model)
VALUES (16, 'IT10')

SET IDENTITY_INSERT Models OFF
GO

PRINT 'Created Models table'
GO

CREATE TABLE Automobiles(
    Id INT IDENTITY NOT NULL,
	BrandId INT NOT NULL,
	ModelId INT NOT NULL,
	Year INT NOT NULL CHECK(Year >= 2010),
	Color NVARCHAR(20) NOT NULL,
	Price MONEY NOT NULL CHECK(Price >= 5000),
	Kilometers INT NOT NULL DEFAULT (0) CHECK(Kilometers >= 0),
	CreatedOn DATETIME NOT NULL DEFAULT(GETDATE()),
	ModifiedOn DATETIME NULL,
	IsDeleted BIT NOT NULL DEFAULT(0),
	DeletedOn DATETIME NULL,
	CONSTRAINT PK_Automobiles PRIMARY KEY CLUSTERED (Id ASC),
	CONSTRAINT FK_Automobiles_Brands FOREIGN KEY (BrandId) REFERENCES Brands(Id),
	CONSTRAINT FK_Automobiles_Models FOREIGN KEY (ModelId) REFERENCES Models(Id)
);
GO

CREATE NONCLUSTERED INDEX IX_Automobiles_ManufactureYear ON Automobiles (Year)
GO

CREATE NONCLUSTERED INDEX IX_Automobiles_Price ON Automobiles (Price)
GO

SET IDENTITY_INSERT Automobiles ON

INSERT INTO Automobiles (Id, BrandId, ModelId, Year, Color, Price, Kilometers)
VALUES (1, 1, 1, 2010, 'Green', 5123.23, 0)

INSERT INTO Automobiles (Id, BrandId, ModelId, Year, Color, Price, Kilometers)
VALUES (2, 1, 2, 2011, 'Black', 6000, 100000)

INSERT INTO Automobiles (Id, BrandId, ModelId, Year, Color, Price, Kilometers)
VALUES (3, 1, 3, 2010, 'White', 15000, 0)

INSERT INTO Automobiles (Id, BrandId, ModelId, Year, Color, Price, Kilometers)
VALUES (4, 1, 4, 2011, 'Blue', 20000.20, 30000)

INSERT INTO Automobiles (Id, BrandId, ModelId, Year, Color, Price, Kilometers)
VALUES (5, 2, 1, 2017, 'Red', 10000, 0)

INSERT INTO Automobiles (Id, BrandId, ModelId, Year, Color, Price, Kilometers)
VALUES (6, 2, 2, 2015, 'Black', 7777.99, 123000)

INSERT INTO Automobiles (Id, BrandId, ModelId, Year, Color, Price, Kilometers)
VALUES (7, 2, 3, 2010, 'White', 15000, 0)

INSERT INTO Automobiles (Id, BrandId, ModelId, Year, Color, Price, Kilometers)
VALUES (8, 2, 4, 2011, 'Black', 29000, 30000)

INSERT INTO Automobiles (Id, BrandId, ModelId, Year, Color, Price, Kilometers)
VALUES (9, 3, 1, 2018, 'Grey', 44444, 0)

INSERT INTO Automobiles (Id, BrandId, ModelId, Year, Color, Price, Kilometers)
VALUES (10, 3, 2, 2016, 'Brown', 60000, 100)

INSERT INTO Automobiles (Id, BrandId, ModelId, Year, Color, Price, Kilometers)
VALUES (11, 3, 3, 2010, 'Green', 5123.23, 11)

INSERT INTO Automobiles (Id, BrandId, ModelId, Year, Color, Price, Kilometers)
VALUES (12, 3, 4, 2012, 'Ligth Blue', 6000, 100000)

INSERT INTO Automobiles (Id, BrandId, ModelId, Year, Color, Price, Kilometers)
VALUES (13, 4, 1, 2010, 'White', 15000, 0)

INSERT INTO Automobiles (Id, BrandId, ModelId, Year, Color, Price, Kilometers)
VALUES (14, 4, 2, 2011, 'Black', 20000.20, 30000)

INSERT INTO Automobiles (Id, BrandId, ModelId, Year, Color, Price, Kilometers)
VALUES (15, 4, 3, 2017, 'White', 10000, 0)

INSERT INTO Automobiles (Id, BrandId, ModelId, Year, Color, Price, Kilometers)
VALUES (16, 4, 4, 2015, 'Dark Red', 7777.99, 123000)

INSERT INTO Automobiles (Id, BrandId, ModelId, Year, Color, Price, Kilometers)
VALUES (17, 4, 4, 2010, 'Pink', 15000, 0)

INSERT INTO Automobiles (Id, BrandId, ModelId, Year, Color, Price, Kilometers)
VALUES (18, 1, 1, 2011, 'Pink', 29000, 3000)

INSERT INTO Automobiles (Id, BrandId, ModelId, Year, Color, Price, Kilometers)
VALUES (19, 1, 2, 2017, 'Grey', 44444, 0)

INSERT INTO Automobiles (Id, BrandId, ModelId, Year, Color, Price, Kilometers)
VALUES (20, 1, 3, 2016, 'Black', 60000, 100)

INSERT INTO Automobiles (Id, BrandId, ModelId, Year, Color, Price, Kilometers)
VALUES (21, 1, 4, 2012, 'Green', 5123.23, 0)

INSERT INTO Automobiles (Id, BrandId, ModelId, Year, Color, Price, Kilometers)
VALUES (22, 2, 1, 2016, 'Dark Blue', 6000, 100000)

INSERT INTO Automobiles (Id, BrandId, ModelId, Year, Color, Price, Kilometers)
VALUES (23, 2, 2, 2010, 'White', 15000, 0)

INSERT INTO Automobiles (Id, BrandId, ModelId, Year, Color, Price, Kilometers)
VALUES (24, 2, 3, 2011, 'Black', 20000.20, 30000)

INSERT INTO Automobiles (Id, BrandId, ModelId, Year, Color, Price, Kilometers)
VALUES (25, 2, 4, 2017, 'Red', 10000, 0)

INSERT INTO Automobiles (Id, BrandId, ModelId, Year, Color, Price, Kilometers)
VALUES (26, 3, 1, 2015, 'Black', 7777.99, 123000)

INSERT INTO Automobiles (Id, BrandId, ModelId, Year, Color, Price, Kilometers)
VALUES (27, 3, 2, 2010, 'White', 15000, 0)

INSERT INTO Automobiles (Id, BrandId, ModelId, Year, Color, Price, Kilometers)
VALUES (28, 3, 3, 2011, 'Black', 29000, 30000)

INSERT INTO Automobiles (Id, BrandId, ModelId, Year, Color, Price, Kilometers)
VALUES (29, 3, 4, 2013, 'Brown', 44444, 0)

INSERT INTO Automobiles (Id, BrandId, ModelId, Year, Color, Price, Kilometers)
VALUES (30, 4, 1, 2016, 'Black', 60000, 1010)

INSERT INTO Automobiles (Id, BrandId, ModelId, Year, Color, Price, Kilometers)
VALUES (31, 4, 2, 2016, 'Black', 60000, 100000)

INSERT INTO Automobiles (Id, BrandId, ModelId, Year, Color, Price, Kilometers)
VALUES (32, 4, 3, 2016, 'Black', 12300, 0)

INSERT INTO Automobiles (Id, BrandId, ModelId, Year, Color, Price, Kilometers)
VALUES (33, 4, 4, 2016, 'Black', 60000, 100)

SET IDENTITY_INSERT Automobiles OFF
GO

PRINT 'Created Automobiles table'
GO

CREATE FUNCTION ufn_IsDealer(@employeeId INT)
	RETURNS BIT
AS
BEGIN
	DECLARE @dealerId INT, @true BIT, @false BIT

	SET @true = 1
	SET @false = 0

	SET @dealerId = (
		SELECT e.Id
		FROM Employees e
		JOIN JobPositions j ON e.JobPositionId = j.Id
		WHERE e.Id = @employeeId AND j.Position LIKE '%Dealer%')

	IF @dealerId = @employeeId
		RETURN @true

	RETURN @false
END
GO

CREATE TABLE Currencies(
	Id INT IDENTITY NOT NULL,
	Name NVARCHAR(30) NOT NULL,
	Symbol NVARCHAR(10) NOT NULL,
	Code NVARCHAR(10) NOT NULL,
	CreatedOn DATETIME NOT NULL DEFAULT(GETDATE()),
	ModifiedOn DATETIME NULL,
	IsDeleted BIT NOT NULL DEFAULT(0),
	DeletedOn DATETIME NULL,
	CONSTRAINT PK_Currencies PRIMARY KEY CLUSTERED (Id ASC),
	CONSTRAINT AK_Currencies_Name UNIQUE NONCLUSTERED (Name),
	CONSTRAINT AK_Currencies_Code UNIQUE NONCLUSTERED (Code)
);
GO

CREATE NONCLUSTERED INDEX IX_Currencies_Code ON Currencies (Code)
GO

SET IDENTITY_INSERT Currencies ON

INSERT INTO Currencies(Id, Name, Symbol, Code)
VALUES (1, 'US Dollars', '$', 'USD')

INSERT INTO Currencies(Id, Name, Symbol, Code)
VALUES (2, 'British Pound', '£', 'GBP')

INSERT INTO Currencies(Id, Name, Symbol, Code)
VALUES (3, 'Euro', '€', 'EUR')

INSERT INTO Currencies(Id, Name, Symbol, Code)
VALUES (4, 'Turkish Lira', 'TRL', 'TRY')

INSERT INTO Currencies(Id, Name, Symbol, Code)
VALUES (5, 'Russian Rouble', 'RUB', 'RUB')

INSERT INTO Currencies(Id, Name, Symbol, Code)
VALUES (6, 'Bitcoin', 'mBTC', 'mBTC')

INSERT INTO Currencies(Id, Name, Symbol, Code)
VALUES (7, 'Canadian Dollar', '$', 'CAD')

INSERT INTO Currencies(Id, Name, Symbol, Code)
VALUES (8, 'Chinese Yuan', '¥', 'CNY')

SET IDENTITY_INSERT Currencies OFF
GO

CREATE TABLE Sales(
    Id INT IDENTITY NOT NULL,
	ClientId INT NOT NULL,
	AutomobileId INT NOT NULL,
	EmployeeId INT NOT NULL CHECK(dbo.ufn_IsDealer(EmployeeId) = 1),
	CurrencyId INT NOT NULL,
	CreatedOn DATETIME NOT NULL DEFAULT GETDATE() CHECK(YEAR(CreatedOn) >= 2010),
	ModifiedOn DATETIME NULL,
	IsDeleted BIT NOT NULL DEFAULT(0),
	DeletedOn DATETIME NULL,
	CONSTRAINT PK_Sales PRIMARY KEY CLUSTERED (Id ASC),
	CONSTRAINT FK_Sales_Clients FOREIGN KEY (ClientId) REFERENCES Clients(Id),
	CONSTRAINT FK_Sales_Automobiles FOREIGN KEY (AutomobileId) REFERENCES Automobiles(Id),
	CONSTRAINT FK_Sales_Employees FOREIGN KEY (EmployeeId) REFERENCES Employees(Id),
	CONSTRAINT FK_Sales_Currencies FOREIGN KEY (CurrencyId) REFERENCES Currencies(Id),
	CONSTRAINT AK_Sales_AutomobileId UNIQUE NONCLUSTERED (AutomobileId)  
);
GO

CREATE TRIGGER tr_InsertClients ON Sales FOR INSERT AS
BEGIN
	INSERT INTO Logs(EntityId, TableName, Command, Description)
		SELECT Id, 'Sales', 'INSERT', 'Inserted new sale'
		FROM INSERTED
	PRINT 'Trigger fired. New inserted data in table Sales.'
END
GO

SET IDENTITY_INSERT Sales ON

INSERT INTO Sales (Id, ClientId, AutomobileId, EmployeeId, CurrencyId, CreatedOn)
VALUES (1, 1, 1, 2, 1, '2011-02-23')

INSERT INTO Sales (Id, ClientId, AutomobileId, EmployeeId, CurrencyId)
VALUES (2, 1, 2, 2, 2)

INSERT INTO Sales (Id, ClientId, AutomobileId, EmployeeId, CurrencyId)
VALUES (3, 1, 3, 2, 3)

INSERT INTO Sales (Id, ClientId, AutomobileId, EmployeeId, CurrencyId, CreatedOn)
VALUES (4, 1, 4, 2, 4, '2012-03-12')

INSERT INTO Sales (Id, ClientId, AutomobileId, EmployeeId, CurrencyId, CreatedOn)
VALUES (5, 1, 5, 2, 5, '2013-12-12')

INSERT INTO Sales (Id, ClientId, AutomobileId, EmployeeId, CurrencyId, CreatedOn)
VALUES (6, 2, 6, 3, 6, '2010-12-30')

INSERT INTO Sales (Id, ClientId, AutomobileId, EmployeeId, CurrencyId)
VALUES (7, 2, 7, 3, 7)

INSERT INTO Sales (Id, ClientId, AutomobileId, EmployeeId, CurrencyId)
VALUES (8, 2, 8, 3, 8)

INSERT INTO Sales (Id, ClientId, AutomobileId, EmployeeId, CurrencyId)
VALUES (9, 2, 9, 4, 1)

INSERT INTO Sales (Id, ClientId, AutomobileId, EmployeeId, CurrencyId, CreatedOn)
VALUES (10, 2, 10, 6, 2, '2018-03-12')

INSERT INTO Sales (Id, ClientId, AutomobileId, EmployeeId, CurrencyId)
VALUES (11, 3, 11, 6, 3)

INSERT INTO Sales (Id, ClientId, AutomobileId, EmployeeId, CurrencyId, CreatedOn)
VALUES (12, 3, 12, 6, 4, '2014-08-30')

INSERT INTO Sales (Id, ClientId, AutomobileId, EmployeeId, CurrencyId)
VALUES (13, 4, 13, 7, 5)

INSERT INTO Sales (Id, ClientId, AutomobileId, EmployeeId, CurrencyId, CreatedOn)
VALUES (14, 5, 14, 7, 6, '2015-09-02')

INSERT INTO Sales (Id, ClientId, AutomobileId, EmployeeId, CurrencyId, CreatedOn)
VALUES (15, 3, 15, 8, 7, '2017-04-14')

INSERT INTO Sales (Id, ClientId, AutomobileId, EmployeeId, CurrencyId, CreatedOn)
VALUES (16, 1, 16, 9, 8, '2012-03-12')

INSERT INTO Sales (Id, ClientId, AutomobileId, EmployeeId, CurrencyId, CreatedOn)
VALUES (17, 1, 17, 10, 1, '2012-03-12')

INSERT INTO Sales (Id, ClientId, AutomobileId, EmployeeId, CurrencyId)
VALUES (18, 2, 18, 11, 2)

INSERT INTO Sales (Id, ClientId, AutomobileId, EmployeeId, CurrencyId)
VALUES (19, 7, 19, 11, 3)

INSERT INTO Sales (Id, ClientId, AutomobileId, EmployeeId, CurrencyId, CreatedOn)
VALUES (20, 10, 20, 12, 4, '2016-12-16')

INSERT INTO Sales (Id, ClientId, AutomobileId, EmployeeId, CurrencyId)
VALUES (21, 1, 21, 25, 5)

INSERT INTO Sales (Id, ClientId, AutomobileId, EmployeeId, CurrencyId)
VALUES (22, 1, 22, 25, 6)

INSERT INTO Sales (Id, ClientId, AutomobileId, EmployeeId, CurrencyId)
VALUES (23, 2, 23, 26, 7)

INSERT INTO Sales (Id, ClientId, AutomobileId, EmployeeId, CurrencyId)
VALUES (24, 2, 24, 26, 8)

INSERT INTO Sales (Id, ClientId, AutomobileId, EmployeeId, CurrencyId)
VALUES (25, 1, 25, 27, 1)

INSERT INTO Sales (Id, ClientId, AutomobileId, EmployeeId, CurrencyId)
VALUES (26, 4, 26, 27, 2)

INSERT INTO Sales (Id, ClientId, AutomobileId, EmployeeId, CurrencyId)
VALUES (27, 2, 27, 27, 3)

INSERT INTO Sales (Id, ClientId, AutomobileId, EmployeeId, CurrencyId)
VALUES (28, 2, 28, 28, 4)

INSERT INTO Sales (Id, ClientId, AutomobileId, EmployeeId, CurrencyId)
VALUES (29, 7, 29, 29, 5)

INSERT INTO Sales (Id, ClientId, AutomobileId, EmployeeId, CurrencyId)
VALUES (30, 10, 30, 30, 6)

SET IDENTITY_INSERT Sales OFF
GO

PRINT 'Created Sales table'
GO

------------------------------------------------------------

CREATE PROCEDURE usp_SearchAutomobile
(
	@brand NVARCHAR(50), 
	@model NVARCHAR(50), 
	@color NVARCHAR(20), 
	@year INT, 
	@kilometers INT, 
	@price MONEY
)
AS
	SELECT a.Id, b.Brand + ' ' + m.Model AS [Automobile], a.Color, a.Kilometers, a.Price
	FROM Automobiles a
	JOIN Brands b ON a.BrandId = b.Id
	JOIN Models m ON a.ModelId = m.Id
	WHERE b.Brand = @brand AND 
		m.Model = @model AND 
		a.Color = @color AND 
		a.Year = @year AND 
		a.Kilometers = @kilometers AND 
		a.Price = @price
GO

-- Search for valid automobile
EXECUTE usp_SearchAutomobile 'Seat', 'M1', 'Grey', 2018, 0, 44444
GO 

------------------------------ Reports ------------------------------

CREATE FUNCTION ufn_CalculateDealerBonus(@price MONEY)
	RETURNS MONEY	
AS
BEGIN
	RETURN (@price * 20) / 100
END
GO

CREATE VIEW CompleteSalesReport
AS
	SELECT 
		s.Id,
		s.CreatedOn AS [Date], 
		b.Brand + ' ' + m.Model AS [Automobile], 
		CAST(a.Price AS NVARCHAR) + ' ' + cr.Code AS [Price],
		cl.Id AS [ClientId],
		cl.FirstName + ' ' + cl.LastName + ', From: ' + co.Name + ', Phone: ' + p.Phone AS [Client],
		e.Id as [DealerId],
		e.FirstName + ' ' + e.LastName + ', ' + jp.Position + ', Email: ' + e.Email AS [Dealer],
		CAST(dbo.ufn_CalculateDealerBonus(a.Price) AS NVARCHAR) + ' ' + cr.Code AS [Bonus]
	FROM Sales s
	JOIN Automobiles a ON s.AutomobileId = a.Id
	JOIN Brands b ON a.BrandId = b.Id
	JOIN Models m ON a.ModelId = m.Id
	JOIN Currencies cr ON s.CurrencyId = cr.Id
	JOIN Clients cl ON s.ClientId = cl.Id
	JOIN Countries co ON cl.CountryId = co.Id
	JOIN Phones p ON cl.PhoneId = p.Id
	JOIN Employees e ON s.EmployeeId = e.Id
	JOIN JobPositions jp ON e.JobPositionId = jp.Id
GO

CREATE PROCEDURE usp_SoldAutomobilesByDealer(@dealerId INT)
AS
	SELECT DealerId, Dealer, Automobile, Price, Bonus, Date
	FROM CompleteSalesReport
	WHERE DealerId = @dealerId
	ORDER BY Date ASC
GO

EXECUTE usp_SoldAutomobilesByDealer 2
GO

CREATE PROCEDURE usp_LastFiveSalesReport
AS
	SELECT * 
	FROM 
	(
		SELECT TOP(5) *
		FROM CompleteSalesReport
		ORDER BY Id DESC
	) d
	ORDER BY d.Price DESC
GO

EXECUTE usp_LastFiveSalesReport
GO

CREATE PROCEDURE usp_BoughtAutomobilesByClientReport(@clientId INT)
AS
	SELECT *
	FROM CompleteSalesReport
	WHERE ClientId = @clientId
GO

EXECUTE usp_BoughtAutomobilesByClientReport 2
GO

CREATE PROCEDURE usp_SalesByPeriodReport(@from DATETIME, @to DATETIME)
AS
	SELECT *
	FROM CompleteSalesReport
	WHERE Date >= @from AND Date <= @to
GO

EXECUTE usp_SalesByPeriodReport '2010-02-23', '2014-02-23'
GO

CREATE TRIGGER tr_DeleteFiredEmployees ON Employees INSTEAD OF DELETE AS
BEGIN
	DECLARE @id INT
	SET @id = (SELECT Id FROM DELETED)

	UPDATE e
	SET e.IsDeleted = 1, e.DeletedOn = GETDATE()
	FROM Employees e
	JOIN DELETED d ON e.Id = d.Id
	WHERE e.IsDeleted IS NULL OR e.IsDeleted = 0

	INSERT INTO Logs(EntityId, TableName, Command, Description)
		SELECT @id, 'Employees', 'DELETE', 'The employee has been fired'

	PRINT CONCAT('Trigger fired. Deleted employee with Id ', @id)
END
GO

DELETE FROM Employees
WHERE Id = 10
GO

CREATE TRIGGER tr_UpdateClients ON Clients FOR UPDATE AS
BEGIN
	INSERT INTO Logs(EntityId, TableName, Command, Description)
		SELECT Id, 'Clients', 'UPDATE', 'Selected from INSERTED table'
		FROM INSERTED
	
	INSERT INTO Logs(EntityId, TableName, Command, Description)
		SELECT Id, 'Clients', 'UPDATE', 'Selected from DELETED table'
		FROM DELETED

	UPDATE Clients
	SET ModifiedOn = GETDATE()
	WHERE Id = (SELECT Id FROM INSERTED)

	PRINT 'Trigger fired. New updated data from table Clients'
END
GO

UPDATE Clients
SET FirstName = 'Test', LastName = 'Test', Address = 'Sofia, bl. Hristo Blagoev, str. Levski 1'
WHERE Id = 4
GO

DECLARE salesInfoCursor CURSOR READ_ONLY FOR
    SELECT Id, Date, Automobile, Price, Client, Dealer
	FROM CompleteSalesReport
	ORDER BY Date ASC
GO

OPEN salesInfoCursor
GO

DECLARE @id INT,
		@date DATETIME, 
        @automobile NVARCHAR(50),
        @price NVARCHAR(50),
        @client NVARCHAR(100),
		@dealer NVARCHAR(100)

FETCH NEXT FROM salesInfoCursor INTO @id, @date, @automobile, @price, @client, @dealer

WHILE (@@FETCH_STATUS) = 0
	BEGIN
		PRINT CAST(@id AS NVARCHAR) + '. -> ' + CONVERT(NVARCHAR, @date, 103) + ', automobile info -> ' + @automobile + ' ' + @price  + ', client -> ' + @client + ', dealer - > ' + @dealer  
		FETCH NEXT FROM salesInfoCursor INTO @id, @date, @automobile, @price, @client, @dealer
	END

CLOSE salesInfoCursor
DEALLOCATE salesInfoCursor
GO