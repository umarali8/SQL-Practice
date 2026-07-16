--DDL COMMANDS __. define the structure of database

/*Create a new table called persons with columns :
id,person_name,birth_date and phone*/

-- CREATE COMMAND
CREATE TABLE persons(
 id INT NOT NULL,
 person_name VARCHAR(20) NOT NULL,
 birth_date DATE,
 phone VARCHAR(13) NOT NULL
 CONSTRAINT pk_persons PRIMARY KEY (id)
)

SELECT * FROM persons

-- ALTER COMMAND

--Add a new colums called email to the persons table
ALTER TABLE persons 
ADD email VARCHAR(50) NOT NULL

--Remove the column phone from the persons table
ALTER TABLE persons 
DROP COLUMN phone


--DROP COMMAND 

--Delete the table persons from the database
DROP TABLE persons