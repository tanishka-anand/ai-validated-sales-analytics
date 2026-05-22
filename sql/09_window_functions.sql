-- ================================================
-- FILE: 09_window_functions.sql
-- PURPOSE: Advanced analysis using window functions
-- ================================================

-- Q8: Month over Month Revenue Change
-- Uses LAG window function
SELECT
    YEAR_ID,
    MONTH_ID,
    ROUND(SUM(SALES), 2) AS monthly_revenue,
    ROUND(SUM(SALES) - LAG(SUM(SALES)) OVER (ORDER BY YEAR_ID, MONTH_ID), 2) AS mom_change,
    ROUND((SUM(SALES) - LAG(SUM(SALES)) OVER (ORDER BY YEAR_ID, MONTH_ID)) /
    LAG(SUM(SALES)) OVER (ORDER BY YEAR_ID, MONTH_ID) * 100, 1) AS mom_pct_change
FROM sales
GROUP BY YEAR_ID, MONTH_ID
ORDER BY YEAR_ID, MONTH_ID;

-- Q9: Customer Rank Within Each Country
-- Uses RANK() with PARTITION BY
SELECT
    CUSTOMERNAME,
    COUNTRY,
    ROUND(SUM(SALES), 2) AS total_revenue,
    RANK() OVER (PARTITION BY COUNTRY ORDER BY SUM(SALES) DESC) AS rank_in_country
FROM sales
GROUP BY CUSTOMERNAME, COUNTRY
ORDER BY COUNTRY, rank_in_country;

-- Q10: Running Total Revenue Over Time
SELECT
    YEAR_ID,
    MONTH_ID,
    ROUND(SUM(SALES), 2) AS monthly_revenue,
    ROUND(SUM(SUM(SALES)) OVER (ORDER BY YEAR_ID, MONTH_ID), 2) AS running_total
FROM sales
GROUP BY YEAR_ID, MONTH_ID
ORDER BY YEAR_ID, MONTH_ID;

-- Q11: Product Line Revenue Share Within Each Year
SELECT
    YEAR_ID,
    PRODUCTLINE,
    ROUND(SUM(SALES), 2) AS revenue,
    ROUND(SUM(SALES) / SUM(SUM(SALES)) OVER (PARTITION BY YEAR_ID) * 100, 1) AS pct_of_yearly_revenue
FROM sales
GROUP BY YEAR_ID, PRODUCTLINE
ORDER BY YEAR_ID, revenue DESC;
