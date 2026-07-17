--SQL WHERE CONDITION(AND,OR,NOT,LIKE,BETWEEN,IN)

--Comparsion operator

-- '=' Check if two values are equal

--Retrieve all customers from Germany
SELECT * FROM customers 
WHERE country = 'Germany'

-- '!=' or <> Check if two values are Not equal

--Retrieve all customers who are not from Germany
SELECT * FROM customers 
WHERE country != 'Germany'

-- '>' checks if a value is greater than another value.

--Retrieve all customer with a score greater than 500.
SELECT * FROM customers 
WHERE Score > 500

-- '>=' checks if a value is greater than or equal to another value.

--Retrieve all customer with a score of 500 or more.
SELECT * FROM customers 
WHERE Score >= 500


-- '<' checks if a value is less than another value.

--Retrieve all customer with a score less than 500.
SELECT * FROM customers 
WHERE Score < 500

-- '<=' checks if a value is less than or equal to another value.

--Retrieve all customer with a score of 500 or more.
SELECT * FROM customers 
WHERE Score <= 500

--LOGICAL OPERATOR

--'AND' ALL Conditions must be TRUE

--Retrieve all customers who are from the USA AND have score greater than 500 
SELECT * FROM customers
WHERE country ='USA' AND score > 500

--OR At least one condition must be TRUE

--Retrieve all customers who are from the USA OR have score greater than 500 
SELECT * FROM customers
WHERE country = 'USA' OR score > 500

--NOT (Reverse Excludes Matching values)

--Retrieve all customers with a score NOT less than 500

SELECT * FROM customers
WHERE NOT  score >= 500

--RANGE OPERATOR

--BETWEEN --> Check if a value is within a range

--Retrieve all customers whose score falls in the range between 100 and 500
SELECT * FROM customers
WHERE score BETWEEN 100 AND 500

SELECT * FROM customers
WHERE score >= 100 AND  score <= 500

--MEMBERSHIP OPERATOR

-- IN -->Check if a value exist in a list

--Retrieve all customers from either Germany or USA
SELECT * FROM customers
WHERE country = 'Germany' OR country = 'USA'
                        --OR 
SELECT * FROM customers
WHERE country IN ('Germany','USA') 

--SEARCH OPERATOR

--LIKE --> Search for a pattern in text 
--% anything (one character,many) 
--'_' exact one character 

--Find all customers whose first name is start with 'M'
SELECT * FROM customers 
WHERE first_name LIKE 'M%'

-- Find all customers whose first name is ends with 'n'
SELECT * FROM customers 
WHERE first_name LIKE '%n'

--Find all customers whose first name contain 'r'
SELECT * FROM customers 
WHERE first_name LIKE '%r%'

--Find all customers whose first name has 'r' in the 3rd positon

SELECT * FROM customers 
WHERE first_name LIKE '__r%'
