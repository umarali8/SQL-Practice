/*                       -- SQL DATE & TIME FUNCTIONS --

 FORMAT() 
    FORMAT can also be used to create custom date and time formats by combining
    multiple format specifiers.

TASK 9:
   Format CreationTime into various string representations.
*/
SELECT
    OrderID,
    CreationTime,
    FORMAT(CreationTime, 'MM-dd-yyyy') AS USA_Format,
    FORMAT(CreationTime, 'dd-MM-yyyy') AS EURO_Format,
    FORMAT(CreationTime, 'dd') AS dd,
    FORMAT(CreationTime, 'ddd') AS ddd,
    FORMAT(CreationTime, 'dddd') AS dddd,
    FORMAT(CreationTime, 'MM') AS MM,
    FORMAT(CreationTime, 'MMM') AS MMM,
    FORMAT(CreationTime, 'MMMM') AS MMMM
FROM Sales.Orders;

/* TASK 10:
   Display CreationTime using a custom format:
   Example: Day Wed Jan Q1 2025 12:34:56 PM
*/
SELECT
    OrderID,
    CreationTime,
    'Day ' + FORMAT(CreationTime, 'ddd MMM') +
    ' Q' + DATENAME(quarter, CreationTime) + ' ' +
    FORMAT(CreationTime, 'yyyy hh:mm:ss tt') AS CustomFormat
FROM Sales.Orders;

/* TASK 11:
   How many orders were placed each year, formatted by month and year (e.g., "Jan 25")?
*/
SELECT
    FORMAT(CreationTime, 'MMM yy') AS OrderDate,
    COUNT(*) AS TotalOrders
FROM Sales.Orders
GROUP BY FORMAT(CreationTime, 'MMM yy');

/* 
   CONVERT()
        CONVERT() converts an expression from one data type to another. It also supports
        style codes for formatting dates.
   Syntax:
        CONVERT(data_type, expression [, style])

   Examples:
        SELECT CONVERT(INT,'123');
        SELECT CONVERT(DATE,'2025-08-20');
        SELECT CONVERT(VARCHAR,GETDATE(),101);


 TASK 12:
   Demonstrate conversion using CONVERT.
*/
SELECT
    CONVERT(INT, '123') AS [String to Int CONVERT],
    CONVERT(DATE, '2025-08-20') AS [String to Date CONVERT],
    CreationTime,
    CONVERT(DATE, CreationTime) AS [Datetime to Date CONVERT],
    CONVERT(VARCHAR, CreationTime, 32) AS [USA Std. Style:32],
    CONVERT(VARCHAR, CreationTime, 34) AS [EURO Std. Style:34]
FROM Sales.Orders;

/*
   CAST()
        CAST converts an expression from one data type to another using standard SQL
   
    Syntax:
    CAST(expression AS data_type)

    Examples:
    SELECT CAST('123' AS INT);
    SELECT CAST(123 AS VARCHAR);
    SELECT CAST(GETDATE() AS DATE);
    TASK 13:
    Convert data types using CAST.
*/
SELECT
    CAST('123' AS INT) AS [String to Int],
    CAST(123 AS VARCHAR) AS [Int to String],
    CAST('2025-08-20' AS DATE) AS [String to Date],
    CAST('2025-08-20' AS DATETIME2) AS [String to Datetime],
    CreationTime,
    CAST(CreationTime AS DATE) AS [Datetime to Date]
FROM Sales.Orders;

/*
   DATEADD() / DATEDIFF()
  
        DATEADD adds or subtracts a specified date part to a date.

    Syntax:
        DATEADD(datepart, number, date)

    Examples:
        SELECT DATEADD(day,10,GETDATE());
        SELECT DATEADD(month,3,GETDATE());
        SELECT DATEADD(year,-1,GETDATE());

    Definition:
        DATEDIFF returns the difference between two dates in the specified date part.
        It is commonly used to calculate age or duration.

    Syntax:
        DATEDIFF(datepart, start_date, end_date)

    Examples:
        SELECT DATEDIFF(day,'2025-08-01','2025-08-20');
        SELECT DATEDIFF(year,BirthDate,GETDATE());


    TASK 14:
        Perform date arithmetic on OrderDate.
*/
SELECT
    OrderID,
    OrderDate,
    DATEADD(day, -10, OrderDate) AS TenDaysBefore,
    DATEADD(month, 3, OrderDate) AS ThreeMonthsLater,
    DATEADD(year, 2, OrderDate) AS TwoYearsLater
FROM Sales.Orders;



