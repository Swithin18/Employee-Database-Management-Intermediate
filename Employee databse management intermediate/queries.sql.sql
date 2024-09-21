-- queries.sql: Advanced queries and views for Employee Database

\c EmployeeDB;  -- Connect to the EmployeeDB

-- 1. Create a view to simplify employee details retrieval
CREATE VIEW EmployeeDetails AS
SELECT Employees.EmployeeID, Employees.FirstName, Employees.LastName, Departments.DepartmentName, Positions.PositionName
FROM Employees
JOIN Departments ON Employees.DepartmentID = Departments.DepartmentID
JOIN Positions ON Employees.PositionID = Positions.PositionID;

-- 2. Retrieve all employees with their department and position
SELECT * FROM EmployeeDetails;

-- 3. Retrieve employees with salary greater than $60,000
SELECT Employees.FirstName, Employees.LastName, Salaries.SalaryAmount
FROM Employees
JOIN Salaries ON Employees.EmployeeID = Salaries.EmployeeID
WHERE Salaries.SalaryAmount > 60000;

-- 4. Retrieve the total salary paid per department
SELECT Departments.DepartmentName, SUM(Salaries.SalaryAmount) AS TotalSalary
FROM Employees
JOIN Salaries ON Employees.EmployeeID = Salaries.EmployeeID
JOIN Departments ON Employees.DepartmentID = Departments.DepartmentID
GROUP BY Departments.DepartmentName;

-- 5. Retrieve employees hired after a specific year using subquery
SELECT FirstName, LastName, HireDate
FROM Employees
WHERE HireDate > (SELECT MIN(HireDate) FROM Employees WHERE BirthDate > '1990-01-01');

-- 6. Trigger to automatically insert a log entry when a new employee is added
CREATE OR REPLACE FUNCTION log_new_employee() 
RETURNS TRIGGER AS $$
BEGIN
    INSERT INTO EmployeeLog (EmployeeID, LogMessage, LogDate)
    VALUES (NEW.EmployeeID, 'New employee added: ' || NEW.FirstName || ' ' || NEW.LastName, CURRENT_DATE);
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER after_employee_insert
AFTER INSERT ON Employees
FOR EACH ROW
EXECUTE FUNCTION log_new_employee();
