/*						-- STRING FUNCTIONS --
			-- Manipulation of string & calculation --
	1.	CONCAT
		Combines multiple strings into one

  Tasks:- Concatenate the first name and country into one column
*/

SELECT 
	first_name,
	country,
CONCAT(first_name,'-',country) AS name_country
FROM customers
/*
	2. UPPER
		Converts all characters to uppercase
	3. LOWER
		Converts all characters to lowercase

 Tasks:- Convert the firstname to lowercase and upper case 
*/

SELECT 
first_name,
LOWER(first_name) AS Lower_case,
UPPER(first_name) AS Upper_case
FROM customers

/*	4. TRIM 
		Remove Leading and Trailing space

  Tasks:-  Find customers whose first name contain leading or trailing spaces
*/

-- 1st method
SELECT
	first_name
FROM customers
WHERE first_name != TRIM(first_name)

-- 2nd method
SELECT
	first_name,
	LEN(first_name) AS len_name,
	LEN(TRIM(first_name)) AS len_trim_name,
	LEN(first_name) - LEN(TRIM(first_name)) AS flag
FROM customers

/* 
	5. REPLACE
		Replaces specific character with a new character
		Not only replace but also remove with blank or nothing

    Task:- 1. Removes dashes (-) from a Phone number
*/

SELECT 
'123-456-7890' AS phone,
REPLACE('123-456-7890','-','/') AS Clean_phone

-- Task:- 2. Replace file Extence from txt to csv

SELECT 
'report.txt' AS old_filename,
REPLACE('report.txt','txt','csv') AS New_filename

/*
	6. LEN
		Counts how many characters

Tasks:- Calculate the length of each customers first name.
*/

SELECT 
	first_name,
	LEN(first_name) AS Len_name
FROM customers

/*				-- STRING EXTRACTION FUNCTION --
	7. LEFT
		Extracts specific number of characters from the start
	8. RIGHT
		Extracts spect number of character from the end

	Tasks:- 1. Retrieve the first two characters of each first name
*/

SELECT 
	first_name,
	LEFT(TRIM(first_name), 2) AS first_2_char
FROM customers

-- 2. 1. Retrieve the last two characters of each first name

SELECT 
	first_name,
	RIGHT(first_name, 2) AS Last_2_char
FROM customers

/* 
	9. substring
	 Extracts a part of string at a specified position
	 SUBSTRING(Value,Start,Length)

Tasks:- Retrieve a lists of customers first names removing the first character

*/

SELECT 
	first_name,
	SUBSTRING(TRIM(first_name), 2, LEN(first_name)) AS Sub_name
FROM customers