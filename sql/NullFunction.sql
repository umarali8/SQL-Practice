/* what is NULL?
		NULL means nothing,unknown!
		NULL is not equal to anything
		- NULL is not zero
		- Null is not empty string
		- Null is not black space

		ISNULL()
		replace NULL with a specified value

		Syntax  --> ISNULL( value,replacement_value)
		Example --> 1. ISNULL(Shipping-Address, 'unknown') 
					2. ISNULL(Shipping-Address, 'Billing_Address') 

		COALESCE()
		Returns the first non-null value from a list

		Syntax  -----> COALESCE( value1,value2,value3, ...)
		example --> 1. COALESCE(Shipping-Address, 'unknown')
					2. COALESCE(Shipping-Address, 'Billing_Address')
					2. COALESCE(Shipping-Address, 'Billing_Address','unknown')

				ISNULL()        vs       COALESCE
		- Limited to two values          -Unlimited
		- fast							 -slow
		SQL SERVER -> ISNULL             -Available in all database
		Oracle ---> NVL
		MySQL --->IFNULL

					ISNULL | COALESCE
					 - USE CASE -
		1. Handle the NULL before doing data aggregation

	Tasks :- Find the average score of the customers 
*/

SELECT 
	CustomerID,
	Score,
	COALESCE(Score,0) AS Score2,
	AVG(Score) OVER () Avgscores,
	AVG(COALESCE(Score,0)) OVER () Avgscores2
FROM Sales.Customers

/*	2. Handle the NULL before doing mathematical operations
	Tasks:- Display the fullname of customers in a single field by merging their first 
	and last name, and add 10 bonus points to each customers score
*/

SELECT 
	CustomerID,
	FirstName,
	LastName,
	FirstName + ' ' + COALESCE(LastName, '')  AS FullName,
	Score,
	COALESCE(Score,0) + 10 AS ScoreWithBonus
FROM Sales.Customers

/*	3. Handle the NULL before sorting data
	Tasks:- Sort thr customers from lowest to highest score with nulls appearing last
*/

SELECT 
	CustomerID,
	Score,
	CASE WHEN Score is NULL THEN 1 ELSE 0 END Flag
FROM Sales.Customers
ORDER BY CASE WHEN Score is NULL THEN 1 ELSE 0 END ,Score

/* NULLIF ()
	-NULL ,if they are equal.
	-first value ,if they are not equal.

	syntax --> NULLIF(value1,value2)
	example -> NULLIF(Shipping_Address, 'unknown')
			   NULLIF(Shipping_Address, Billing_Address)

					 -- NULLIF --
					 - USE CASE -
		1. Preventing the error of dividing by zero
	Tasks:- Find the sales price for each order hy dividing sales by quantity
 */
SELECT 
	OrderID,
	Sales,
	Quantity,
	Sales / NULLIF(Quantity,0) AS Price 
FROM Sales.Orders

/*
				-- IS NULL --
	Returns TRUE if the value IS NULL
	Syntax--> Value IS NULL
	Example:- Shipping_Address IS NULL

				-- IS NULL --
	Returns TRUE if the value IS NOT NULL
	Syntax--> Value IS NOT NULL
	Example:- Shipping_Address IS NOT NULL

				IS NULL | IS NOT NULL
				-- USE CASE --
	1. Searching for missing information

	Tasks:- 1. identify the customers who have no scores
*/

SELECT * 
FROM Sales.customers
WHERE Score IS NULL

-- Tasks:- 2. list all customers who have score 

SELECT * 
FROM Sales.customers
WHERE Score IS NOT NULL
			
	-- 2. Finding the unmatched rows between  two tables (Use Case)

-- list all details for customers who have not placed any orders
SELECT
c.*,
o.OrderID
FROM Sales.Customers c
LEFT JOIN  Sales.Orders o
ON  c.CustomerID = o.CustomerID
WHERE o.CustomerID IS NULL

/*Differnce between NULL VS Empty String Vs Blank Space

		          NULL       VS        Empty String   vs     Blank Space
Representation    NULL                    ''                  '  '
Meaning           unknown           known,empty value         known,Space value
Data Type		  Special Marker	String(0)                 String(1 or more)
Storage			  Very minimal      occupy memory			  occupy memory (each space)
Performance		   Best				fast				  	  slow
Comparsion		  Is NULL            =''					  =' '
*/ 