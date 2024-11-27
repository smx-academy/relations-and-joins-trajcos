CREATE TABLE Clients1 (
    ClientID INT PRIMARY KEY IDENTITY(1,1),
    FirstName NVARCHAR(50) NOT NULL,
    LastName NVARCHAR(50) NOT NULL,
    DateOfBirth DATE NOT NULL,
    Email NVARCHAR(100),
    PhoneNumber NVARCHAR(15),
    Address NVARCHAR(255)
);

CREATE TABLE Accounts1 (
    AccountID INT PRIMARY KEY IDENTITY(1,1),
    ClientID INT FOREIGN KEY REFERENCES Clients1(ClientID),
    AccountType NVARCHAR(50) NOT NULL, 
    Balance DECIMAL(18, 2) NOT NULL,
    OpeningDate DATE NOT NULL
);

CREATE TABLE Savings1 (
    SavingsID INT PRIMARY KEY IDENTITY(1,1),
    AccountID INT FOREIGN KEY REFERENCES Accounts1(AccountID),
    InterestRate DECIMAL(5, 2), 
    MinimumBalance DECIMAL(18, 2)
);


CREATE TABLE DebitCards1 (
    CardID INT PRIMARY KEY IDENTITY(1,1),
    AccountID INT FOREIGN KEY REFERENCES Accounts1(AccountID),
    CardNumber NVARCHAR(16) NOT NULL UNIQUE,
    ExpiryDate DATE NOT NULL,
    IssuedDate DATE NOT NULL
);


CREATE TABLE Credits1 (
    CreditID INT PRIMARY KEY IDENTITY(1,1),
    ClientID INT FOREIGN KEY REFERENCES Clients1(ClientID),
    CreditAmount DECIMAL(18, 2) NOT NULL,
    StartDate DATE NOT NULL,
    InterestRate DECIMAL(5, 2),
    RepaymentPeriodMonths INT
);

Query 1: Clients with Savings Balance > $10,000

SELECT 
    c.ClientID,
    c.FirstName,
    c.LastName,
    s.MinimumBalance
FROM
	Clients1 c
INNER JOIN 
    Accounts1 a ON c.ClientID = a.ClientID
INNER JOIN 
    Savings1 s ON a.AccountID = s.AccountID
WHERE 
    s.MinimumBalance > 10000;

Query 2: Debit Cards Issued Within a Specific Date Range

SELECT 
    dc.CardID,
    dc.CardNumber,
    dc.IssuedDate,
    dc.ExpiryDate,
    a.AccountID,
    c.FirstName,
    c.LastName
FROM 
    DebitCards1 dc
INNER JOIN 
    Accounts1 a ON dc.AccountID = a.AccountID
INNER JOIN 
    Clients1 c ON a.ClientID = c.ClientID
WHERE 
    dc.IssuedDate BETWEEN '2023-01-01' AND '2023-12-31';

Query 3: Clients with Credits Issued After 2023
SELECT 
    c.ClientID,
    c.FirstName,
    c.LastName,
    cr.CreditAmount,
    cr.StartDate,
    cr.InterestRate,
    cr.RepaymentPeriodMonths
FROM 
    Clients1 c
INNER JOIN 
    Credits1 cr ON c.ClientID = cr.ClientID
WHERE 
    cr.StartDate > '2023-01-01';