/*                  --SET OPERATORS--
 Set operators in SQL comibne the results of multiple queries
 into a single result set

 syntax :-  1st SELECT statement + Set Operator + 2nd SELECT statement
    SELECT * FROM customers
    UNION
    SELECT * FROM employees 
    
   SET:#1 Rule 
   Set operator can be used almost in all clause such as WHERE | JOIN | GROUP BY| HAVING
   ORDER BY is allowed only once at the end of query
   
   SET:#2 Rule
   The number of columns in each query must be the same */
   SELECT 
   firstName,
   lastName
   FROM Sales.customers
   UNION
   SELECT 
   firstName,
   lastName
   FROM Sales.Employees
/* SET:#3 Rule
   Data types of columns in each query must be match (compatible)
    
   SET:#4 Rule
   The order of the columns in each query must be same

   SET:#5 Rule
   The column names in the result ser are determined by the column names specified in the first query
   ( 1st query controls column names )
     The number of columns in each query must be the same */
   SELECT 
   CustomerID,
   lastName
   FROM Sales.customers
   UNION
   SELECT 
   EmployeeID,
   lastName
   FROM Sales.Employees

/* SET:#6 Rule --> Mapping Correct Columns
    Even if all rules are met and SQL shows no error,the result may be incorrect.
    Incorrect column selection leads to inaccurate results


                           -- UNION --
        Returns all district rows from both queries.
        Removes duplicate rows from the result.

task :- Combine the data from employees and customers into one table.
*/
SELECT 
FirstName,
LastName
FROM Sales.Customers
UNION 
SELECT
FirstName,
LastName
FROM Sales.Employees
   
 /*                          -- UNION All --
        Returns all district rows from both queries including Duplicate
        UNION ALL is generally faster than UNION

task :- Combine the data from employees and customers into one table including Duplicates
*/
SELECT 
FirstName,
LastName
FROM Sales.Customers
UNION ALL
SELECT
FirstName,
LastName
FROM Sales.Employees

 /*                            -- EXCEPT --
    --> Returns all distinct rows from the first query that are not found 
        in the second query.
    --> it is only one where the order of queries affects the final result.

 TASK:- Find the employees who are not customers at the same time
*/

SELECT 
    FirstName,
    LastName
FROM Sales.Employees
EXCEPT
SELECT
    FirstName,
    LastName
FROM Sales.Customers

/*
                             -- INTERSECT --
            Returns only the rows that are common in both queries
            Removes duplicate rows from the result.

 tasks:- Find the Employees, who are also customers
*/
SELECT 
    FirstName,
    LastName
FROM Sales.Employees
INTERSECT
SELECT
    FirstName,
    LastName
FROM Sales.Customers

/*
                        -- USE CASE OF SET OPERATIONS --
                           1. Combine information

TASKS:- Orders data are stored in separate table (Orders and OrderArchive)
          combine all order data into one report without duplication
*/

SELECT
    'Orders' AS SourceTable,
    OrderID,
    ProductID,
    CustomerID,
    SalesPersonID,
    OrderDate,
    ShipDate,
    OrderStatus,
    ShipAddress,
    BillAddress,
    Quantity,
    Sales,
    CreationTime
FROM Sales.Orders
UNION
SELECT
    'OrdersArchive' AS SourceTable,
    OrderID,
    ProductID,
    CustomerID,
    SalesPersonID,
    OrderDate,
    ShipDate,
    OrderStatus,
    ShipAddress,
    BillAddress,
    Quantity,
    Sales,
    CreationTime
FROM Sales.OrdersArchive
ORDER BY OrderID;