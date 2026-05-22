-- ================================================
-- FILE: 03_product_analysis.sql
-- PURPOSE: Revenue by product line
-- BUSINESS QUESTION: Which lines drive revenue vs just volume?
-- ================================================

SELECT
    PRODUCTLINE,
    COUNT(ORDERNUMBER) AS total_orders,
    ROUND(SUM(SALES), 2) AS total_revenue,
    ROUND(AVG(SALES), 2) AS avg_order_value
FROM sales
GROUP BY PRODUCTLINE
ORDER BY total_revenue DESC;
