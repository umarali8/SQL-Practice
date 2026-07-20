
--  Create 'dept' table (Created first so 'emp' can map foreign relationships)
CREATE TABLE dept (
    deptno INT PRIMARY KEY,
    dname VARCHAR(50),
    loc VARCHAR(50)
);


--  Create 'emp' table 
CREATE TABLE emp (
    empno INT PRIMARY KEY,
    ename VARCHAR(50),
    job VARCHAR(50),
    mgr INT,
    hiredate DATE,
    sal INT,
    deptno INT
);


-- Populate 'dept' data
INSERT INTO dept (deptno, dname, loc) VALUES
(10, 'accounting', 'karachi'),
(20, 'research', 'lahore'),
(30, 'sales', 'islamabad'),
(40, 'operations', 'peshawar'),
(50, 'it', 'quetta');


-- Populate 'emp' data
INSERT INTO emp (empno, ename, job, mgr, hiredate, sal, deptno) VALUES
(7369, 'smith', 'clerk', 7902, '2020-01-01', 800, 20),
(7499, 'allen', 'salesman', 7698, '2020-02-01', 1600, 30),
(7521, 'ward', 'salesman', 7698, '2020-03-01', 1250, 30),
(7566, 'jones', 'manager', 7839, '2020-04-01', 2975, 20),
(7788, 'scott', 'analyst', 7566, '2020-05-01', 3000, 20);


-- Task 1: List all rows of the table emp.
SELECT * FROM emp;

-- Task 2: List all rows of the dept.
SELECT * FROM dept;

-- Task 3: List all employees' number from emp.
SELECT empno FROM emp;

-- Task 4: List all employees name from emp.
SELECT ename FROM emp;

-- Task 5: List all departments' number from emp.
SELECT deptno FROM emp;

-- Task 6: Find all employees whose salaries are between 500 and 1500.
SELECT * FROM emp WHERE sal BETWEEN 500 AND 1500;

-- Task 7: Find all employees whose salaries are between 1500 and 2500.
SELECT * FROM emp WHERE sal BETWEEN 1500 AND 2500;

-- Task 8: Find all employees whose salaries are between 2600 and 5000.
SELECT * FROM emp WHERE sal BETWEEN 2600 AND 5000;

-- Task 9: Find all employees whose salaries are less than 2000.
SELECT * FROM emp WHERE sal < 2000;

-- Task 10: Find all employees whose salaries are greater than 2000.
SELECT * FROM emp WHERE sal > 2000;

-- Task 11: Find those employees whose mgr are 7902, 7566, 7788.
SELECT * FROM emp WHERE mgr IN (7902, 7566, 7788);

-- Task 12: Find those employees whose mgr. is between 7788 and 7092.
SELECT * FROM emp WHERE mgr BETWEEN 7092 AND 7788;

-- Task 13: List all employees whose name starts with 's'.
SELECT * FROM emp WHERE ename LIKE 's%';

-- Task 14: List all employees whose name start with 'a'.
SELECT * FROM emp WHERE ename LIKE 'a%';

-- Task 15: List all employees having first name as 'scott'.
SELECT * FROM emp WHERE ename = 'scott';

-- Task 16: List all employees having first name as 'smith' or 'king'.
SELECT * FROM emp WHERE ename IN ('smith', 'king');

-- Task 17: List all employees having first letter in their name 'w' or 'k' and they don't belong to Department number 10,20 and 40.
SELECT * FROM emp WHERE (ename LIKE 'w%' OR ename LIKE 'k%') AND deptno NOT IN (10, 20, 40);

-- Task 18: List all employees whose name begin with 'scott' and end with 'martin'.
SELECT * FROM emp WHERE ename LIKE 'scott%' AND ename LIKE '%martin';

-- Task 19: List all employees whose name start with 'm' and belong to department number 30.
SELECT * FROM emp WHERE ename LIKE 'm%' AND deptno = 30;

-- Task 20: List all employees whose name started with character 'b' and their jobs are manager.
SELECT * FROM emp WHERE ename LIKE 'b%' AND job = 'manager';

-- Task 21: List all employees who do not have job manager.
SELECT * FROM emp WHERE job <> 'manager';

-- Task 22: Find those employees whose job do not start with 'a'.
SELECT * FROM emp WHERE job NOT LIKE 'a%';

-- Task 23: Find those employees whose job does not start with 'c'.
SELECT * FROM emp WHERE job NOT LIKE 'c%';

-- Task 24: List of those employees whose mgr is not null.
SELECT * FROM emp WHERE mgr IS NOT NULL;

-- Task 25: List of those employees whose jobs are 'manager or clerk' of department number 10.
SELECT * FROM emp WHERE job IN ('manager', 'clerk') AND deptno = 10;

-- Task 26: List of those employees whose jobs are 'analyst' and 'salesman' of department 30.
SELECT * FROM emp WHERE job IN ('analyst', 'salesman') AND deptno = 30;

-- Task 27: Find all clerks who earn salaries between 1000 and 2000.
SELECT * FROM emp WHERE job = 'clerk' AND sal BETWEEN 1000 AND 2000;

-- Task 28: Find all managers who earn salaries between 2500 and 3000.
SELECT * FROM emp WHERE job = 'manager' AND sal BETWEEN 2500 AND 3000;

-- Task 29: Find all employees who are either clerk or 'manager' and earn Salaries in the range of 1000 and 2000.
SELECT * FROM emp WHERE job IN ('clerk', 'manager') AND sal BETWEEN 1000 AND 2000;

-- Task 30: Find all employees who are manager and/or earn salaries between 2000 and 3000.
SELECT * FROM emp WHERE job = 'manager' OR sal BETWEEN 2000 AND 3000;

-- Task 31: Find all employees whose salaries are equal to 1500 and jobs are manager or salesmen.
SELECT * FROM emp WHERE sal = 1500 AND job IN ('manager', 'salesman');
