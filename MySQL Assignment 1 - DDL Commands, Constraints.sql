DROP DATABASE IF EXISTS employee;
CREATE DATABASE employee;
USE employee;
SHOW DATABASES;
SELECT DATABASE();
USE employee;
CREATE TABLE Departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(100)
);
CREATE TABLE Location (
    location_id INT PRIMARY KEY,
    location VARCHAR(30)
);
CREATE TABLE Employees (
    employee_id INT PRIMARY KEY,
    employee_name VARCHAR(50),
    gender ENUM('M', 'F'),
    age INT,
    hire_date DATE,
    designation VARCHAR(100),
    department_id INT,
    location_id INT,
    salary DECIMAL(10,2),
    FOREIGN KEY (department_id)
        REFERENCES Departments(department_id),
    FOREIGN KEY (location_id)
        REFERENCES Location(location_id)
);
-- Check the created tables
SHOW TABLES;
USE employee;
SHOW TABLES;
DESCRIBE Departments;
DESCRIBE Location;
DESCRIBE Employees;
USE employee;
-- 1. Add email column
ALTER TABLE Employees
ADD COLUMN email VARCHAR(100);
-- 2. Increase designation size
ALTER TABLE Employees
MODIFY COLUMN designation VARCHAR(255);
-- 3. Remove age column
ALTER TABLE Employees
DROP COLUMN age;
-- 4. Rename hire_date column
ALTER TABLE Employees
RENAME COLUMN hire_date TO date_of_joining;
-- Check the updated table
DESCRIBE Employees;
USE employee;
-- 1. Rename Departments table
RENAME TABLE Departments
TO Departments_Info;
-- 2. Rename Location table
RENAME TABLE Location
TO Locations;
-- Check renamed tables
SHOW TABLES;
-- Check Departments_Info structure
DESCRIBE Departments_Info;
-- Check Locations structure
DESCRIBE Locations;
USE employee;
-- Check the Employees table
SELECT * FROM Employees;
-- Remove all records
TRUNCATE TABLE Employees;
-- Verify that records are removed
SELECT * FROM Employees;
-- Check that the table still exists
SHOW TABLES;
-- Check the table structure
DESCRIBE Employees;
USE employee;
-- 1. Drop Employees table
DROP TABLE Employees;
-- Check remaining tables
SHOW TABLES;
-- 2. Drop the employee database
DROP DATABASE employee;
-- Check available databases
SHOW DATABASES;
-- Recreate employee database
DROP DATABASE IF EXISTS employee;
CREATE DATABASE employee;
-- Select the database
USE employee;
-- Confirm selected database
SELECT DATABASE();
-- Display available databases
SHOW DATABASES;
USE employee;
-- Create Departments table with constraints
CREATE TABLE Departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(100) NOT NULL UNIQUE
);
-- Check the table structure
DESCRIBE Departments;
-- Verify table creation
SHOW TABLES;
USE employee;
-- Create Location table with constraints
CREATE TABLE Location (
    location_id INT AUTO_INCREMENT PRIMARY KEY,
    location VARCHAR(30) NOT NULL UNIQUE
);
-- Check the table structure
DESCRIBE Location;
-- Verify table creation
SHOW TABLES;
USE employee;
-- Create Employees table with constraints
CREATE TABLE Employees (
    employee_id INT PRIMARY KEY,
    employee_name VARCHAR(50) NOT NULL,
    gender ENUM('M', 'F'),
    age INT CHECK (age >= 18),
    hire_date DATE DEFAULT (CURRENT_DATE),
    designation VARCHAR(100),
    department_id INT,
    location_id INT,
    salary DECIMAL(10,2),
    -- Link with Departments table
    FOREIGN KEY (department_id)
        REFERENCES Departments(department_id),
    -- Link with Location table
    FOREIGN KEY (location_id)
        REFERENCES Location(location_id)
);
-- Check Employees table structure
DESCRIBE Employees;
-- Display all three tables
SHOW TABLES;
USE employee;
-- 1. Insert department details
INSERT INTO Departments
(department_id, department_name)
VALUES
(1, 'Human Resources'),
(2, 'Marketing'),
(3, 'Finance');
-- 2. Insert location details
INSERT INTO Location (location)
VALUES
('Chennai'),
('Bangalore'),
('Mumbai');
-- 3. Insert employee details
INSERT INTO Employees
(employee_id, employee_name, gender, age,
 designation, department_id, location_id, salary)
VALUES
(101, 'Arun', 'M', 24, 'Analyst', 1, 1, 30000.00),
(102, 'Priya', 'F', 25, 'Manager', 2, 2, 45000.00),
(103, 'Rahul', 'M', 28, 'Developer', 3, 3, 50000.00);
-- 4. Display all records
SELECT * FROM Departments;
SELECT * FROM Location;
SELECT * FROM Employees;
USE employee;
INSERT INTO Departments
(department_id, department_name)
VALUES
(4, 'Finance');
USE employee;
INSERT INTO Location (location)
VALUES ('Chennai');
USE employee;
INSERT INTO Employees
(employee_id, employee_name, gender, age,
 designation, department_id, location_id, salary)
VALUES
(104, 'Kiran', 'M', 17,
 'Intern', 1, 1, 15000.00);
 USE employee;
USE employee;
INSERT INTO Employees
(employee_id, employee_name, gender, age,
 designation, department_id, location_id, salary)
VALUES
(106, 'Meena', 'F', 26,
 'Data Analyst', 2, 2, 35000.00);
-- Check the automatically assigned date
SELECT employee_id, employee_name, hire_date
FROM Employees
WHERE employee_id = 106;
INSERT INTO Employees
(employee_id, employee_name, gender, age,
 designation, department_id, location_id, salary)
VALUES
(105, NULL, 'M', 25,
 'Analyst', 1, 1, 30000.00);
USE employee;
-- Insert employee without providing hire_date
INSERT INTO Employees
(employee_id, employee_name, gender, age,
 designation, department_id, location_id, salary)
VALUES
(106, 'Meena', 'F', 26,
 'Data Analyst', 2, 2, 35000.00);
-- Check automatically assigned hire date
SELECT employee_id, employee_name, hire_date
FROM Employees
WHERE employee_id = 106; 
USE employee;
-- Display all employee records
SELECT * FROM Employees;
-- Check Meena's joining date
SELECT
    employee_id,
    employee_name,
    hire_date
FROM Employees
WHERE employee_id = 106;
USE employee;
-- Test NOT NULL constraint
INSERT INTO Employees
(employee_id, employee_name, gender, age,
 designation, department_id, location_id, salary)
VALUES
(105, NULL, 'M', 25,
 'Analyst', 1, 1, 30000.00);
 USE employee;
-- Insert employee with a valid name
INSERT INTO Employees
(employee_id, employee_name, gender, age,
 designation, department_id, location_id, salary)
VALUES
(105, 'Meena', 'F', 25,
 'Analyst', 1, 1, 30000.00);
-- Display all employee records
SELECT * FROM Employees;
USE employee;
SELECT * FROM Employees;
SELECT COUNT(*) AS total_employees
FROM Employees;
SELECT employee_id, employee_name, designation, salary
FROM Employees
ORDER BY salary DESC;
USE employee;
-- Display existing departments
SELECT * FROM Departments;
-- Test UNIQUE constraint
INSERT INTO Departments
(department_id, department_name)
VALUES
(5, 'HR');
-- Try inserting the same department name again
INSERT INTO Departments
(department_id, department_name)
VALUES
(6, 'HR');
-- Display departments
SELECT * FROM Departments;
USE employee;
-- Test duplicate Primary Key
INSERT INTO Departments
(department_id, department_name)
VALUES
(3, 'Operations');
-- Display departments
SELECT * FROM Departments;
INSERT INTO Departments
(department_id, department_name)
VALUES
(3, 'Operations');
USE employee;
SELECT * FROM Location;
DESCRIBE Location;
SELECT COUNT(*) AS total_locations
FROM Location;
USE employee;
SELECT * FROM Employees;
DESCRIBE Employees;
SELECT COUNT(*) AS total_employees
FROM Employees;
SELECT employee_id, employee_name, hire_date
FROM Employees;
USE employee;
SHOW CREATE TABLE Employees;
USE employee;
SHOW TABLES;
SELECT * FROM Departments;
SELECT * FROM Location;
DESCRIBE Departments;
DESCRIBE Location;
DESCRIBE Employees;