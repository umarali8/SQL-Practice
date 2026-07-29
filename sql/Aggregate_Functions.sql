/*
                           -- Aggregate Function --
Aggregate functions are built-in SQL functions that perform
calculations on multiple rows and return a single value.

Common Aggregate Functions:
---------------------------
1. COUNT()
2. SUM()
3. AVG()
4. MIN()
5. MAX()

---------------------------------------------------------
1. COUNT()
---------------------------------------------------------
Purpose:
Counts the number of rows in a table.

Syntax:
SELECT COUNT(column_name)
FROM table_name;

Example:
SELECT COUNT(*) AS TotalEmployees
FROM Employees;


---------------------------------------------------------
2. SUM()
---------------------------------------------------------
Purpose:
Calculates the total of a numeric column.

Syntax:
SELECT SUM(column_name)
FROM table_name;

Example:
SELECT SUM(Salary) AS TotalSalary
FROM Employees;



---------------------------------------------------------
3. AVG()
---------------------------------------------------------
Purpose:
Calculates the average value of a numeric column.

Syntax:
SELECT AVG(column_name)
FROM table_name;

Example:
SELECT AVG(Salary) AS AverageSalary
FROM Employees;



---------------------------------------------------------
4. MIN()
---------------------------------------------------------
Purpose:
Returns the smallest value.

Syntax:
SELECT MIN(column_name)
FROM table_name;

Example:
SELECT MIN(Salary) AS LowestSalary
FROM Employees;



---------------------------------------------------------
5. MAX()
---------------------------------------------------------
Purpose:
Returns the largest value.

Syntax:
SELECT MAX(column_name)
FROM table_name;

Example:
SELECT MAX(Salary) AS HighestSalary
FROM Employees;

*/


--Tasks:-Find the total number of customers
SELECT COUNT(*) AS total_customers
FROM customers

--Tasks:-Find the total sales of all orders
SELECT SUM(sales) AS total_sales
FROM orders

--Tasks:- Find the average sales of all orders
SELECT AVG(sales) AS avg_sales
FROM orders

--Tasks:- Find the highest score among customers
SELECT MAX(score) AS max_score
FROM customers

--Tasks:- Find the lowest score among customers
SELECT MIN(score) AS min_score
FROM customers



--Tasks:- Find the number of orders, total sales, average sales, highest sales, and lowest sales per customer
SELECT
    customer_id,
    COUNT(*) AS total_orders,
    SUM(sales) AS total_sales,
    AVG(sales) AS avg_sales,
    MAX(sales) AS highest_sales,
    MIN(sales) AS lowest_sales
FROM orders
GROUP BY customer_id
