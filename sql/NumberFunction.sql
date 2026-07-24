                --NUMBER FUNCTION--
                -- ROUND & ABS --
-- 1. ROUND

SELECT 
    3.516,
    ROUND(3.516, 2) AS Round_2,
    ROUND(3.516, 1) AS Round_1,
    ROUND(3.516, 0) AS Round_0

-- 2.ABS
--  Returns the absolute (positive) value of number, removing negative sign
SELECT
    -10,
    ABS(-10),
    ABS(11)