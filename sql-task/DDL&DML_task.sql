
                                           -- DATA DEFINITION LANGUAGE TASK--
-- Task 1: Create Person Table
CREATE TABLE Person
(
    PersonID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Age INT,
    City VARCHAR(50)
);

-- Insert 5 Records
INSERT INTO Person VALUES
(1,'Ali','Khan',22,'Karachi'),
(2,'Ahmed','Raza',24,'Lahore'),
(3,'Sara','Iqbal',21,'Islamabad'),
(4,'Fatima','Noor',23,'Hyderabad'),
(5,'Usman','Shah',25,'Multan');

-------------------------------------------------------

-- Task 2: Create Customer Table
CREATE TABLE Customer
(
    CustomerID INT PRIMARY KEY,
    CustomerName VARCHAR(50),
    Phone VARCHAR(15),
    City VARCHAR(50)
);

-- Insert 5 Records
INSERT INTO Customer VALUES
(101,'Awais','03001234567','Nawabshah'),
(102,'Hamza','03111234567','Karachi'),
(103,'Bilal','03211234567','Lahore'),
(104,'Saad','03331234567','Hyderabad'),
(105,'Hassan','03451234567','Sukkur');

-------------------------------------------------------

-- Task 3: Create Orders Table
CREATE TABLE Orders
(
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    OrderDate DATE,
    Amount DECIMAL(10,2),

    FOREIGN KEY(CustomerID)
    REFERENCES Customer(CustomerID)
);

-- Insert 5 Records
INSERT INTO Orders VALUES
(1,101,'2025-06-01',1200),
(2,102,'2025-06-02',850),
(3,103,'2025-06-03',3000),
(4,104,'2025-06-04',1700),
(5,105,'2025-06-05',5000);

-------------------------------------------------------

-- Task 4: Add New Field
ALTER TABLE Person
ADD Email VARCHAR(100);

-------------------------------------------------------

-- Task 5: Modify Field
ALTER TABLE Person
ALTER COLUMN FirstName VARCHAR(100);


                                   -- DATA MANIPULATION LANGUAGE TASKS --
-- Create Department Table
CREATE TABLE DEPT
(
    DEPTNO INT PRIMARY KEY,
    DNAME VARCHAR(50),
    LOC VARCHAR(50)
);

-- Create Employee Table
CREATE TABLE EMP
(
    EMPNO INT PRIMARY KEY,
    ENAME VARCHAR(50),
    JOB VARCHAR(50),
    MGR INT,
    HIREDATE DATE,
    SAL DECIMAL(10,2),
    COMM DECIMAL(10,2),
    DEPTNO INT,
    FOREIGN KEY(DEPTNO)
    REFERENCES DEPT(DEPTNO)
);

-------------------------------------------------------

-- Insert Sample Departments
INSERT INTO DEPT VALUES
(10,'ACCOUNTING','NEW YORK'),
(20,'RESEARCH','DALLAS'),
(30,'SALES','CHICAGO'),
(40,'OPERATIONS','BOSTON');

-------------------------------------------------------

-- Insert Sample Employees
INSERT INTO EMP VALUES
(7369,'SMITH','CLERK',7902,'1980-12-17',800,NULL,20),
(7499,'ALLEN','SALESMAN',7698,'1981-02-20',1600,300,30),
(7521,'WARD','SALESMAN',7698,'1981-02-22',1250,500,30),
(7566,'JONES','MANAGER',7839,'1981-04-02',2975,NULL,20),
(7654,'MARTIN','SALESMAN',7698,'1981-09-28',1250,1400,30);

-------------------------------------------------------

--Insert new employee’s records
INSERT INTO EMP VALUES
(8001,'AWAIS','CLERK',7902,'2025-07-15',1500,NULL,20);

-------------------------------------------------------

-- Insert new department records deptno=50, dname=ADVERTISING and loc=MIAMI
INSERT INTO DEPT VALUES
(50,'ADVERTISING','MIAMI');

-------------------------------------------------------

-- Delete the records of Sales department
DELETE FROM DEPT
WHERE DNAME='SALES';

-------------------------------------------------------

-- Change the employees sal for Smith
UPDATE EMP
SET SAL=3000
WHERE ENAME='SMITH';

-------------------------------------------------------

-- Confirm all these changes by using Select statement
SELECT * FROM EMP;
SELECT * FROM DEPT;

-------------------------------------------------------

-- Update the salary of each employee to 5000.
UPDATE EMP
SET SAL=5000;

-------------------------------------------------------

-- Change the salary to $1,000 for all employees with a salary less than $900.
UPDATE EMP
SET SAL=1000
WHERE SAL<900;

-------------------------------------------------------

-- Change the commission of department 20 to 1000.
UPDATE EMP
SET COMM=1000
WHERE DEPTNO=20;

-------------------------------------------------------

-- Change the hire date of all clerks to 2000-04-02
UPDATE EMP
SET HIREDATE='2000-04-02'
WHERE JOB='CLERK';

-------------------------------------------------------

-- Delete all the records having hire date before 21-dec-81
DELETE FROM EMP
WHERE HIREDATE<'1981-12-21';

-------------------------------------------------------

-- Delete all records where salary is greater than 2000.
DELETE FROM EMP
WHERE SAL>2000;

-------------------------------------------------------

-- Final Result
SELECT * FROM EMP;
SELECT * FROM DEPT;
SELECT * FROM Person;
SELECT * FROM Customer;
SELECT * FROM Orders;


