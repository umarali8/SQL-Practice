 /*                       -- DATE & TIME FUNCTION --
						  -- PART EXTRACTION --
					      -- DAY | MONTH | YEAR --
    1. DAY(date)
		 Returns the day from a date
	2. MONTH(date)
	     Returns the month from a date
	3. YEAR(date)
	     Returns the year from a date

*/
SELECT
	OrderID,
	CreationTime,
	YEAR(CreationTime) AS Year,
	MONTH(CreationTime) AS Month,
	DAY(CreationTime) AS DAY
FROM Sales.Orders

/*  4. DATEPART()
		Returns a specific part of a date as a numbers.
	    Syntax:- DATEPART (Part,date)
		examples: DATEPART(month,Orderdate)
*/
SELECT
	OrderID,
	CreationTime,
	DATEPART(year,CreationTime) AS Year_dp,
	DATEPART(month,CreationTime) AS Month_dp,
	DATEPART(hour,CreationTime) AS hour_dp,
	DATEPART(quarter,CreationTime) AS Quarter_dp,
	DATEPART(week,CreationTime) AS Week_dp,
	YEAR(CreationTime) AS Year,
	MONTH(CreationTime) AS Month,
	DAY(CreationTime) AS DAY
FROM Sales.Orders

/*  5. DATENAME()
    	Returns the name  of a specific part of a date.
		Syntax:- DATENAME (Part,date)
		examples: DATENAME(month,Orderdate)
*/

SELECT
	OrderID,
	CreationTime,
	DATENAME(year,CreationTime) AS Year_dn,
	DATENAME(month,CreationTime) AS Month_dn,
	DATENAME(weekday,CreationTime) AS Week_dn,
	DATENAME(day,CreationTime) AS Day_dn
FROM Sales.Orders

/*  6. DATETRUNC()
		Truncates the date to the specific part.
		Syntax:- DATETRUNC (Part,date)
		examples: DATETRUNC(month,Orderdate)
		  
*/

SELECT
	OrderID,
	CreationTime,
	DATETRUNC(year,CreationTime) AS Year_dt,
	DATETRUNC(day,CreationTime) AS Day_dt,
	DATETRUNC(minute,CreationTime) AS Minute_dt
FROM Sales.Orders

-- for Analyizing
--for year
SELECT
	DATETRUNC(year,CreationTime) AS Creation,
	count(*)
FROM Sales.Orders
GROUP BY DATETRUNC(year,CreationTime)

--for month
SELECT
	DATETRUNC(month,CreationTime) AS Creation,
	count(*)
FROM Sales.Orders
GROUP BY DATETRUNC(month,CreationTime)


/*  6. EOMONTH()
		Returns the last day of a month.
		Syntax:- EOMONTH(date)		  		  
*/

SELECT
	OrderID,
	CreationTime,
	EOMONTH(CreationTime) AS EndOfMonth
FROM Sales.Orders

/*                  PART EXTRACTION | USE CASES
					1. Aggregation
   TASK 1:
    How many orders were placed each year?
*/
SELECT 
    YEAR(OrderDate) AS OrderYear, 
    COUNT(*) AS TotalOrders
FROM Sales.Orders
GROUP BY YEAR(OrderDate);

/* TASK 2:
   How many orders were placed each month?
*/
SELECT 
    MONTH(OrderDate) AS OrderMonth, 
    COUNT(*) AS TotalOrders
FROM Sales.Orders
GROUP BY MONTH(OrderDate);

/*					PART EXTRACTION | USE CASES
					2. DATA FILTERING

TASK 3:
   How many orders were placed each month (using friendly month names)?
*/
SELECT 
    DATENAME(month, OrderDate) AS OrderMonth, 
    COUNT(*) AS TotalOrders
FROM Sales.Orders
GROUP BY DATENAME(month, OrderDate);
