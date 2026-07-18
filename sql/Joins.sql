/*why we use the joins
	1. Recombine data (Big picture of data)
	2. Data Enrichment "Getting Extra Data "
	3.Check for existance of data (Filtering) 
*/

                --Types of Join--
				--1. NO JOIN
--Returns Data from table without combining them
-- Two results no need to combine
--Sytnax : SELECT * FROM A; SELECT * FROM B
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




CREATE TABLE orders (
    order_id    INT NOT NULL,
    customer_id INT NOT NULL,
    order_date  DATE,
    sales    INT,
    CONSTRAINT PK_orders PRIMARY KEY (order_id)
);

INSERT INTO orders (order_id, customer_id, order_date, sales) VALUES
    (1001, 1, '2021-01-11', 35),
    (1002, 2, '2021-04-05', 15),
    (1003, 3, '2021-06-18', 20),
    (1004, 6, '2021-08-31', 10)

--Retrieve all data from customers and orders as separate results

SELECT * FROM customers;
SELECT * FROM orders;
                        
                       -- 2. INNER JOIN
        --Retruns only matching rows from the both tables (only common data)
        --Order of tables does not matters
        --Syntax: SELECT * FROM A INNER JOIN B ON A.key=B.key

/* Get all customers along their orders,but only for customers who have
   placed order */

SELECT
    id,
    first_name,
    order_id,
    sales 
FROM customers 
INNER JOIN orders
ON  customers.id = orders.customer_id

                          -- 3. LEFT JOIN
            --Returns All rows from left and only matching from right
            --Order of tables is important
            --Syntax: SELECT * FROM A LEFT JOIN B ON A.key=B.key
-- Get all the customers along with their orders including those without orders
SELECT 
     c.id,
     c.first_name,
     o.order_id,
     o.sales
 FROM customers AS c 
 LEFT JOIN orders AS o 
 ON c.id=o.customer_id

                            -- 4. RIGHT JOIN
            --Returns All rows from RIGHT and only matching from LEFT
            --Order of tables is important
            --Syntax: SELECT * FROM A RIGHT JOIN B ON A.key=B.key

-- Get all the customers along with their orders, including those without matching customers;
SELECT 
     c.id,
     c.first_name,
     o.order_id,
     o.sales
 FROM customers AS c 
 RIGHT JOIN orders AS o 
 ON c.id=o.customer_id

 --Same task with left join
SELECT 
     c.id,
     c.first_name,
     o.order_id,
     o.sales
FROM orders AS o 
LEFT JOIN  customers AS c
ON c.id=o.customer_id
                            -- 5. FULL JOIN
            --Returns All rows from both tables
            --Order of tables does not matter
            --Syntax: SELECT * FROM A FULL JOIN B ON A.key=B.key

--Get all customes and all orders,even if there is no match
SELECT 
     c.id,
     c.first_name,
     o.order_id,
     o.sales
FROM  customers AS c 
FULL JOIN orders AS o 
ON c.id=o.customer_id

                             -- 6. LEFT ANTI JOIN
            --Returns rows from LEFT that has NO MATCH in right table
            --Order of tables is important
            --Syntax: SELECT * FROM A LEFT JOIN B ON A.key=B.key WHERE B.key IS NULL

--Get all the customer who havenot place any order.

SELECT *
FROM  customers AS c 
LEFT JOIN orders AS o 
ON c.id=o.customer_id
WHERE o.customer_id IS NULL
                                
                                -- 7. RIGHT ANTI JOIN
            --Returns rows from RIGHT that has NO MATCH in LEFT table
            --Order of tables is important
            --Syntax: SELECT * FROM A RIGHT JOIN B ON A.key=B.key WHERE A.key IS NULL
--Get all the order who havenot place any customers.

SELECT *
FROM  customers AS c 
RIGHT JOIN orders AS o 
ON c.id=o.customer_id
WHERE  c.id IS NULL

--same task with LEFT JOIN
SELECT *
FROM  orders AS o  
LEFT JOIN customers AS c
ON o.customer_id = c.id
WHERE c.id IS NULL
                                
                                -- 8. FULL ANTI JOIN
            --Returns Only rows  that do NOT MATCH in either table
            --Order of tables does not matter
            --Syntax: SELECT * FROM A FULL JOIN B ON A.key=B.key WHERE B.key IS NULL OR A.key IS NULL 

--Find customers without orders and order without customers
SELECT * FROM customers
FULL JOIN orders
ON id=customer_id
WHERE id IS NULL OR customer_id IS NULL

/* Get all customers along their orders,but only for customers who have
   placed order
   Without using INNER JOIN!! */

SELECT * FROM customers as c
LEFT JOIN orders as o
ON c.id =o.customer_id
WHERE o.customer_id IS NOT NULL
                            
                            -- 9. CROSS JOIN
            --Combines Every row from left with Every row from Right
            --all possible combination ---> Cartersian product
            --Order of tables does not matter
            --Syntax: SELECT * FROM A CROSS JOIN B

-- Generate all possible combinations of customers and orders
SELECT * FROM customers CROSS JOIN orders