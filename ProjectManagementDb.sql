USE master
GO

CREATE DATABASE ProjectManagementDb
GO

PRINT 'Created ProjectManagementDb database'
GO

USE ProjectManagementDb
GO

------------------------------ Tables and data ------------------------------
CREATE TABLE Towns(
	Id INT IDENTITY NOT NULL,
	Name NVARCHAR(50) NOT NULL,
	CONSTRAINT PK_Towns PRIMARY KEY CLUSTERED (Id ASC),
	CONSTRAINT AK_Towns_Name UNIQUE NONCLUSTERED (Name)
);
GO

SET IDENTITY_INSERT Towns ON

INSERT INTO Towns (Id, Name)
VALUES (1, 'Rome')

INSERT INTO Towns (Id, Name)
VALUES (2, 'Calgary')

INSERT INTO Towns (Id, Name)
VALUES (3, 'Madrid')

INSERT INTO Towns (Id, Name)
VALUES (4, 'Seattle')

INSERT INTO Towns (Id, Name)
VALUES (5, 'Bellevue')

INSERT INTO Towns (Id, Name)
VALUES (6, 'Issaquah')

INSERT INTO Towns (Id, Name)
VALUES (7, 'Everett')

INSERT INTO Towns (Id, Name)
VALUES (8, 'Bothell')

INSERT INTO Towns (Id, Name)
VALUES (9, 'San Francisco')

INSERT INTO Towns (Id, Name)
VALUES (10, 'London')

INSERT INTO Towns (Id, Name)
VALUES (11, 'Snohomish')

INSERT INTO Towns (Id, Name)
VALUES (12, 'Monroe')

INSERT INTO Towns (Id, Name)
VALUES (13, 'Renton')

INSERT INTO Towns (Id, Name)
VALUES (14, 'Newport Hills')

INSERT INTO Towns (Id, Name)
VALUES (15, 'Carnation')

INSERT INTO Towns (Id, Name)
VALUES (16, 'Sammamish')

INSERT INTO Towns (Id, Name)
VALUES (17, 'Duvall')

INSERT INTO Towns (Id, Name)
VALUES (18, 'Gold Bar')

INSERT INTO Towns (Id, Name)
VALUES (19, 'Nevada')

INSERT INTO Towns (Id, Name)
VALUES (20, 'Kenmore')

INSERT INTO Towns (Id, Name)
VALUES (21, 'Melbourne')

INSERT INTO Towns (Id, Name)
VALUES (22, 'Kent')

INSERT INTO Towns (Id, Name)
VALUES (23, 'Cambridge')

INSERT INTO Towns (Id, Name)
VALUES (24, 'Minneapolis')

INSERT INTO Towns (Id, Name)
VALUES (25, 'Portland')

INSERT INTO Towns (Id, Name)
VALUES (26, 'Duluth')

INSERT INTO Towns (Id, Name)
VALUES (27, 'Detroit')

INSERT INTO Towns (Id, Name)
VALUES (28, 'Memphis')

INSERT INTO Towns (Id, Name)
VALUES (29, 'Ottawa')

INSERT INTO Towns (Id, Name)
VALUES (30, 'Bordeaux')

SET IDENTITY_INSERT Towns OFF
GO

PRINT 'Created Towns table and added data'
GO

CREATE TABLE Addresses(
	Id INT IDENTITY NOT NULL,
	Address NVARCHAR(100) NOT NULL,
	TownId INT NOT NULL,
	CONSTRAINT PK_Addresses PRIMARY KEY CLUSTERED (Id ASC),
	CONSTRAINT FK_Addresses_Towns FOREIGN KEY (TownId) REFERENCES Towns (Id)
);
GO 

SET IDENTITY_INSERT Addresses ON

INSERT INTO Addresses (Id, Address, TownId)
VALUES (1, '108 Lakeside Court', 1)

INSERT INTO Addresses (Id, Address, TownId)
VALUES (2, '1343 Prospect St', 2)

INSERT INTO Addresses (Id, Address, TownId)
VALUES (3, '1648 Eastgate Lane', 3)

INSERT INTO Addresses (Id, Address, TownId)
VALUES (4, '2284 Azalea Avenue', 4)

INSERT INTO Addresses (Id, Address, TownId)
VALUES (5, '2947 Vine Lane', 5)

INSERT INTO Addresses (Id, Address, TownId)
VALUES (6, '3067 Maya', 6)

INSERT INTO Addresses (Id, Address, TownId)
VALUES (7, '3197 Thornhill Place', 7)

INSERT INTO Addresses (Id, Address, TownId)
VALUES (8, '3284 S. Blank Avenue', 8)

INSERT INTO Addresses (Id, Address, TownId)
VALUES (9, '332 Laguna Niguel', 9)

INSERT INTO Addresses (Id, Address, TownId)
VALUES (10, '3454 Bel Air Drive', 10)

INSERT INTO Addresses (Id, Address, TownId)
VALUES (11, '3670 All Ways Drive', 11)

INSERT INTO Addresses (Id, Address, TownId)
VALUES (12, '3708 Montana', 12)

INSERT INTO Addresses (Id, Address, TownId)
VALUES (13, '3711 Rollingwood Dr', 13)

INSERT INTO Addresses (Id, Address, TownId)
VALUES (14, '3919 Pinto Road', 14)

INSERT INTO Addresses (Id, Address, TownId)
VALUES (15, '4311 Clay Rd', 15)

INSERT INTO Addresses (Id, Address, TownId)
VALUES (16, '4777 Rockne Drive', 16)

INSERT INTO Addresses (Id, Address, TownId)
VALUES (17, '5678 Clear Court', 17)

INSERT INTO Addresses (Id, Address, TownId)
VALUES (18, '5863 Sierra', 18)

INSERT INTO Addresses (Id, Address, TownId)
VALUES (19, '6058 Hill Street', 19)

INSERT INTO Addresses (Id, Address, TownId)
VALUES (20, '6118 Grasswood Circle', 20)

INSERT INTO Addresses (Id, Address, TownId)
VALUES (21, '620 Woodside Ct.', 21)

INSERT INTO Addresses (Id, Address, TownId)
VALUES (22, '6307 Greenbelt Way', 22)

INSERT INTO Addresses (Id, Address, TownId)
VALUES (23, '6448 Castle Court', 23)

INSERT INTO Addresses (Id, Address, TownId)
VALUES (24, '6774 Bonanza', 24)

INSERT INTO Addresses (Id, Address, TownId)
VALUES (25, '6968 Wren Ave.', 25)

INSERT INTO Addresses (Id, Address, TownId)
VALUES (26, '7221 Peachwillow Street', 26)

INSERT INTO Addresses (Id, Address, TownId)
VALUES (27, '7270 Pepper Way', 27)

INSERT INTO Addresses (Id, Address, TownId)
VALUES (28, '7396 Stratton Circle', 28)

INSERT INTO Addresses (Id, Address, TownId)
VALUES (29, '7808 Brown St.', 29)

INSERT INTO Addresses (Id, Address, TownId)
VALUES (30, '7902 Grammercy Lane', 30)

SET IDENTITY_INSERT Addresses OFF
GO

PRINT 'Created Addresses table and added data'
GO

CREATE TABLE Clients(
    Id INT IDENTITY NOT NULL,
    FirstName NVARCHAR(50) NOT NULL,
	LastName NVARCHAR(50) NOT NULL,
	AddressId INT NOT NULL,
	Phone NVARCHAR(20) NOT NULL CHECK (Phone NOT LIKE '%[^0-9]%'),
	CONSTRAINT PK_Clients PRIMARY KEY CLUSTERED (Id ASC),
	CONSTRAINT FK_Clients_Addresses FOREIGN KEY (AddressId) REFERENCES Addresses (Id),
	CONSTRAINT AK_Clients_Phone UNIQUE NONCLUSTERED (Phone)
);
GO

CREATE NONCLUSTERED INDEX IX_Clients_Name ON Clients (FirstName, LastName)
GO

SET IDENTITY_INSERT Clients ON

INSERT INTO Clients(Id, FirstName, LastName, AddressId, Phone)
VALUES (1, 'Guy', 'Gilbert', 1, '55519980731')

INSERT INTO Clients (Id, FirstName, LastName, AddressId, Phone)
VALUES (2, 'Kevin', 'Brown', 2, '035919990226')

INSERT INTO Clients (Id, FirstName, LastName, AddressId, Phone)
VALUES (3, 'Roberto', 'Tamburello', 3, '019991212')

INSERT INTO Clients (Id, FirstName, LastName, AddressId, Phone)
VALUES (4, 'Rob', 'Walters', 4, '20000105')

INSERT INTO Clients (Id, FirstName, LastName, AddressId, Phone)
VALUES (5, 'Thierry', 'D''Hers', 5, '20000111')

INSERT INTO Clients (Id, FirstName, LastName, AddressId, Phone)
VALUES (6, 'David', 'Bradley', 6, '20000120')

INSERT INTO Clients (Id, FirstName, LastName, AddressId, Phone)
VALUES (7, 'JoLynn', 'Dobney', 7, '20000126')

INSERT INTO Clients (Id, FirstName, LastName, AddressId, Phone)
VALUES (8, 'Ruth', 'Ellerbrock', 8, '20000206')

INSERT INTO Clients (Id, FirstName, LastName, AddressId, Phone)
VALUES (9, 'Gail', 'Erickson', 9, '05520000206')

INSERT INTO Clients (Id, FirstName, LastName, AddressId, Phone)
VALUES (10, 'Barry', 'Johnson', 10, '20000207')

INSERT INTO Clients (Id, FirstName, LastName, AddressId, Phone)
VALUES (11, 'Jossef', 'Goldberg', 11, '8820000224')

INSERT INTO Clients (Id, FirstName, LastName, AddressId, Phone)
VALUES (12, 'Terri', 'Duffy', 12, '2550000303')

INSERT INTO Clients (Id, FirstName, LastName, AddressId, Phone)
VALUES (13, 'Sidney', 'Higa', 13, '200003051')

INSERT INTO Clients (Id, FirstName, LastName, AddressId, Phone)
VALUES (14, 'Taylor', 'Maxwell', 14, '20000321311')

INSERT INTO Clients (Id, FirstName, LastName, AddressId, Phone)
VALUES (15, 'Jeffrey', 'Ford', 15, '20000777323')

INSERT INTO Clients (Id, FirstName, LastName, AddressId, Phone)
VALUES (16, 'Jo', 'Brown', 16, '20000366630')

INSERT INTO Clients (Id, FirstName, LastName, AddressId, Phone)
VALUES (17, 'Doris', 'Hartwig', 17, '2000013411')

INSERT INTO Clients (Id, FirstName, LastName, AddressId, Phone)
VALUES (18, 'John', 'Campbell', 18, '200004178')

INSERT INTO Clients (Id, FirstName, LastName, AddressId, Phone)
VALUES (19, 'Diane', 'Glimp', 19, '200004291313')

INSERT INTO Clients (Id, FirstName, LastName, AddressId, Phone)
VALUES (20, 'Steven', 'Selikoff', 20, '200166550102')

INSERT INTO Clients (Id, FirstName, LastName, AddressId, Phone)
VALUES (21, 'Peter', 'Krebs', 21, '209910010102')

INSERT INTO Clients (Id, FirstName, LastName, AddressId, Phone)
VALUES (22, 'Stuart', 'Munson', 22, '20010103765')

INSERT INTO Clients (Id, FirstName, LastName, AddressId, Phone)
VALUES (23, 'Greg', 'Alderson', 23, '200101313103')

INSERT INTO Clients (Id, FirstName, LastName, AddressId, Phone)
VALUES (24, 'David', 'Johnson', 24, '20010555103')

INSERT INTO Clients (Id, FirstName, LastName, AddressId, Phone)
VALUES (25, 'Zheng', 'Mu', 25, '2001010409191')

INSERT INTO Clients (Id, FirstName, LastName, AddressId, Phone)
VALUES (26, 'Ivo', 'Salmre', 26, '2001033105')

INSERT INTO Clients (Id, FirstName, LastName, AddressId, Phone)
VALUES (27, 'Paul', 'Komosinski', 27, '20066610105')

INSERT INTO Clients (Id, FirstName, LastName, AddressId, Phone)
VALUES (28, 'Ashvini', 'Sharma', 28, '200101051313')

INSERT INTO Clients (Id, FirstName, LastName, AddressId, Phone)
VALUES (29, 'Kendall', 'Keil', 29, '200532410106')

INSERT INTO Clients (Id, FirstName, LastName, AddressId, Phone)
VALUES (30, 'Paula', 'Barreto de Mattos', 30, '200107641107')

SET IDENTITY_INSERT Clients OFF
GO

PRINT 'Created Clients table and added data'
GO

CREATE TABLE JobPositions(
	Id INT IDENTITY NOT NULL,
	Position NVARCHAR(50) NOT NULL,
	CONSTRAINT PK_Positions PRIMARY KEY CLUSTERED (Id ASC),
	CONSTRAINT AK_Positions_Position UNIQUE NONCLUSTERED (Position)
);
GO

SET IDENTITY_INSERT JobPositions ON

INSERT INTO JobPositions (Id, Position)
VALUES (1, 'Project Manager')

INSERT INTO JobPositions (Id, Position)
VALUES (2, 'Team Leader')

INSERT INTO JobPositions (Id, Position)
VALUES (3, 'Junior Developer')

INSERT INTO JobPositions (Id, Position)
VALUES (4, 'Senior Developer')

SET IDENTITY_INSERT JobPositions OFF
GO

PRINT 'Created JobPositions table and added data'
GO

CREATE TABLE Departments(
	Id INT IDENTITY NOT NULL,
	Department NVARCHAR(50) NOT NULL,
	CONSTRAINT PK_Departments PRIMARY KEY CLUSTERED (Id ASC),
	CONSTRAINT AK_Departments_Department UNIQUE NONCLUSTERED (Department)
);
GO

SET IDENTITY_INSERT Departments ON

INSERT INTO Departments (Id, Department)
VALUES (1, 'Development')

INSERT INTO Departments (Id, Department)
VALUES (2, 'Stability and Performance')

INSERT INTO Departments (Id, Department)
VALUES (3, 'Front-End')

INSERT INTO Departments (Id, Department)
VALUES (4, 'Marketing')

INSERT INTO Departments (Id, Department)
VALUES (5, 'Sales')

INSERT INTO Departments (Id, Department)
VALUES (6, 'Human Resources')

SET IDENTITY_INSERT Departments OFF
GO

PRINT 'Created Departments table and added data'
GO

CREATE TABLE Employees(
	Id INT IDENTITY NOT NULL,
	FirstName NVARCHAR(50) NOT NULL,
	LastName NVARCHAR(50) NOT NULL,
	Email NVARCHAR(50) NOT NULL CHECK (Email LIKE '%_@__%.__%'),
	HireDate SMALLDATETIME NULL,
	Salary MONEY NULL,
	DepartmentId INT NOT NULL,
	JobPositionId INT NOT NULL,
	CONSTRAINT PK_Employees PRIMARY KEY CLUSTERED (Id ASC),
	CONSTRAINT FK_Employees_Departments FOREIGN KEY (DepartmentId) REFERENCES Departments (Id),
	CONSTRAINT FK_Employees_JobPositions FOREIGN KEY (JobPositionId) REFERENCES JobPositions (Id),
	CONSTRAINT AK_Employees_Email UNIQUE NONCLUSTERED (Email)
);
GO

CREATE NONCLUSTERED INDEX IX_Employees_Name ON Employees (FirstName, LastName)
GO

CREATE NONCLUSTERED INDEX IX_Employees_Email ON Employees (Email)
GO

SET IDENTITY_INSERT Employees ON

INSERT INTO Employees (Id, FirstName, LastName, Email, HireDate, Salary, DepartmentId, JobPositionId)
VALUES (1, 'Alejandro', 'McGuel', 'alex@gmail.com', '20010107', 15000, 1, 1)

INSERT INTO Employees (Id, FirstName, LastName, Email, HireDate, Salary, DepartmentId, JobPositionId)
VALUES (2, 'Garrett', 'Young', 'young@gg.com', '20010108', 5500, 1, 2)

INSERT INTO Employees (Id, FirstName, LastName, Email, HireDate, Salary, DepartmentId, JobPositionId)
VALUES (3, 'Jian Shuo', 'Wang', 'wang@gmail.com', '20010108', 1500, 1, 3)

INSERT INTO Employees (Id, FirstName, LastName, Email, HireDate, Salary, DepartmentId, JobPositionId)
VALUES (4, 'Susan', 'Eaton', 'dev@gmail.com', '20010108', 9000, 1, 4)

INSERT INTO Employees (Id, FirstName, LastName, Email, HireDate, Salary, DepartmentId, JobPositionId)
VALUES (5, 'Vamsi', 'Kuppa', 'kuppa@gmail.com', '20010108', 12000, 1, 1)

INSERT INTO Employees (Id, FirstName, LastName, Email, HireDate, Salary, DepartmentId, JobPositionId)
VALUES (6, 'Alice', 'Ciccu', 'ciccu@gmai.com', '20010108', 4000, 1, 2)

INSERT INTO Employees (Id, FirstName, LastName, Email, HireDate, Salary, DepartmentId, JobPositionId)
VALUES (7, 'Simon', 'Rapier', 'simon@gmai.com', '20010109', 1700, 1, 3)

INSERT INTO Employees (Id, FirstName, LastName, Email, HireDate, Salary, DepartmentId, JobPositionId)
VALUES (8, 'Jinghao', 'Liu', 'liu@gmai.com', '20010109', 3000, 1, 4)

INSERT INTO Employees (Id, FirstName, LastName, Email, HireDate, Salary, DepartmentId, JobPositionId)
VALUES (9, 'Michael', 'Hines', 'hines@gmai.com', NULL, NULL, 1, 1)

INSERT INTO Employees (Id, FirstName, LastName, Email, HireDate, Salary, DepartmentId, JobPositionId)
VALUES (10, 'Yvonne', 'McKay', 'kay@mail.com', NULL, NULL, 1, 2)

INSERT INTO Employees (Id, FirstName, LastName, Email, HireDate, Salary, DepartmentId, JobPositionId)
VALUES (11, 'Peng', 'Wu', 'wu@gmai.com', NULL, NULL, 1, 3)

INSERT INTO Employees (Id, FirstName, LastName, Email, HireDate, Salary, DepartmentId, JobPositionId)
VALUES (12, 'Jean', 'Trenary', 'jea@dn.dd', NULL, NULL, 1, 4)

INSERT INTO Employees (Id, FirstName, LastName, Email, HireDate, Salary, DepartmentId, JobPositionId)
VALUES (13, 'Russell', 'Hunter', 'dev@ggg.cc', '20010113', 11000, 1, 1)

INSERT INTO Employees (Id, FirstName, LastName, Email, HireDate, Salary, DepartmentId, JobPositionId)
VALUES (14, 'A. Scott', 'Wright', 'dev_d@gg.dda', '20010113', 6000, 1, 2)

INSERT INTO Employees (Id, FirstName, LastName, Email, HireDate, Salary, DepartmentId, JobPositionId)
VALUES (15, 'Fred', 'Northup', 'fred@gmail.com', '20010113', 1500, 1, 3)

INSERT INTO Employees (Id, FirstName, LastName, Email, HireDate, Salary, DepartmentId, JobPositionId)
VALUES (16, 'Sariya', 'Harnpadoungsataya', 'ss@gg.ddd', '20010113', 4400, 1, 4)

INSERT INTO Employees (Id, FirstName, LastName, Email, HireDate, Salary, DepartmentId, JobPositionId)
VALUES (17, 'Willis', 'Johnson', 'will@gg.dev', '20010114', 8830.99, 1, 1)

INSERT INTO Employees (Id, FirstName, LastName, Email, HireDate, Salary, DepartmentId, JobPositionId)
VALUES (18, 'Jun', 'Cao', 'cao@dd.com', '20010115', 66000.12, 1, 2)

INSERT INTO Employees (Id, FirstName, LastName, Email, HireDate, Salary, DepartmentId, JobPositionId)
VALUES (19, 'Christian', 'Kleinerman', 'cri@gmail.com', '20010115', 1400.50, 1, 3)

INSERT INTO Employees (Id, FirstName, LastName, Email, HireDate, Salary, DepartmentId, JobPositionId)
VALUES (20, 'Susan', 'Metters', 'susan@gg.dad', '20010115', 9500, 1, 4)

INSERT INTO Employees (Id, FirstName, LastName, Email, HireDate, Salary, DepartmentId, JobPositionId)
VALUES (21, 'Reuben', 'D''sa', 'sa@gmail.com', NULL, NULL, 1, 1)

INSERT INTO Employees (Id, FirstName, LastName, Email, HireDate, Salary, DepartmentId, JobPositionId)
VALUES (22, 'Kirk', 'Koenigsbauer', 'kirk@dad.com', NULL, NULL, 1, 2)

INSERT INTO Employees (Id, FirstName, LastName, Email, HireDate, Salary, DepartmentId, JobPositionId)
VALUES (23, 'David', 'Ortiz', 'ortiz@gmail.com', NULL, NULL, 1, 3)

INSERT INTO Employees (Id, FirstName, LastName, Email, HireDate, Salary, DepartmentId, JobPositionId)
VALUES (24, 'Tengiz', 'Kharatishvili', 'dev3@gg.bg', NULL, NULL, 1, 4)

INSERT INTO Employees (Id, FirstName, LastName, Email, HireDate, Salary, DepartmentId, JobPositionId)
VALUES (25, 'Hanying', 'Feng', 'feng@feng.com', '20010117', 14000, 1, 1)

INSERT INTO Employees (Id, FirstName, LastName, Email, HireDate, Salary, DepartmentId, JobPositionId)
VALUES (26, 'Kevin', 'Liu', 'kev@gg.vv', '20010118', 15000, 1, 2)

INSERT INTO Employees (Id, FirstName, LastName, Email, HireDate, Salary, DepartmentId, JobPositionId)
VALUES (27, 'Annik', 'Stahl', 'annik@aa.mail', '20010118', 1200, 1, 3)

INSERT INTO Employees (Id, FirstName, LastName, Email, HireDate, Salary, DepartmentId, JobPositionId)
VALUES (28, 'Suroor', 'Fatima', 'surror@gg.com', '20010118', 5000, 1, 4)

INSERT INTO Employees (Id, FirstName, LastName, Email, HireDate, Salary, DepartmentId, JobPositionId)
VALUES (29, 'Deborah', 'Poe', 'poe@poe.bg', '20010119', 19000, 1, 1)

INSERT INTO Employees (Id, FirstName, LastName, Email, HireDate, Salary, DepartmentId, JobPositionId)
VALUES (30, 'Jim', 'Scardelis', 'jim@jim.com', '20010120', 11000, 1, 2)

SET IDENTITY_INSERT Employees OFF
GO

PRINT 'Created Employees table and added data'
GO

CREATE FUNCTION ufn_IsManager (@id INT)
	RETURNS BIT	
AS
BEGIN
	DECLARE @result INT, @true BIT, @false BIT
	SET @true = 1
	SET @false = 0

	SET @result = (
		SELECT e.Id
		FROM Employees e
		JOIN JobPositions j ON e.JobPositionId = j.Id
		WHERE e.Id = @id AND j.Position = 'Project Manager')
	
	IF @result = @id
		RETURN @true

	RETURN @false
END
GO

PRINT 'Created ufn_IsManager function that will check whether the employee is a valid project manager'
GO

CREATE TABLE Projects(
    Id INT IDENTITY NOT NULL,
    Name NVARCHAR(50) NOT NULL,
	Description NVARCHAR(500) NULL,
	StartDate SMALLDATETIME NULL,
	EndDate SMALLDATETIME NULL,
	ClientId INT NOT NULL,
	ManagerId INT NOT NULL CHECK (dbo.ufn_IsManager(ManagerId) = 1),
	CONSTRAINT PK_Projects PRIMARY KEY CLUSTERED (Id ASC),
	CONSTRAINT FK_Projects_Clients FOREIGN KEY (ClientId) REFERENCES Clients (Id),
	CONSTRAINT FK_Projects_Employees FOREIGN KEY (ManagerId) REFERENCES Employees (Id)
);
GO

CREATE NONCLUSTERED INDEX IX_Projects_Name ON Projects (Name)
GO

SET IDENTITY_INSERT Projects ON

INSERT INTO Projects (Id, Name, Description, StartDate, EndDate, ClientId, ManagerId)
VALUES (1, 'Classic Vest', 'Research, design and development of Classic Vest. Light-weight, wind-resistant, packs to fit into a pocket.', '20030601', NULL, 1, 1)

INSERT INTO Projects (Id, Name, Description, StartDate, EndDate, ClientId, ManagerId)
VALUES (2, 'Cycling Cap', 'Research, design and development of Cycling Cap. Traditional style with a flip-up brim; one-size fits all.', '20010601', '20030601', 2, 5)

INSERT INTO Projects (Id, Name, Description, StartDate, EndDate, ClientId, ManagerId)
VALUES (3, 'Full-Finger Gloves', 'Research, design and development of Full-Finger Gloves. Synthetic palm, flexible knuckles, breathable mesh upper. Worn by the AWC team riders.', '20020601', '20030601', 3, 9)

INSERT INTO Projects (Id, Name, Description, StartDate, EndDate, ClientId, ManagerId)
VALUES (4, 'Half-Finger Gloves', 'Research, design and development of Half-Finger Gloves. Full padding, improved finger flex, durable palm, adjustable closure.', '20020601', '20030601', 4, 13)

INSERT INTO Projects (Id, Name, Description, StartDate, EndDate, ClientId, ManagerId)
VALUES (5, 'HL Mountain Frame', 'Research, design and development of HL Mountain Frame. Each frame is hand-crafted in our Bothell facility to the optimum diameter and wall-thickness required of a premium mountain frame. The heat-treated welded aluminum frame has a larger diameter tube that absorbs the bumps.', '20010601', '20030601', 5, 17)

INSERT INTO Projects (Id, Name, Description, StartDate, EndDate, ClientId, ManagerId)
VALUES (6, 'HL Road Frame', 'Research, design and development of HL Road Frame. Our lightest and best quality aluminum frame made from the newest alloy; it is welded and heat-treated for strength. Our innovative design results in maximum comfort and performance.', '19980502', '20030601', 6, 21)

INSERT INTO Projects (Id, Name, Description, StartDate, EndDate, ClientId, ManagerId)
VALUES (7, 'HL Touring Frame', 'Research, design and development of HL Touring Frame. The HL aluminum frame is custom-shaped for both good looks and strength; it will withstand the most rigorous challenges of daily riding. Men''s version.', '20050516 16:34:00', NULL, 7, 25)

INSERT INTO Projects (Id, Name, Description, StartDate, EndDate, ClientId, ManagerId)
VALUES (8, 'LL Mountain Frame', 'Research, design and development of LL Mountain Frame. Our best value utilizing the same, ground-breaking frame technology as the ML aluminum frame.', '20021120 09:57:00', '20030601', 8, 29)

INSERT INTO Projects (Id, Name, Description, StartDate, EndDate, ClientId, ManagerId)
VALUES (9, 'LL Road Frame', 'Research, design and development of LL Road Frame. The LL Frame provides a safe comfortable ride, while offering superior bump absorption in a value-priced aluminum frame.', '20010601', '20030601', 9 , 1)

INSERT INTO Projects (Id, Name, Description, StartDate, EndDate, ClientId, ManagerId)
VALUES (10, 'LL Touring Frame', 'Research, design and development of LL Touring Frame. Lightweight butted aluminum frame provides a more upright riding position for a trip around town.  Our ground-breaking design provides optimum comfort.', '20050516 16:34:00', NULL, 10, 5)

INSERT INTO Projects (Id, Name, Description, StartDate, EndDate, ClientId, ManagerId)
VALUES (11, 'Long-Sleeve Logo Jersey', 'Research, design and development of Long-Sleeve Logo Jersey. Unisex long-sleeve AWC logo microfiber cycling jersey', '20010601', '20030601', 11, 9)

INSERT INTO Projects (Id, Name, Description, StartDate, EndDate, ClientId, ManagerId)
VALUES (12, 'Men''s Bib-Shorts', 'Research, design and development of Men''s Bib-Shorts. Designed for the AWC team with stay-put straps, moisture-control, chamois padding, and leg grippers.', '20020601', '20030601', 12, 13)

INSERT INTO Projects (Id, Name, Description, StartDate, EndDate, ClientId, ManagerId)
VALUES (13, 'Mountain-100', 'Research, design and development of Mountain-100. Top-of-the-line competition mountain bike. Performance-enhancing options include the innovative HL Frame, super-smooth front suspension, and traction for all terrain.', '20010601', '20030601', 13, 17)

INSERT INTO Projects (Id, Name, Description, StartDate, EndDate, ClientId, ManagerId)
VALUES (14, 'Mountain-200', 'Research, design and development of Mountain-200. Serious back-country riding. Perfect for all levels of competition. Uses the same HL Frame as the Mountain-100.', '20020601', '20040311 10:32:00', 14, 21)

INSERT INTO Projects (Id, Name, Description, StartDate, EndDate, ClientId, ManagerId)
VALUES (15, 'Mountain-300', 'Research, design and development of Mountain-300. For true trail addicts.  An extremely durable bike that will go anywhere and keep you in control on challenging terrain - without breaking your budget.', '20020601', '20030601', 15, 25)

INSERT INTO Projects (Id, Name, Description, StartDate, EndDate, ClientId, ManagerId)
VALUES (16, 'Mountain-400-W', 'Research, design and development of Mountain-400-W. This bike delivers a high-level of performance on a budget. It is responsive and maneuverable, and offers peace-of-mind when you decide to go off-road.', '20060222', NULL, 16, 29)

INSERT INTO Projects (Id, Name, Description, StartDate, EndDate, ClientId, ManagerId)
VALUES (17, 'Mountain-500', 'Research, design and development of Mountain-500. Suitable for any type of riding, on or off-road. Fits any budget. Smooth-shifting with a comfortable ride.', '20021120 09:57:00', '20030601', 17, 1)

INSERT INTO Projects (Id, Name, Description, StartDate, EndDate, ClientId, ManagerId)
VALUES (18, 'Racing Socks', 'Research, design and development of Racing Socks. Thin, lightweight and durable with cuffs that stay up.', '20051122', NULL, 18, 5)

INSERT INTO Projects (Id, Name, Description, StartDate, EndDate, ClientId, ManagerId)
VALUES (19, 'Road-150', 'Research, design and development of Road-150. This bike is ridden by race winners. Developed with the Adventure Works Cycles professional race team, it has a extremely light heat-treated aluminum frame, and steering that allows precision control.', '20010601', '20030601', 19, 9)

INSERT INTO Projects (Id, Name, Description, StartDate, EndDate, ClientId, ManagerId)
VALUES (20, 'Road-250', 'Research, design and development of Road-250. Alluminum-alloy frame provides a light, stiff ride, whether you are racing in the velodrome or on a demanding club ride on country roads.', '20020601', '20030601', 20, 13)

INSERT INTO Projects (Id, Name, Description, StartDate, EndDate, ClientId, ManagerId)
VALUES (21, 'Road-350-W', 'Research, design and development of Road-350-W. Cross-train, race, or just socialize on a sleek, aerodynamic bike designed for a woman.  Advanced seat technology provides comfort all day.', '20030601', NULL, 21, 17)

INSERT INTO Projects (Id, Name, Description, StartDate, EndDate, ClientId, ManagerId)
VALUES (22, 'Road-450', 'Research, design and development of Road-450. A true multi-sport bike that offers streamlined riding and a revolutionary design. Aerodynamic design lets you ride with the pros, and the gearing will conquer hilly roads.', '20010601', '20030601', 22, 21)

INSERT INTO Projects (Id, Name, Description, StartDate, EndDate, ClientId, ManagerId)
VALUES (23, 'Road-550-W', 'Research, design and development of Road-550-W. Same technology as all of our Road series bikes, but the frame is sized for a woman.  Perfect all-around bike for road or racing.', '20020601', '20030601', 23, 25)

INSERT INTO Projects (Id, Name, Description, StartDate, EndDate, ClientId, ManagerId)
VALUES (24, 'Road-650', 'Research, design and development of Road-650. Value-priced bike with many features of our top-of-the-line models. Has the same light, stiff frame, and the quick acceleration we''re famous for.', '20010601', '20030601', 24, 29)

INSERT INTO Projects (Id, Name, Description, StartDate, EndDate, ClientId, ManagerId)
VALUES (25, 'Road-750', 'Research, design and development of Road-750. Entry level adult bike; offers a comfortable ride cross-country or down the block. Quick-release hubs and rims.', '20021120 09:57:00', '20030601', 25, 1)

INSERT INTO Projects (Id, Name, Description, StartDate, EndDate, ClientId, ManagerId)
VALUES (26, 'Short-Sleeve Classic Jersey', 'Research, design and development of Short-Sleeve Classic Jersey. Short sleeve classic breathable jersey with superior moisture control, front zipper, and 3 back pockets.', '20030601', NULL, 26, 5)

INSERT INTO Projects (Id, Name, Description, StartDate, EndDate, ClientId, ManagerId)
VALUES (27, 'Sport-100', 'Research, design and development of Sport-100. Universal fit, well-vented, lightweight , snap-on visor.', '20010601', '20030601', 27, 9)

INSERT INTO Projects (Id, Name, Description, StartDate, EndDate, ClientId, ManagerId)
VALUES (28, 'Touring-1000', 'Research, design and development of Touring-1000. Travel in style and comfort. Designed for maximum comfort and safety. Wide gear range takes on all hills. High-tech aluminum alloy construction provides durability without added weight.', '20021120 09:57:00', '20030601', 28, 13)

INSERT INTO Projects (Id, Name, Description, StartDate, EndDate, ClientId, ManagerId)
VALUES (29, 'Touring-2000', 'Research, design and development of Touring-2000. The plush custom saddle keeps you riding all day,  and there''s plenty of space to add panniers and bike bags to the newly-redesigned carrier.  This bike has stability when fully-loaded.', '20021120 09:57:00', '20030601', 29, 17)

INSERT INTO Projects (Id, Name, Description, StartDate, EndDate, ClientId, ManagerId)
VALUES (30, 'Touring-3000', 'Research, design and development of Touring-3000. All-occasion value bike with our basic comfort and safety features. Offers wider, more stable tires for a ride around town or weekend trip.', '20021120 09:57:00', '20030601', 30, 21)

SET IDENTITY_INSERT Projects OFF
GO

PRINT 'Created Projects table and added data'
GO

CREATE TABLE Statuses(
	Id INT IDENTITY NOT NULL,
	Status NVARCHAR(30) NOT NULL,
	CONSTRAINT PK_Statuses PRIMARY KEY CLUSTERED (Id ASC),
	CONSTRAINT AK_Statuses_Status UNIQUE NONCLUSTERED (Status)
);
GO

SET IDENTITY_INSERT Statuses ON

INSERT INTO Statuses (Id, Status)
VALUES (1, 'Open')

INSERT INTO Statuses (Id, Status)
VALUES (2, 'Done')

INSERT INTO Statuses (Id, Status)
VALUES (3, 'In progress')

INSERT INTO Statuses (Id, Status)
VALUES (4, 'Closed')

INSERT INTO Statuses (Id, Status)
VALUES (5, 'On hold')

SET IDENTITY_INSERT Statuses OFF
GO

PRINT 'Created Statuses table and added data'
GO

CREATE TABLE Tasks(
	Id INT IDENTITY NOT NULL,
    Name NVARCHAR(100) NOT NULL,
	Description NVARCHAR(500) NULL,
	HoursEstimation INT NOT NULL CHECK(HoursEstimation > 0),
	ProjectId INT NOT NULL,
	StatusId INT NOT NULL,
	ParentTaskId INT NULL,
	CONSTRAINT PK_Tasks PRIMARY KEY CLUSTERED (Id ASC),
	CONSTRAINT FK_Statuses_Projects FOREIGN KEY (ProjectId) REFERENCES Projects (Id),
	CONSTRAINT FK_Tasks_Statuses FOREIGN KEY (StatusId) REFERENCES Statuses (Id),
	CONSTRAINT FK_Tasks_Tasks FOREIGN KEY (ParentTaskId) REFERENCES Tasks (Id)
);
GO

CREATE NONCLUSTERED INDEX IX_Tasks_Name ON Tasks (Name)
GO

-------------------- Add Parent Tasks --------------------
SET IDENTITY_INSERT Tasks ON

INSERT INTO Tasks (Id, Name, Description, HoursEstimation, ProjectId, StatusId)
VALUES (1, 'LL Fork', 'Research, design and development of LL Fork. Stout design absorbs shock and offers more precise steering.', 120, 1, 1)

INSERT INTO Tasks (Id, Name, Description, HoursEstimation, ProjectId, StatusId)
VALUES (2, 'ML Fork', 'Research, design and development of ML Fork. Composite road fork with an aluminum steerer tube.', 150, 2, 2)

INSERT INTO Tasks (Id, Name, Description, HoursEstimation, ProjectId, StatusId)
VALUES (3, 'HL Fork', 'Research, design and development of HL Fork. High-performance carbon road fork with curved legs.', 24, 3, 3)

INSERT INTO Tasks (Id, Name, Description, HoursEstimation, ProjectId, StatusId)
VALUES (4, 'Hydration Pack', 'Research, design and development of Hydration Pack. Versatile 70 oz hydration pack offers extra storage, easy-fill access, and a waist belt.', 100, 4, 4)

INSERT INTO Tasks (Id, Name, Description, HoursEstimation, ProjectId, StatusId)
VALUES (5, 'Taillight', 'Research, design and development of Taillight. Affordable light for safe night riding - uses 3 AAA batteries', 5000, 5, 5)

INSERT INTO Tasks (Id, Name, Description, HoursEstimation, ProjectId, StatusId)
VALUES (6, 'Headlights - Dual-Beam', 'Research, design and development of Headlights - Dual-Beam. Rechargeable dual-beam headlight.', 222, 6, 1)

INSERT INTO Tasks (Id, Name, Description, HoursEstimation, ProjectId, StatusId)
VALUES (7, 'Headlights - Weatherproof', 'Research, design and development of Headlights - Weatherproof. Rugged weatherproof headlight.', 120, 7, 2)

INSERT INTO Tasks (Id, Name, Description, HoursEstimation, ProjectId, StatusId)
VALUES (8, 'Water Bottle', 'Research, design and development of Water Bottle. AWC logo water bottle - holds 30 oz; leak-proof.', 8, 8, 3)

INSERT INTO Tasks (Id, Name, Description, HoursEstimation, ProjectId, StatusId)
VALUES (9, 'Mountain Bottle Cage', 'Research, design and development of Mountain Bottle Cage. Tough aluminum cage holds bottle securly on tough terrain.', 912, 9, 4)

INSERT INTO Tasks (Id, Name, Description, HoursEstimation, ProjectId, StatusId)
VALUES (10, 'Road Bottle Cage', 'Research, design and development of Road Bottle Cage. Aluminum cage is lighter than our mountain version; perfect for long distance trips.', 1000, 10, 5)

INSERT INTO Tasks (Id, Name, Description, HoursEstimation, ProjectId, StatusId)
VALUES (11, 'Patch kit', 'Research, design and development of Patch kit. Includes 8 different size patches, glue and sandpaper.', 231, 11, 1)

INSERT INTO Tasks (Id, Name, Description, HoursEstimation, ProjectId, StatusId)
VALUES (12, 'Cable Lock', 'Research, design and development of Cable Lock. Wraps to fit front and rear tires, carrier and 2 keys included.', 200, 12, 2)

INSERT INTO Tasks (Id, Name, Description, HoursEstimation, ProjectId, StatusId)
VALUES (13, 'Minipump', 'Research, design and development of Minipump. Designed for convenience. Fits in your pocket. Aluminum barrel. 160psi rated.', 300, 13, 3)

INSERT INTO Tasks (Id, Name, Description, HoursEstimation, ProjectId, StatusId)
VALUES (14, 'Mountain Pump', 'Research, design and development of Mountain Pump. Simple and light-weight. Emergency patches stored in handle.', 500, 14, 4)

INSERT INTO Tasks (Id, Name, Description, HoursEstimation, ProjectId, StatusId)
VALUES (15, 'Hitch Rack - 4-Bike', 'Research, design and development of Hitch Rack - 4-Bike. Carries 4 bikes securely; steel construction, fits 2" receiver hitch.', 600, 15, 5)

INSERT INTO Tasks (Id, Name, Description, HoursEstimation, ProjectId, StatusId)
VALUES (16, 'Bike Wash', 'Research, design and development of Bike Wash. Washes off the toughest road grime; dissolves grease, environmentally safe. 1-liter bottle.', 101, 16, 1)

INSERT INTO Tasks (Id, Name, Description, HoursEstimation, ProjectId, StatusId)
VALUES (17, 'Touring-Panniers', 'Research, design and development of Touring-Panniers. Durable, water-proof nylon construction with easy access. Large enough for weekend trips.', 10, 17, 2)

INSERT INTO Tasks (Id, Name, Description, HoursEstimation, ProjectId, StatusId)
VALUES (18, 'Fender Set - Mountain', 'Research, design and development of Fender Set - Mountain. Clip-on fenders fit most mountain bikes.', 11, 18, 3)

INSERT INTO Tasks (Id, Name, Description, HoursEstimation, ProjectId, StatusId)
VALUES (19, 'All-Purpose Bike Stand', 'Research, design and development of All-Purpose Bike Stand. Perfect all-purpose bike stand for working on your bike at home. Quick-adjusting clamps and steel construction.', 321, 19, 4)

INSERT INTO Tasks (Id, Name, Description, HoursEstimation, ProjectId, StatusId)
VALUES (20, 'Rear Derailleur', 'Research, design and development of Rear Derailleur. Wide-link design.', 400, 20, 5)

INSERT INTO Tasks (Id, Name, Description, HoursEstimation, ProjectId, StatusId)
VALUES (21, 'LL Fork', 'Research, design and development of LL Fork. Stout design absorbs shock and offers more precise steering.', 120, 1, 1)

INSERT INTO Tasks (Id, Name, Description, HoursEstimation, ProjectId, StatusId)
VALUES (22, 'ML Fork', 'Research, design and development of ML Fork. Composite road fork with an aluminum steerer tube.', 150, 2, 2)

INSERT INTO Tasks (Id, Name, Description, HoursEstimation, ProjectId, StatusId)
VALUES (23, 'HL Fork', 'Research, design and development of HL Fork. High-performance carbon road fork with curved legs.', 24, 3, 3)

INSERT INTO Tasks (Id, Name, Description, HoursEstimation, ProjectId, StatusId)
VALUES (24, 'Hydration Pack', 'Research, design and development of Hydration Pack. Versatile 70 oz hydration pack offers extra storage, easy-fill access, and a waist belt.', 100, 4, 4)

INSERT INTO Tasks (Id, Name, Description, HoursEstimation, ProjectId, StatusId)
VALUES (25, 'Taillight', 'Research, design and development of Taillight. Affordable light for safe night riding - uses 3 AAA batteries', 5000, 5, 5)

INSERT INTO Tasks (Id, Name, Description, HoursEstimation, ProjectId, StatusId)
VALUES (26, 'Headlights - Dual-Beam', 'Research, design and development of Headlights - Dual-Beam. Rechargeable dual-beam headlight.', 222, 6, 1)

INSERT INTO Tasks (Id, Name, Description, HoursEstimation, ProjectId, StatusId)
VALUES (27, 'Headlights - Weatherproof', 'Research, design and development of Headlights - Weatherproof. Rugged weatherproof headlight.', 120, 7, 2)

INSERT INTO Tasks (Id, Name, Description, HoursEstimation, ProjectId, StatusId)
VALUES (28, 'Water Bottle', 'Research, design and development of Water Bottle. AWC logo water bottle - holds 30 oz; leak-proof.', 8, 8, 3)

INSERT INTO Tasks (Id, Name, Description, HoursEstimation, ProjectId, StatusId)
VALUES (29, 'Mountain Bottle Cage', 'Research, design and development of Mountain Bottle Cage. Tough aluminum cage holds bottle securly on tough terrain.', 912, 9, 4)

INSERT INTO Tasks (Id, Name, Description, HoursEstimation, ProjectId, StatusId)
VALUES (30, 'Road Bottle Cage', 'Research, design and development of Road Bottle Cage. Aluminum cage is lighter than our mountain version; perfect for long distance trips.', 1000, 10, 5)

-------------------- Add Sub-Tasks --------------------
INSERT INTO Tasks (Id, Name, Description, HoursEstimation, ProjectId, StatusId, ParentTaskId)
VALUES (31, 'Women''s Mountain Shorts', 'Research, design and development of Women''s Mountain Shorts. Heavy duty, abrasion-resistant shorts feature seamless, lycra inner shorts with anti-bacterial chamois for comfort.', 10, 1, 1, 1)

INSERT INTO Tasks (Id, Name, Description, HoursEstimation, ProjectId, StatusId, ParentTaskId)
VALUES (32, 'Women''s Tights', 'Research, design and development of Women''s Tights. Warm spandex tights for winter riding; seamless chamois construction eliminates pressure points.', 20, 1, 1, 1)

INSERT INTO Tasks (Id, Name, Description, HoursEstimation, ProjectId, StatusId, ParentTaskId)
VALUES (33, 'Mountain-400', 'Research, design and development of Mountain-400. Suitable for any type of off-road trip. Fits any budget.', 30, 1, 1, 1)

INSERT INTO Tasks (Id, Name, Description, HoursEstimation, ProjectId, StatusId, ParentTaskId)
VALUES (34, 'Road-550', 'Research, design and development of Road-550. Same technology as all of our Road series bikes.  Perfect all-around bike for road or racing.', 23, 2, 2, 2)

INSERT INTO Tasks (Id, Name, Description, HoursEstimation, ProjectId, StatusId, ParentTaskId)
VALUES (35, 'Road-350', 'Research, design and development of Road-350. Cross-train, race, or just socialize on a sleek, aerodynamic bike.  Advanced seat technology provides comfort all day.', 9, 2, 2, 2)

INSERT INTO Tasks (Id, Name, Description, HoursEstimation, ProjectId, StatusId, ParentTaskId)
VALUES (36, 'LL Mountain Front Wheel', 'Research, design and development of LL Mountain Front Wheel. Replacement mountain wheel for entry-level rider.', 13,  2, 2, 2)

INSERT INTO Tasks (Id, Name, Description, HoursEstimation, ProjectId, StatusId, ParentTaskId)
VALUES (37, 'Touring Rear Wheel', 'Research, design and development of Touring Rear Wheel. Excellent aerodynamic rims guarantee a smooth ride.', 32, 3, 3, 3)

INSERT INTO Tasks (Id, Name, Description, HoursEstimation, ProjectId, StatusId, ParentTaskId)
VALUES (38, 'Touring Front Wheel', 'Research, design and development of Touring Front Wheel. Aerodynamic rims for smooth riding.', 3, 3, 3, 3)

INSERT INTO Tasks (Id, Name, Description, HoursEstimation, ProjectId, StatusId, ParentTaskId)
VALUES (39, 'ML Mountain Front Wheel', 'Research, design and development of ML Mountain Front Wheel. Replacement mountain wheel for the casual to serious rider.', 1, 3, 3, 3)

INSERT INTO Tasks (Id, Name, Description, HoursEstimation, ProjectId, StatusId, ParentTaskId)
VALUES (40, 'HL Mountain Front Wheel', 'Research, design and development of HL Mountain Front Wheel. High-performance mountain replacement wheel.', 20, 4, 4, 4)

INSERT INTO Tasks (Id, Name, Description, HoursEstimation, ProjectId, StatusId, ParentTaskId)
VALUES (41, 'LL Touring Handlebars', 'Research, design and development of LL Touring Handlebars. Unique shape reduces fatigue for entry level riders.', 12, 4, 4, 4)

INSERT INTO Tasks (Id, Name, Description, HoursEstimation, ProjectId, StatusId, ParentTaskId)
VALUES (42, 'HL Touring Handlebars', 'Research, design and development of HL Touring Handlebars. A light yet stiff aluminum bar for long distance riding.', 13, 4, 4, 4)

INSERT INTO Tasks (Id, Name, Description, HoursEstimation, ProjectId, StatusId, ParentTaskId)
VALUES (43, 'LL Road Front Wheel', 'Research, design and development of LL Road Front Wheel. Replacement road front wheel for entry-level cyclist.', 10, 5, 5, 5)

INSERT INTO Tasks (Id, Name, Description, HoursEstimation, ProjectId, StatusId, ParentTaskId)
VALUES (44, 'ML Road Front Wheel', 'Research, design and development of ML Road Front Wheel. Sturdy alloy features a quick-release hub.', 13, 5, 5, 5)

INSERT INTO Tasks (Id, Name, Description, HoursEstimation, ProjectId, StatusId, ParentTaskId)
VALUES (45, 'HL Road Front Wheel', 'Research, design and development of HL Road Front Wheel. Strong wheel with double-walled rim.', 18, 5, 5, 5)

SET IDENTITY_INSERT Tasks OFF
GO

PRINT 'Created Tasks table and added data'
GO

CREATE TABLE Issues(
	Id INT IDENTITY NOT NULL,
	Description NVARCHAR (500) NOT NULL,
	Created DATETIME NOT NULL DEFAULT GETDATE(),
	TaskId INT NOT NULL,
	CONSTRAINT PK_Issues PRIMARY KEY CLUSTERED (Id ASC),
	CONSTRAINT FK_Issues_Tasks FOREIGN KEY (TaskId) REFERENCES Tasks (Id)
);
GO

SET IDENTITY_INSERT Issues ON

INSERT INTO Issues (Id, Description, TaskId)
VALUES (1, 'Slow algorithm, must be fixed', 1)

INSERT INTO Issues (Id, Description, TaskId)
VALUES (2, 'Fron-end bug by using old React.js version', 1)

INSERT INTO Issues (Id, Description, TaskId)
VALUES (3, 'Broken build', 1)

INSERT INTO Issues (Id, Description, TaskId)
VALUES (4, 'Missing C# configurations', 2)

INSERT INTO Issues (Id, Description, TaskId)
VALUES (5, 'Slow T-SQL query', 2)

INSERT INTO Issues (Id, Description, TaskId)
VALUES (6, 'Missing database backup', 2)

INSERT INTO Issues (Id, Description, TaskId)
VALUES (7, 'Wrong site configurations', 3)

INSERT INTO Issues (Id, Description, TaskId)
VALUES (8, 'Failed unit-tests', 3)

INSERT INTO Issues (Id, Description, TaskId)
VALUES (9, 'Failed integration tests', 3)

INSERT INTO Issues (Id, Description, TaskId)
VALUES (10, 'Back-end bug', 4)

INSERT INTO Issues (Id, Description, TaskId)
VALUES (11, 'Back-end throws InvalidOperationException', 4)

INSERT INTO Issues (Id, Description, TaskId)
VALUES (12, 'Not enough resources', 4)

INSERT INTO Issues (Id, Description, TaskId)
VALUES (13, 'Front-end bug durring account registration', 5)

INSERT INTO Issues (Id, Description, TaskId)
VALUES (14, 'Old Angular.js version', 5)

INSERT INTO Issues (Id, Description, TaskId)
VALUES (15, 'Missing database records', 5)

INSERT INTO Issues (Id, Description, TaskId)
VALUES (16, 'Invalid admin configurations', 6)

INSERT INTO Issues (Id, Description, TaskId)
VALUES (17, 'StackOverflowException when creating new sub-tasks', 6)

INSERT INTO Issues (Id, Description, TaskId)
VALUES (18, 'Slow account registration process', 6)

INSERT INTO Issues (Id, Description, TaskId)
VALUES (19, 'Back-end returs status code 500', 7)

INSERT INTO Issues (Id, Description, TaskId)
VALUES (20, 'Front-end does not show success messages', 7)

SET IDENTITY_INSERT Issues OFF
GO

PRINT 'Created Issues table and added data'
GO

CREATE FUNCTION ufn_IsDeveloper(@id INT)
	RETURNS BIT	
AS
BEGIN
	DECLARE @count INT, @true BIT, @false BIT
	SET @true = 1
	SET @false = 0

	SET @count = (
		SELECT COUNT(Id) 
		FROM Employees
		WHERE Id = @id AND JobPositionId >= 2 AND JobPositionId <= 4)
	
	IF @count > 0
		RETURN @true

	RETURN @false
END
GO

PRINT 'Created ufn_IsDeveloper function that will check whether the employee is a developer by checking its Id'
GO

CREATE TABLE TasksProgress (
	Id INT IDENTITY NOT NULL,
	StartDate DATETIME NOT NULL DEFAULT GETDATE(),
	ParentTaskId INT NOT NULL,
	DeveloperId INT NOT NULL CHECK (dbo.ufn_IsDeveloper(DeveloperId) = 1),
	TotalHours INT NOT NULL DEFAULT (0),
	ReleaseDate DATETIME NOT NULL,
	CONSTRAINT PK_TaskProgresses PRIMARY KEY CLUSTERED (Id ASC),
	CONSTRAINT FK_TaskProgresses_Tasks FOREIGN KEY (ParentTaskId) REFERENCES Tasks (Id),
	CONSTRAINT FK_TaskProgresses_Employees FOREIGN KEY (DeveloperId) REFERENCES Employees (Id),
	CONSTRAINT AK_ParentTaskId UNIQUE NONCLUSTERED (ParentTaskId)
);
GO

PRINT 'Created TasksProgress table'
GO

CREATE VIEW TotalWorkHoursForParentTasksReport
AS
	SELECT p.Id, SUM(c.ChildHoursEstimation + p.HoursEstimation) AS [TotalWorkHours]
	FROM Tasks p
	JOIN (
		SELECT ParentTaskId, SUM(HoursEstimation) AS [ChildHoursEstimation]
		FROM Tasks
		GROUP BY ParentTaskId 
	) c
	ON p.Id = c.ParentTaskId
	GROUP BY p.Id
GO

PRINT 'Created TotalWorkHoursForParentTasksReport view that will select the total work hours for a task by '+ 
	  'summing the estimation hours of the parent task and its sub-tasks, if there are any'
GO

CREATE VIEW TotalWorkHoursForProjectsReport
AS
	SELECT p.Id, SUM(t.HoursEstimation) AS [TotalWorkHours]
	FROM Projects p
	JOIN Tasks t ON p.Id = t.ProjectId
	GROUP BY p.Id
GO

SELECT *
FROM TotalWorkHoursForProjectsReport
GO

CREATE TRIGGER tr_CalculateTotalWorkHours ON TasksProgress FOR INSERT AS
BEGIN
	DECLARE @taskId INT, @taskProgressesId INT, @totalHours INT

	SET @taskId = (SELECT ParentTaskId FROM INSERTED)
	SET @taskProgressesId = (SELECT Id FROM INSERTED)
	SET @totalHours = (
		SELECT TotalWorkHours 
		FROM TotalWorkHoursForParentTasksReport
		WHERE Id = @taskId)

	IF @totalHours IS NULL
		BEGIN
			SET @totalHours = (
				SELECT HoursEstimation
				FROM Tasks
				WHERE Id = @taskId)
		END
	
	UPDATE TasksProgress
	SET TotalHours = @totalHours
	WHERE Id = @taskProgressesId

	PRINT CONCAT('Trigger fired. Calculated total work hours for task with Id ', @taskId)
END
GO

SET IDENTITY_INSERT TasksProgress ON

INSERT INTO TasksProgress (Id, ParentTaskId, DeveloperId, ReleaseDate)
VALUES (1, 1, 2, '2018-8-23')

INSERT INTO TasksProgress (Id, ParentTaskId, DeveloperId, ReleaseDate)
VALUES (2, 2, 2, '2018-8-23')

INSERT INTO TasksProgress (Id, ParentTaskId, DeveloperId, ReleaseDate)
VALUES (3, 3, 2, '2018-8-23')

INSERT INTO TasksProgress (Id, ParentTaskId, DeveloperId, ReleaseDate)
VALUES (4, 4, 3, '2018-8-23')

INSERT INTO TasksProgress (Id, ParentTaskId, DeveloperId, ReleaseDate)
VALUES (5, 5, 3, '2018-8-23')

INSERT INTO TasksProgress (Id, ParentTaskId, DeveloperId, ReleaseDate)
VALUES (6, 6, 3, '2018-8-23')

INSERT INTO TasksProgress (Id, ParentTaskId, DeveloperId, ReleaseDate)
VALUES (7, 7, 4, '2018-8-23')

INSERT INTO TasksProgress (Id, ParentTaskId, DeveloperId, ReleaseDate)
VALUES (8, 8, 4, '2018-8-23')

INSERT INTO TasksProgress (Id, ParentTaskId, DeveloperId, ReleaseDate)
VALUES (9, 9, 4, '2018-8-23')

INSERT INTO TasksProgress (Id, ParentTaskId, DeveloperId, ReleaseDate)
VALUES (10, 10, 6, '2018-8-23')

INSERT INTO TasksProgress (Id, ParentTaskId, DeveloperId, ReleaseDate)
VALUES (11, 11, 6, '2018-8-23')

INSERT INTO TasksProgress (Id, ParentTaskId, DeveloperId, ReleaseDate)
VALUES (12, 12, 6, '2018-8-23')

INSERT INTO TasksProgress (Id, ParentTaskId, DeveloperId, ReleaseDate)
VALUES (13, 13, 7, '2018-8-23')

INSERT INTO TasksProgress (Id, ParentTaskId, DeveloperId, ReleaseDate)
VALUES (14, 14, 7, '2018-8-23')

INSERT INTO TasksProgress (Id, ParentTaskId, DeveloperId, ReleaseDate)
VALUES (15, 15, 7, '2018-8-23')

INSERT INTO TasksProgress (Id, ParentTaskId, DeveloperId, ReleaseDate)
VALUES (16, 16, 8, '2018-8-23')

INSERT INTO TasksProgress (Id, ParentTaskId, DeveloperId, ReleaseDate)
VALUES (17, 17, 8, '2018-8-23')

INSERT INTO TasksProgress (Id, ParentTaskId, DeveloperId, ReleaseDate)
VALUES (18, 18, 8, '2018-8-23')

INSERT INTO TasksProgress (Id, ParentTaskId, DeveloperId, ReleaseDate)
VALUES (19, 19, 10, '2018-8-23')

INSERT INTO TasksProgress (Id, ParentTaskId, DeveloperId, ReleaseDate)
VALUES (20, 20, 10, '2018-8-23')

INSERT INTO TasksProgress (Id, ParentTaskId, DeveloperId, ReleaseDate)
VALUES (21, 21, 2, '2018-8-23')

INSERT INTO TasksProgress (Id, ParentTaskId, DeveloperId, ReleaseDate)
VALUES (22, 22, 2, '2018-8-23')

INSERT INTO TasksProgress (Id, ParentTaskId, DeveloperId, ReleaseDate)
VALUES (23, 23, 2, '2018-8-23')

INSERT INTO TasksProgress (Id, ParentTaskId, DeveloperId, ReleaseDate)
VALUES (24, 24, 3, '2018-8-23')

INSERT INTO TasksProgress (Id, ParentTaskId, DeveloperId, ReleaseDate)
VALUES (25, 25, 3, '2018-8-23')

INSERT INTO TasksProgress (Id, ParentTaskId, DeveloperId, ReleaseDate)
VALUES (26, 26, 3, '2018-8-23')

INSERT INTO TasksProgress (Id, ParentTaskId, DeveloperId, ReleaseDate)
VALUES (27, 27, 4, '2018-8-23')

INSERT INTO TasksProgress (Id, ParentTaskId, DeveloperId, ReleaseDate)
VALUES (28, 28, 4, '2018-8-23')

INSERT INTO TasksProgress (Id, ParentTaskId, DeveloperId, ReleaseDate)
VALUES (29, 29, 4, '2018-8-23')

INSERT INTO TasksProgress (Id, ParentTaskId, DeveloperId, ReleaseDate)
VALUES (30, 30, 6, '2018-8-23')

SET IDENTITY_INSERT TasksProgress OFF
GO

CREATE VIEW AverageWorkHoursForDeveloperReport
AS
	SELECT t.ProjectId, e.Id AS [EmployeeId], AVG(t.HoursEstimation) AS [Average Work Hours]
	FROM TasksProgress tp
	JOIN Tasks t ON tp.ParentTaskId = t.Id
	JOIN Employees e ON tp.DeveloperId = e.Id
	WHERE tp.DeveloperId = e.Id
	GROUP BY t.ProjectId, e.Id
GO

SELECT * FROM AverageWorkHoursForDeveloperReport
GO

CREATE PROCEDURE usp_SelectTaskInfoByProjectId(@id INT)
AS
	SELECT CONVERT(NVARCHAR, t.Id) + '. ' + t.Name AS [Task],
		s.Status, 
		t.HoursEstimation,
 		p.Name AS [Project],
		CONVERT(NVARCHAR, p.StartDate, 103) + ' - ' + CONVERT(NVARCHAR, p.EndDate, 103) AS [Project Date],
		c.FirstName + ' ' + c.LastName + ', Phone: ' + c.Phone AS [Client],
		e.FirstName + ' ' + e.LastName + ', E-mail: ' + e.Email AS [Manager]
	FROM Tasks t
	JOIN Projects p ON t.ProjectId = p.Id
	JOIN Statuses s ON t.StatusId = s.Id
	JOIN Clients c ON p.ClientId = c.Id
	JOIN Employees e ON p.ManagerId = e.Id
	WHERE p.Id = @id
	ORDER BY t.Name ASC
GO

EXECUTE usp_SelectTaskInfoByProjectId 2
GO

CREATE PROCEDURE usp_SelectDevelopersInfoByProjectId(@id INT)
AS
	SELECT e.FirstName + ' ' + e.LastName + ' - ' + jp.Position + ', Email: ' + e.Email AS [Developer],
		p.Name AS [Project],
		t.Name AS [Task],
		tp.ReleaseDate AS [Release]
	FROM TasksProgress tp
	JOIN Employees e ON tp.DeveloperId = e.Id
	JOIN JobPositions jp ON e.JobPositionId = jp.Id
	JOIN Tasks t ON tp.ParentTaskId = t.Id
	JOIN Projects p ON t.ProjectId = p.Id
	WHERE p.Id = @id
	ORDER BY jp.Position DESC
GO

EXECUTE usp_SelectDevelopersInfoByProjectId 1
GO

DECLARE tasksProgressCursor CURSOR READ_ONLY FOR
    SELECT tp.StartDate, 
		tp.ReleaseDate, 
		tp.TotalHours, 
		e.FirstName + ' ' + e.LastName AS [Developer], 
		CAST(t.Id AS NVARCHAR) + '. ' + t.Name AS [Task]
	FROM TasksProgress tp
	JOIN Employees e ON tp.DeveloperId = e.Id
	JOIN Tasks t ON tp.ParentTaskId = t.Id
	ORDER BY e.FirstName, e.LastName
GO

OPEN tasksProgressCursor
GO

DECLARE @startDate DATETIME, 
        @releaseDate DATETIME,
        @totalHours INT,
        @developer NVARCHAR(100),
		@task NVARCHAR(100)

FETCH NEXT FROM tasksProgressCursor INTO @startDate, @releaseDate, @totalHours, @developer, @task

WHILE (@@FETCH_STATUS) = 0
	BEGIN
		PRINT CONVERT(NVARCHAR, @startDate, 103) + ' - ' + CONVERT(NVARCHAR, @releaseDate, 103) + ', ' + CAST(@totalHours AS NVARCHAR) + ' hours, -> ' + @developer + ' developer -> task: ' + @task
		FETCH NEXT FROM tasksProgressCursor INTO @startDate, @releaseDate, @totalHours, @developer, @task
	END

CLOSE tasksProgressCursor
DEALLOCATE tasksProgressCursor
GO

ALTER TABLE Towns
ADD IsDeleted BIT
GO

CREATE TRIGGER tr_DeleteTowns ON Towns INSTEAD OF DELETE AS
BEGIN
	DECLARE @id INT
	SET @id = (SELECT Id FROM DELETED)

	UPDATE t
	SET t.IsDeleted = 1
	FROM Towns t
	JOIN DELETED d ON t.Id = d.Id
	WHERE t.IsDeleted IS NULL OR t.IsDeleted = 0

	PRINT CONCAT('Trigger fired. Deleted town with Id ', @id)
END
GO

DELETE FROM Towns
WHERE Id = 10
GO