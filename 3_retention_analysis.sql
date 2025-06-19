

-- title: Churn rate grouped by customer status 

-- CTE that assigns rownumber to orderdates for customers --
WITH customer_last_purchase AS (
	SELECT
		customerkey,
		cleaned_name,
		orderdate,
		first_purchase_date,
		cohort_year,
		ROW_NUMBER() OVER (
			PARTITION BY customerkey
			ORDER BY
			orderdate DESC) AS rn -- assign rownumber TO orderdates
	FROM
		cohort_analysis
),

 churned_customers AS (
	SELECT 
		customerkey,
		cleaned_name,
		cohort_year,
		orderdate AS last_purchase_date,
		CASE 
			WHEN orderdate < (SELECT MAX(orderdate) FROM sales) - INTERVAL '6 months' THEN 'Churned'-- 6 months from most recent orderdate 
			WHEN orderdate < (SELECT MAX(orderdate) FROM sales) - INTERVAL '3 months' THEN 'At Risk' -- identify customers at risk of churning
			ELSE 'Active' 
		END AS customer_status
	FROM customer_last_purchase
	WHERE rn = 1
	-- this filters for customers that have been in the system for atleast 6 months to avoid recency bias
		AND first_purchase_date < (SELECT MAX(orderdate) FROM sales) - INTERVAL '6 months'
)


SELECT 
	customer_status,
	COUNT(customerkey)  AS num_customers,
	SUM(COUNT(customerkey)) OVER() AS total_customers,
	ROUND( (100 * (COUNT(customerkey)) / (SUM(COUNT(customerkey)) OVER()) ) , 2) AS status_pct
FROM churned_customers
GROUP BY  customer_status;






-- title: Churn rate grouped by cohort year


-- CTE that assigns rownumber to orderdates for customers --
WITH customer_last_purchase AS (
	SELECT
		customerkey,
		cleaned_name,
		orderdate,
		first_purchase_date,
		cohort_year,
		ROW_NUMBER() OVER (
			PARTITION BY customerkey
			ORDER BY
			orderdate DESC) AS rn -- assign rownumber TO orderdates
	FROM
		cohort_analysis
),

 churned_customers AS (
	SELECT 
		customerkey,
		cleaned_name,
		cohort_year,
		orderdate AS last_purchase_date,
		CASE 
			WHEN orderdate < (SELECT MAX(orderdate) FROM sales) - INTERVAL '6 months' THEN 'Churned'-- 6 months from most recent orderdate 
			WHEN orderdate < (SELECT MAX(orderdate) FROM sales) - INTERVAL '3 months' THEN 'At Risk' -- identify customers at risk of churning
			ELSE 'Active' 
		END AS customer_status
	FROM customer_last_purchase
	WHERE rn = 1
	-- this filters for customers that have been in the system for atleast 6 months to avoid recency bias
		AND first_purchase_date < (SELECT MAX(orderdate) FROM sales) - INTERVAL '6 months'
)


SELECT 
	customer_status,
	cohort_year,
	COUNT(customerkey)  AS num_customers,
	SUM(COUNT(customerkey)) OVER(PARTITION BY cohort_year) AS total_customers,
	ROUND( (100 * (COUNT(customerkey)) / (SUM(COUNT(customerkey)) OVER(PARTITION BY cohort_year)) ) , 2) AS status_pct
FROM churned_customers
GROUP BY  cohort_year, customer_status;


	
		
	