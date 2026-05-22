-- ================================================
-- FILE: 08_quarterly_performance.sql
-- PURPOSE: Quarterly revenue performance
-- BUSINESS QUESTION: Which quarters are strongest and why?
-- ================================================

SELECT
    YEAR_ID,
    QTR_ID,
    ROUND(SUM(SALES), 2) AS quarterly_revenue,
    COUNT(DISTINCT ORDERNUMBER) AS total_orders
FROM sales
GROUP BY YEAR_ID, QTR_ID
ORDER BY YEAR_ID, QTR_ID;
