-- ================================================
-- FILE: 02_data_cleaning.sql
-- PURPOSE: Fix VARCHAR date issue and validate
-- ================================================

-- Step 1: Inspect raw date format
SELECT
    ORDERDATE,
    LENGTH(ORDERDATE) AS char_length
FROM sales
LIMIT 20;

-- Step 2: Add clean date column
ALTER TABLE sales
ADD COLUMN ORDER_DATE_CLEAN DATE;

-- Step 3: Convert and populate
UPDATE sales
SET ORDER_DATE_CLEAN = STR_TO_DATE(ORDERDATE, '%m/%d/%Y %H:%i:%s');

-- Step 4: Verify conversion
SELECT
    ORDERDATE,
    ORDER_DATE_CLEAN
FROM sales
LIMIT 20;

-- Step 5: Check for failed conversions
-- Expected: 0
SELECT COUNT(*)
FROM sales
WHERE ORDER_DATE_CLEAN IS NULL;

-- Step 6: Cross validate against YEAR_ID and MONTH_ID
SELECT
    ORDERDATE,
    ORDER_DATE_CLEAN,
    YEAR_ID,
    YEAR(ORDER_DATE_CLEAN) AS extracted_year,
    MONTH_ID,
    MONTH(ORDER_DATE_CLEAN) AS extracted_month,
    CASE
        WHEN YEAR_ID != YEAR(ORDER_DATE_CLEAN) THEN 'MISMATCH'
        WHEN MONTH_ID != MONTH(ORDER_DATE_CLEAN) THEN 'MISMATCH'
        ELSE 'OK'
    END AS validation_status
FROM sales
LIMIT 50;
