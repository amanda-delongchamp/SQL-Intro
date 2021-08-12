CREATE TABLE employees (
    EmployeeID INT  NOT NULL IDENTITY(1, 1) PRIMARY KEY,
    FirstName NVARCHAR(45),
    MiddleIntial nvarchar(45),
    LastName NVARCHAR(45),
    EmailAddress NVARCHAR(45),
    PhoneNumber NVARCHAR(45),
    Title NVARCHAR(45),
    DateOfBirth DATETIME,
    EmployeeID_Unique INT UNIQUE
);