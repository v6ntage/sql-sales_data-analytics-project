/*
Cumulative Analysis
====================================================================
Purpose:
	- To track performance over time cumulatively.
	- Calculate the total sales per month.
	- Running total of sales over time.

SQL Functions Used:
	- Window Functions: SUM() OVER(), AVG() OVER()
====================================================================
*/

SELECT
order_date,
total_sales,
SUM(total_sales) OVER (ORDER BY order_date) AS running_total_sales,
AVG(avg_price) OVER (ORDER BY order_date) AS moving_average_price
FROM
(
SELECT
DATETRUNC(year, order_date) AS order_date,
SUM(sales_amount) AS total_sales,
AVG(price) AS avg_price
FROM gold.fact_sales
WHERE order_date IS NOT NULL
GROUP BY DATETRUNC(year, order_date)
) t