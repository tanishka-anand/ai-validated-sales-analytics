# AI-Powered Sales Performance Analysis
## MySQL + ChatGPT + Power BI | Zero Python | 6 Days

**This project tests whether AI-generated business insights 
can be trusted without validation — and quantifies exactly 
how often they can't.**

---

## Project Overview

Analyzed 2,823 B2B sales records across 3 years, multiple 
countries and 7 product lines using MySQL for structured 
querying, ChatGPT for AI-generated insights, and Power BI 
for executive reporting.

---

## What Makes This Different From Other Analytics Projects

| Area | What Was Done | Why It Matters |
|------|---------------|----------------|
| Data Quality | ORDERDATE stored as VARCHAR was caught, converted to DATE, cross-validated against YEAR_ID and MONTH_ID | Shows data quality thinking before analysis |
| Analytical SQL | Window functions — LAG, RANK, PARTITION BY, running totals | Separates basic SQL from analytical SQL |
| AI Validation | Every ChatGPT claim verified with SQL query | Shows AI literacy — not just AI usage |
| Business Thinking | 4 hypotheses tested beyond surface numbers | Shows analyst thinking not report running |

---

## Key Findings

- **Classic Cars = 39.1% of total revenue** across 967 orders 
  — dominant product line but volume-driven, not premium-driven
- **November drives 18.1% of annual revenue** — structural Q4 
  dependency confirmed across both 2003 and 2004
- **Euro Shopping Channel = 9.09% of total revenue ($912K)** 
  — single account risk exceeding Trains + Ships combined
- **Large deals = only 5.6% of orders but $8,293 AOV** 
  — 4x Small deals, biggest untapped revenue opportunity
- **ChatGPT incorrectly identified April as weakest month** 
  — SQL showed January (2003) and March (2004) are actually 
  weaker in their respective years

---

## AI vs SQL Validation Results

| Result | Count |
|--------|-------|
| Correct | 5 |
| Partial or Misleading | 3 |
| Wrong | 1 |
| Logically Unsupported | 1 |
| **Total claims tested** | **10** |

Most dangerous error: ChatGPT identified April as the 
consistently weakest month across all years. SQL validation 
showed January is weakest in 2003 and March in 2004. 
Accepting this finding would have misdirected pipeline-building 
efforts by two months.

---

## SQL Queries Written

| File | Query | Technique |
|------|-------|-----------|
| 03_product_analysis.sql | Revenue by product line | GROUP BY, ORDER BY |
| 04_monthly_trends.sql | Monthly revenue trend | GROUP BY, multi-year |
| 05_customer_analysis.sql | Top 10 customers | GROUP BY, LIMIT |
| 06_country_revenue.sql | Revenue by country | GROUP BY, AVG |
| 07_deal_size.sql | Deal size breakdown | GROUP BY |
| 08_quarterly_performance.sql | Quarterly revenue | GROUP BY |
| 09_window_functions.sql | MoM change, customer rank, running total, revenue share | LAG, RANK, PARTITION BY |
| 10_validation_queries.sql | AI claim verification | All techniques |

---

## Power BI Dashboard

3-page dashboard exported as PDF:

- **Page 1 — Executive Overview** — KPIs, product line revenue, 
  deal size distribution, AI validation summary
- **Page 2 — Seasonality Analysis** — monthly trend, quarterly 
  performance, MoM momentum
- **Page 3 — Customer & Geographic Risk** — top customers, 
  country concentration, per-country risk

---

## Data Quality Issue Found

ORDERDATE was stored as VARCHAR making all time-based 
analysis unreliable. Fixed by:
1. Adding ORDER_DATE_CLEAN column as DATE type
2. Converting using STR_TO_DATE function
3. Verifying zero null conversions
4. Cross-validating against existing YEAR_ID and MONTH_ID columns

---

## Tools Used

MySQL Workbench | ChatGPT | Power BI Desktop

## Dataset

Source: Kaggle — Sample Sales Data by kyanyoga
Records: 2,823 | Years: 2003-2005 | Countries: 19
