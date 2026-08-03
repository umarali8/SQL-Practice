/* WINDOW AGGREGATION FUNCTION 
		-- WINDOW FUNCTION: COUNT --
 1. COUNT()
 Returns the number of rows within a window
 counts the number of values in a column, regardless of their data types.
 Note: counts the total number of rows inlcuding duplicates,not the unique values!

 COUNT(*)
 counts all the rows in a table,regardless of whether any value is NULL
 COUNT(Columns)
 counts the number of non_NULL values in the column
 Tasks: Find the total number of order

				Usecase #01 Overall Analysis
				Quick summary or snapchat of the entire dataset
*/

SELECT 
COUNT(*) AS TotalOrder
FROM Sales.Orders

-- Tasks: Find the total number of order additionally provide the details such 
--		  Order ID, Order date

SELECT
	OrderID,
	OrderDate,
	COUNT(*)  OVER() AS TotalOrder
FROM Sales.Orders

/* Tasks: Find the total number of orders,Find the total number of orders for each customers additionally provide the details such 
		  Order ID, Order date
					
					Usecase #02 Total Per Groups 
				Group-wise analysis ,to understand patterns within different catergories
*/
SELECT
	OrderID,
	OrderDate,
	CustomerID,
	COUNT(*)  OVER() AS TotalOrder,
	COUNT(*)  OVER(PARTITION BY CustomerID) OrdersByCustomers
FROM Sales.Orders

--Tasks: Find the total number of Customers additionally provide all customers Details
SELECT 
*,
COUNT(*)  OVER() AS TotalCustomers
FROM Sales.Customers

/*

--Tasks: Find the total number of Customers
--Find the total number of scores for Customers
--additionally provide all customers Details

				USECASE #3 Data Quality Check
		Detecting number of nulls by comparing to total number of rows
*/
SELECT 
*,
COUNT(*)  OVER() AS TotalCustomers,
COUNT(score)  OVER() AS TotalScore
FROM Sales.Customers

--Tasks: Check whether the table 'Orders' contains any duplicate rows
SELECT 
*
FROM (
	SELECT
		OrderID,
		COUNT(*) OVER (PARTITION BY OrderID) checkpk
FROM Sales.OrdersArchive
)t WHERE CheckPk > 1
 
/* 2. SUM()
 Returns the sum of values within a window
 Rule: Sum() Accepts Only Numbers

 Tasks: Find the total sales across all orders
 and the total sales for each product.
 Additionally ,provide details such as order ID and order date
						Usecase #01 Overall Analysis
				Quick summary or snapchat of the entire dataset
 */
 SELECT
 OrderID,
 OrderDate,
 ProductID,
 Sales,
 SUM(sales) OVER() TotalSales,
 SUM(sales) OVER(PARTITION BY ProductID) TotalSales
 FROM Sales.Orders
 
 /*
					Usecase #02  Comparsion Usecase
				Compare the current value and aggregated value of window function
				    Usecase #03  Part_to_whole
			Shows the contribution of each data point to the overall dataset


Tasks: Find the percantage contribution of each products sales to the total sales
*/
SELECT 
OrderID,
ProductID,
SUM(Sales) OVER () AS Totalsales,
ROUND(CAST(Sales AS float) / SUM(Sales) OVER () * 100,2) PercentageOfTotal
FROM Sales.orders

/*
3. AVG()
Returns the average of values within a window

Tasks: Find the average  sales across all orders
 and the average sales for each product.
 Additionally ,provide details such as order ID and order date

                    Usecase #01 Overall Analysis
				Quick summary or snapchat of the entire dataset

					Usecase #02 Total Per Groups 
				Group-wise analysis ,to understand patterns within different catergories

*/
SELECT
	 OrderID,
	 OrderDate,
	 ProductID,
	 Sales,
	 AVG(sales) OVER() avgSales,
	 AVG(sales) OVER(PARTITION BY ProductID) AS AvgSalesByProducts
FROM Sales.Orders

-- Tasks: Find the average scores of customers additionally provide details such CustomerID And LastName

SELECT 
CustomerID,
LastName,
Score,
COALESCE (Score,0) CustomerScore,
AVG(Score) OVER() Avgscore,
AVG(COALESCE (Score,0)) OVER() AvgscoreWithoutNull
FROM Sales.Customers

/* Tasks: Find  all orders where sales are higher than the average sales across all orders
					Usecase #03  Comparsion Usecase
				Helps to evaluate whether a value is above or below the average 
*/
SELECT
*
FROM(
	SELECT 
		OrderID,
		ProductID,
		Sales,
		AVG(Sales) OVER() AS AvgSales
	FROM Sales.Orders
)t  WHERE sales > AvgSales
