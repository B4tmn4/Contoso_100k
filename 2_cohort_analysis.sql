--title: Customer Revenue by First Purchase Year --

-- checks for revenue from only their first orders as this is when the customer is likely to spend the most money
SELECT 
	cohort_year,
	COUNT(DISTINCT customerkey) AS total_customers,
	SUM(total_net_revenue) AS total_revenue,
	SUM(total_net_revenue) / COUNT(DISTINCT customerkey) AS customer_revenue -- total rev / total customers per cohort
FROM 
	cohort_analysis 
WHERE orderdate = first_purchase_date -- adjusts for time in market
GROUP BY cohort_year
ORDER BY cohort_year; 


-- title: Monthly Revenue and Customer Count Over time
SELECT 
	DATE_TRUNC( 'month', orderdate)::date AS year_month,
	COUNT(DISTINCT customerkey) AS total_customers,
	SUM(total_net_revenue) AS total_revenue,
	SUM(total_net_revenue) / COUNT(DISTINCT customerkey) AS customer_revenue -- total rev / total customers
FROM 
	cohort_analysis
GROUP BY
	year_month
ORDER BY
	year_month;
