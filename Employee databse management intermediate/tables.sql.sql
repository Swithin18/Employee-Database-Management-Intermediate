-- tables.sql: Script to create Employee Database Tables with normalization

CREATE DATABASE EmployeeDB;
\c EmployeeDB;  -- Connect to the new database

-- Creating Department Table
CREATE TABLE Departments (
    DepartmentID SERIAL PRIMARY KEY,
    DepartmentName VARCHAR(50) NOT NULL
);

-- Creating Position Table (to normalize employee job titles)
CREATE TABLE Positions (
    PositionID SERIAL PRIMARY KEY,
    PositionName VARCHAR(50) NOT NULL
);

-- Creating Employee Table
CREATE TABLE Employees (
    EmployeeID SERIAL PRIMARY KEY,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    BirthDate DATE NOT NULL,
    HireDate DATE NOT NULL,
    DepartmentID INT NOT NULL,
    PositionID INT NOT NULL,
    FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID),
    FOREIGN KEY (PositionID) REFERENCES Positions(PositionID)
);

-- Creating Salaries Table to track employee salaries
CREATE TABLE Salaries (
    SalaryID SERIAL PRIMARY KEY,
    EmployeeID INT NOT NULL,
    SalaryAmount DECIMAL(10, 2) NOT NULL,
    SalaryDate DATE NOT NULL,
    FOREIGN KEY (EmployeeID) REFERENCES Employees(EmployeeID)
);
