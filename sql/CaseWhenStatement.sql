/*
			                            CONDITIONAL STATEMENT
		    Evaluates a list of conditions and returns a value when the first condition is met

		Syntax-->   CASE (The start the logic)
						WHEN(Condition to be evaluted) condition1 THEN(Result, if the condition is true) reseult1
						WHEN condition2 THEN reseult2
						....
						ELSE(Default Value(optinal)if none of the WHEN conditions are ture:
				    END (The end of logic)

				                        -- USE CASE --
	1. Main purpose is Data Transformation
	   Derive new information 
	--Create new columns based on existing data

	Categorizing data 
		Group the data into different categories based on certain conditions 
		
TASK 1: 
   Create a report showing total sales for each category:
	   - High: Sales over 50
	   - Medium: Sales between 20 and 50
	   - Low: Sales 20 or less
   The results are sorted from highest to lowest total sales.
*/
SELECT
    Category,
    SUM(Sales) AS TotalSales
FROM (
    SELECT
        OrderID,
        Sales,
        CASE
            WHEN Sales > 50 THEN 'High'
            WHEN Sales > 20 THEN 'Medium'
            ELSE 'Low'
        END AS Category
    FROM Sales.Orders
) AS t
GROUP BY Category
ORDER BY TotalSales DESC;

/*                      2. MAPPING
        Transform the values from one from to another

TASK 2:
		Retrive employee details with gender displayed as full text
*/
SELECT
    EmployeeID,
    FirstName,
    LastName,
    Gender,
    CASE 
        WHEN Gender = 'F' THEN 'Female'
        WHEN Gender = 'M' THEN 'Male'
        ELSE 'Not Available'
    END  AS GenderFullText
FROM Sales.Employees

/* TASK 3: 
   Retrieve customer details with abbreviated country codes 
*/
SELECT
    CustomerID,
    FirstName,
    LastName,
    Country,
    CASE 
        WHEN Country = 'Germany' THEN 'DE'
        WHEN Country = 'USA'     THEN 'US'
        ELSE 'n/a'
    END AS CountryAbbr
FROM Sales.Customers;

/* TASK 4: 
   Retrieve customer details with abbreviated country codes using quick form 
*/
SELECT
    CustomerID,
    FirstName,
    LastName,
    Country,
    CASE 
        WHEN Country = 'Germany' THEN 'DE'
        WHEN Country = 'USA'     THEN 'US'
        ELSE 'n/a'
    END AS CountryAbbr,
    CASE Country
        WHEN 'Germany' THEN 'DE'
        WHEN 'USA'     THEN 'US'
        ELSE 'n/a'
    END AS CountryAbbr2
FROM Sales.Customers;

 /*                       CONDITIONAL AGGREGATION 
        Apply aggregate functions only on subsets of data that fulfill certain conditions
        Nulls can lead to inaccurate results, which can lead to wrong decision-making
TASK 5: 
   Calculate the average score of customers, treating NULL as 0,
   and provide CustomerID and LastName details.
*/
SELECT
    CustomerID,
    LastName,
    Score,
    CASE
        WHEN Score IS NULL THEN 0
        ELSE Score
    END AS ScoreClean,
    AVG(
        CASE
            WHEN Score IS NULL THEN 0
            ELSE Score
        END
    ) OVER () AS AvgCustomerClean,
    AVG(Score) OVER () AS AvgCustomer
FROM Sales.Customers;



	