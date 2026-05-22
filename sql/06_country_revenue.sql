-- ================================================
-- FILE: 06_country_revenue.sql
-- PURPOSE: Revenue by country
-- BUSINESS QUESTION: Which geographies drive the most revenue?
-- ================================================

SELECT
    COUNTRY,
    ROUND(SUM(SALES), 2) AS total_revenue,
    COUNT(DISTINCT CUSTOMERNAME) AS unique_customers,
    ROUND(AVG(SALES), 2) AS avg_order_value
FROM sales
GROUP BY COUNTRY
ORDER BY total_revenue DESC;
