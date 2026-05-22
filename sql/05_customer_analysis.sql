-- ================================================
-- FILE: 05_customer_analysis.sql
-- PURPOSE: Top 10 customers by revenue
-- BUSINESS QUESTION: Who are our highest value customers?
-- ================================================

SELECT
    CUSTOMERNAME,
    COUNTRY,
    ROUND(SUM(SALES), 2) AS total_spent,
    COUNT(DISTINCT ORDERNUMBER) AS total_orders
FROM sales
GROUP BY CUSTOMERNAME, COUNTRY
ORDER BY total_spent DESC
LIMIT 10;
