-- ================================================
-- FILE: 10_validation_queries.sql
-- PURPOSE: Verify every ChatGPT claim with SQL
-- This is the AI validation framework
-- ================================================

-- CLAIM 1: Classic Cars = ~39% of total revenue
SELECT
    PRODUCTLINE,
    ROUND(SUM(SALES), 2) AS revenue,
    ROUND(SUM(SALES) / (SELECT SUM(SALES) FROM sales) * 100, 2) AS pct_of_total
FROM sales
GROUP BY PRODUCTLINE
ORDER BY revenue DESC;
-- VERDICT: CORRECT — Classic Cars = 39.07%

-- CLAIM 2: April is consistently weakest month across all years
SELECT
    YEAR_ID,
    MONTH_ID,
    ROUND(SUM(SALES), 2) AS monthly_revenue
FROM sales
GROUP BY YEAR_ID, MONTH_ID
ORDER BY YEAR_ID, monthly_revenue ASC;
-- VERDICT: WRONG
-- 2003 weakest = January ($129,753)
-- 2004 weakest = March ($205,733)
-- April only weakest in 2005

-- CLAIM 3: Top 3 customers = 17.62% of total revenue
SELECT
    CUSTOMERNAME,
    ROUND(SUM(SALES), 2) AS customer_revenue,
    ROUND(SUM(SALES) / (SELECT SUM(SALES) FROM sales) * 100, 2) AS pct_of_total
FROM sales
GROUP BY CUSTOMERNAME
ORDER BY customer_revenue DESC
LIMIT 5;
-- VERDICT: CORRECT — Top 3 = 17.62%

-- CLAIM 4: Large deal AOV = $8,293.75 nearly 4x Small deals
SELECT
    DEALSIZE,
    COUNT(*) AS order_count,
    ROUND(SUM(SALES), 2) AS total_revenue,
    ROUND(AVG(SALES), 2) AS avg_value,
    ROUND(COUNT(*) / (SELECT COUNT(*) FROM sales) * 100, 2) AS pct_of_orders
FROM sales
GROUP BY DEALSIZE
ORDER BY total_revenue DESC;
-- VERDICT: CORRECT — Large AOV = $8,293.75
-- ADDITIONAL CONTEXT MISSED: Large = only 5.6% of orders

-- CLAIM 5: November is peak month
SELECT
    YEAR_ID,
    MONTH_ID,
    ROUND(SUM(SALES), 2) AS monthly_revenue
FROM sales
GROUP BY YEAR_ID, MONTH_ID
ORDER BY monthly_revenue DESC
LIMIT 5;
-- VERDICT: CORRECT — Nov 2004 = $1,089,048

-- CLAIM 6: November = 18.1% of 2004 annual revenue
SELECT
    ROUND(SUM(CASE WHEN YEAR_ID = 2004 AND MONTH_ID = 11 THEN SALES ELSE 0 END), 2) AS nov_2004,
    ROUND(SUM(CASE WHEN YEAR_ID = 2004 THEN SALES ELSE 0 END), 2) AS total_2004,
    ROUND(SUM(CASE WHEN YEAR_ID = 2004 AND MONTH_ID = 11 THEN SALES ELSE 0 END) /
    SUM(CASE WHEN YEAR_ID = 2004 THEN SALES ELSE 0 END) * 100, 1) AS nov_pct_of_2004
FROM sales;
-- VERDICT: CORRECT

-- CLAIM 7: Euro Shopping Channel = 9.09% of total revenue
SELECT
    CUSTOMERNAME,
    ROUND(SUM(SALES), 2) AS customer_revenue,
    ROUND(SUM(SALES) / (SELECT SUM(SALES) FROM sales) * 100, 2) AS pct_of_total
FROM sales
WHERE CUSTOMERNAME = 'Euro Shopping Channel'
GROUP BY CUSTOMERNAME;
-- VERDICT: CORRECT — 9.09%

-- CLAIM 8: 2005 data is incomplete
SELECT
    YEAR_ID,
    COUNT(DISTINCT MONTH_ID) AS months_with_data,
    ROUND(SUM(SALES), 2) AS total_revenue
FROM sales
GROUP BY YEAR_ID;
-- VERDICT: PARTIAL — 2005 has only 5 months
-- ChatGPT offered business explanations instead of flagging data completeness
