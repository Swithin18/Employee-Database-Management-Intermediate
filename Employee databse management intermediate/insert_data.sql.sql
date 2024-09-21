-- insert_data.sql: Inserting data into the tables

\c EmployeeDB;  -- Connect to the EmployeeDB

-- Inserting Data into Departments Table
INSERT INTO Departments (DepartmentName)
VALUES
    ('HR'),
    ('Finance'),
    ('IT'),
    ('Marketing');

-- Inserting Data into Positions Table
INSERT INTO Positions (PositionName)
VALUES
    ('Manager'),
    ('Analyst'),
    ('Developer'),
    ('Sales Rep');

-- Inserting Data into Employees Table
INSERT INTO Employees (FirstName, LastName, BirthDate, HireDate, DepartmentID, PositionID)
VALUES
    ('John', 'Doe', '1985-05-15', '2010-06-23', 1, 1),
    ('Jane', 'Smith', '1990-09-12', '2015-03-10', 2, 2),
    ('Alice', 'Johnson', '1992-07-23', '2017-11-05', 3, 3),
    ('Bob', 'Brown', '1980-11-03', '2005-02-12', 4, 4);

-- Inserting Data into Salaries Table
INSERT INTO Salaries (EmployeeID, SalaryAmount, SalaryDate)
VALUES
    (1, 70000.00, '2022-01-01'),
    (2, 60000.00, '2022-01-01'),
    (3, 80000.00, '2022-01-01'),
    (4, 50000.00, '2022-01-01');
