/*  SUBQUERY
	A query inside another query
	SubQuery Result Type
	1. Scalar subquery
	Returns only a single value
*/

SELECT 
AVG(sales)
FROM Sales.Orders

/*
2. Row Subquery
   Returns Multiple rows and a single columns
*/

SELECT 
CustomerID
FROM Sales.Orders

/*
3. Table Subquery
   Returns Multiple rows and a Multiple columns
*/

SELECT 
*
FROM Sales.Orders

--OR
SELECT 
OrderID,
OrderDate
FROM Sales.Orders

/*
FROM clause SubQuery
Used as temporary table for the main query
Syntax :  SELECT col1,col2,... FROM (SELECT column FROM table WHERE condition) AS alias

Tasks:
Find the products that have a price higher than averge price of all products
*/
SELECT
*
FROM(
	SELECT 
	ProductID,
	Price,
	AVG(Price) OVER() AS averagePrice
	FROM Sales.Products)t
WHERE price > averagePrice
/*
Tasks:
Rank customers based on their total amount of sales
*/
SELECT
*,
RANK() OVER(ORDER BY TotalSales DESC) CustomerRank
FROM(
	SELECT
	CustomerID,
	SUM(sales) AS TotalSales
	FROM Sales.Orders
	GROUP BY CustomerID)t

/*
SELECT clause SubQuery
Used to aggregate data side by side with the main querys data,
allowing for direct comparsion
SYNTAX: SELECT Col1,(SELECT Col FROM table1 WHERE condition) FROM table1
Rule:  Only Scalar subqueries are allowed to be used

Tasks:
Show the ProductID,Product names, prices and Total number of orders
*/
SELECT
	ProductID,
	Product,
	Price,
	(SELECT COUNT(*) FROM Sales.Orders) AS TotalOrder
FROM Sales.Products

/*
JOIN clause SubQuery
Used to prepare the data (Filtering or aggregation) before joining it with other tables

Tasks:
show all customer details and the find the total orders of each customer
*/
SELECT 
c.*,
o.TotalOrders
FROM Sales.Customers c
LEFT JOIN (
	SELECT
	CustomerID,
	COUNT(*) TotalOrders
	FROM Sales.Orders
	GROUP BY CustomerID) o
ON c.CustomerID=O.CustomerID

/*
WHERE clause SubQuery
Used for complex filterign logic and makes query more flexible and dynamic.
1. Comparsion Operators 
Used to filter data by comparing two values
Syntax: SELECT Col1, Col2,... FROM table1 WHERE column Comparsion opertor(SELECT Column FROM Table2 WHERE Condition) 
Rule:  Only Scalar subqueries are allowed to be used

Tasks:
Find the products that have a price higher than averge price of all products
*/
SELECT 
	ProductID,
	Price,
	(SELECT AVG(Price)  FROM Sales.Products) AS AvgPrice
	FROM Sales.Products
WHERE price > (SELECT AVG(Price)  FROM Sales.Products)

/*
2. IN Operators
Checks whether a value matches any value from a list
Syntax: SELECT Col1, Col2,... FROM table1 WHERE column IN (SELECT Column FROM Table2 WHERE Condition) 

Tasks:
Show the details of orders made by customers in Germany
*/

SELECT
* 
FROM Sales.Orders
WHERE CustomerID IN 
				(SELECT 
				CustomerID
				FROM  Sales.Customers
				WHERE Country='Germany')
/*
3. ANY Operators
Checks if a value matches ANY values with in list.
Used to check if value is true AT LEAST one of the values in a list.
Syntax: SELECT Col1, Col2,... FROM table1 WHERE column Comparsion opertor ANY(SELECT Column FROM Table2 WHERE Condition)
Tasks:
Find female employees whose salaries are greater than the salaries of any male employees
*/
 
SELECT
    EmployeeID, 
    FirstName,
    Salary
FROM Sales.Employees
WHERE Gender = 'F'
AND Salary > ANY (
      SELECT Salary
      FROM Sales.Employees
      WHERE Gender = 'M')

SELECT FirstName,Salary	FROM Sales.Employees WHERE Gender = 'M'

/*
3. ALL Operators
Checks if a value matches ALL values with in list.
Syntax: SELECT Col1, Col2,... FROM table1 WHERE column Comparsion opertor ANY(SELECT Column FROM Table2 WHERE Condition)

Tasks:
Find female employees whose salaries are greater than the salaries of all male employees
*/
SELECT
    EmployeeID, 
    FirstName,
    Salary
FROM Sales.Employees
WHERE Gender = 'F'
AND Salary > ALL (
      SELECT Salary
      FROM Sales.Employees
      WHERE Gender = 'M' )

/*
NON_CORRELATED SubQuery
A subquery that can run indepently from the Main query

CORRELATED SubQuery
A subquery that relays on values from the Main query

Tasks:
Show all customers details and find the total orders of each customer
*/

SELECT
*,
(SELECT COUNT(*) FROM Sales.Orders o WHERE o.CustomerID= c.CustomerID) Totalsales
FROM Sales.Customers c
/*
Feature				Non_correalated SubQuery                    vs    Correlated SubQuery
Definiton			Subquery is independent of main query             Subquery is dependent of main query
Execution			Executed once and its result is use by            Executed for each row processed by the 
				    the main query                                    the main query 
				    can be executed on its own                        can not be executed on its own
Easy to use			easier to read									  Harder to read and more complex
Performance			executed only once leads to better performance	  executed multiple times leads to bad performance
Usage	            static comparsions ,filtering with constants      row by row comparsions ,Dynamic filtering

3. Exists Operators
Checks if a subquery returns any rows
Syntax: SELECT Col1, Col2,... FROM table2 WHERE EXISTS (SELECT 1 FROM Table1 WHERE Table1.ID=Table2.ID)

Tasks:
Show the details of orders made by customers in Germany.
*/
SELECT
    *
FROM Sales.Orders AS o
WHERE EXISTS (
    SELECT 1
    FROM Sales.Customers AS c
    WHERE Country = 'Germany'
      AND o.CustomerID = c.CustomerID)

/* Tasks:
   Show the details of orders made by customers not in Germany.
*/
SELECT
*
FROM Sales.Orders AS o
WHERE NOT EXISTS (
    SELECT 1
    FROM Sales.Customers AS c
    WHERE Country = 'Germany'
    AND o.CustomerID = c.CustomerID
)