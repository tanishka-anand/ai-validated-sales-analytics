-- ================================================
-- FILE: 07_deal_size.sql
-- PURPOSE: Deal size breakdown
-- BUSINESS QUESTION: Where is revenue concentrated by deal size?
-- ================================================

SELECT
    DEALSIZE,
    COUNT(*) AS order_count,
    ROUND(SUM(SALES), 2) AS total_revenue,
    ROUND(AVG(SALES), 2) AS avg_value
FROM sales
GROUP BY DEALSIZE
ORDER BY total_revenue DESC;
