/*Select  Statement 
 the select statement only in order to read the something from the database.
 in similar word we can say that to retrieve data from the database.
 does not modify the original data
 used to ask the question form the database then database will give you response of that.


Select *(All)
retrieve all colums(everything)
From
Tells SQL where to find the data 
*/
Create Database selectQuery
CREATE TABLE customers (
    id INT NOT NULL,
    first_name  VARCHAR(50) NOT NULL,
    country     VARCHAR(50),
    score       INT,
    CONSTRAINT PK_customers PRIMARY KEY (id)
);



INSERT INTO customers (id, first_name, country, score) VALUES
    (1, 'Maria',     'Germany', 350),
    (2, ' John',     'USA',     900),
    (3, 'Georg',   'UK',      750),
    (4, 'Martin', 'Germany', 500),
    (5, 'Peter',   'USA',     0);

-- Retrieve all Cutsomer Data

SELECT *
FROM customers;

--Select Few Columns which you need instead of all
SELECT 
    first_name,
    country
FROM customers

--Where Clause to filter the data based on a condition
--task Retrieve the customer with a score not equal to 0
SELECT *
FROM customers
WHERE score != 0

--Retrieve customers from Germany
SELECT *
FROM customers
WHERE country = 'Germany'

-- Order By  --> Sort the data in Ascending (lowest to Highest) and Descending (Highest to lowest ) 

--retieve all customer and sort the result by highest score first

SELECT *
FROM customers
ORDER BY score DESC

--retieve all customer and sort the result by lowest score first

SELECT *
FROM customers
ORDER BY score ASC

--retieve all customer and sort the result by the country and then by highest score first
SELECT *
FROM customers
ORDER BY country ASC,score DESC

--GROUP BY --> Combines rows with the same value 
           --> aggregate a column by another a column

--Find the total score for each country
SELECT 
    country,
    SUM(score) AS Total_score
FROM customers
GROUP BY country

--Find the total score and total number of customers for each country

SELECT 
    country,
    SUM(score) AS total_score,
    COUNT(id)  AS total_customer
FROM customers
GROUP BY country

-- Having Clause --> Filters data after aggregation
                 --> can be used only with group 

/* Find the average score for each country considering only customers
   with the score not equal to 0 and return onlu those countries with
   an average score greater than 430
*/
SELECT 
    country,
    AVG(score) AS avg_score
FROM customers
WHERE score !=0
GROUP BY country
HAVING AVG(score)>430

--DISTINCT -->Remove duplicates (repeated values)
           -->each values appears only once

--Return unique list of all countries
SELECT DISTINCT
country 
FROM customers

--TOP QUERY -->Limit your data
            -->restrict the numbers of rows returned 

--Retrieve only 3 Customers
SELECT TOP 3 *
FROM customers

--Retrieve the Top 3 Customers with the highest score
SELECT TOP 3 *
FROM customers
ORDER BY score DESC

--Retrieve the Lowest 2 Customers based on score
SELECT TOP 2 *
FROM customers
ORDER BY score ASC