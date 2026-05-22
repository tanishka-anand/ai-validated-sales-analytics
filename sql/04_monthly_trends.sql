-- ================================================
-- FILE: 04_monthly_trends.sql
-- PURPOSE: Monthly revenue trend
-- BUSINESS QUESTION: Is there seasonality? Are we growing YoY?
-- ================================================

SELECT
    YEAR_ID,
    MONTH_ID,
    ROUND(SUM(SALES), 2) AS monthly_revenue,
    COUNT(ORDERNUMBER) AS order_count
FROM sales
GROUP BY YEAR_ID, MONTH_ID
ORDER BY YEAR_ID, MONTH_ID;
