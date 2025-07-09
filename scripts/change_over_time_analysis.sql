/*
Change Over Time Analysis
====================================================================
Purpose:
	- To track trends, growth and changes in key metrics over time.
	- For time-series analysis and identifying seasonality.
	- To measure growth or decline over specific periods

SQL Functions Used:
	- DATEPART()
	- Aggregate Functions: SUM(), COUNT(),
====================================================================
*/


-- Analyse sales performance over time

SELECT
YEAR(order_date) as order_year,
MONTH(order_date) as order_month,
SUM(sales_amount) AS total_sales,
COUNT(DISTINCT customer_key) as total_customers,
SUM(quantity) as total_quantity
FROM gold.fact_sales
WHERE order_date IS NOT NULL
GROUP BY YEAR(order_date), MONTH(order_date)
ORDER BY YEAR(order_date), MONTH(order_date)