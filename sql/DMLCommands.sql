--DML COMMANDS -- Modify (manipulate) your data

/* INSERT SYNTAX
INSERT INTO tablename(col1,col2,col3)-- optional : if no cloumns are specified sql excepts values for all columns
Values (val1,val2,val3), -->for single inserts
	   (val1,val2,val3)--> for multiple inserts
RULE: Match the number of cloumns and values */

--Manually inserted values

INSERT INTO customers (id,first_name,country,score)
VALUES 
	(6,'Umar','USA',NULL),
	(7,'Sam',NULL,100)

INSERT INTO customers 
VALUES
	(8,'Adreas','Germany',Null)

SELECT * FROM customers


--INSERT Using SELECT
--Insert data form 'customer' into 'persons'

CREATE TABLE persons(
 id INT NOT NULL,
 person_name VARCHAR(20) NOT NULL,
 birth_date DATE,
 phone VARCHAR(13) NOT NULL
 CONSTRAINT pk_persons PRIMARY KEY (id)
)

INSERT INTO persons (id,person_name,birth_date,phone)

SELECT 
	id,
	first_name,
	NULL,
	'Unknown'
FROM customers 

SELECT * FROM persons

/*
UPDATE SYNTAC
UDPATE table_name
	SET col1=val1,
		col2=val2
	where <condition>
Note: Always use WHERE to avoid Updating all rows un itnentionally
*/

--change the score of customers 6 to 0
UPDATE customers
	 SET  score = 500
	 WHERE id =6

SELECT * FROM customers
WHERE ID = 6

--Change the score of customer 7 to 350 and update the country to uk

update customers
	SET score=350,
		country='UK'
		WHERE id = 7

SELECT * FROM customers

--update all customers with a null score by setting their score to 0
UPDATE customers 
	SET score=0
	WHERE  score IS NULL

/*DELETE SYNTAX

DELETE FORM table_name
Where <condition>
Note: always use WHERE to avoid Deleting all rows unintentionally 
*/

--Delete all customers with an Id greater than 5

DELETE FROM customers
WHERE ID > 5

SELECT * FROM customers

-- delete all data from the persons table
TRUNCATE TABLE persons