-- title: Customer Segmentation - Total LTV Distribution

--CTE to store customer LTVs -- 
WITH customer_ltv AS (
	SELECT
		customerkey,
		cleaned_name,
		SUM(total_net_revenue) AS total_ltv
	FROM cohort_analysis
	GROUP BY 
		customerkey,
		cleaned_name
), 

-- CTE to store the values of the low and High Percentiles --
customer_segments AS(
	SELECT 	
		-- USE percentile cont to find the low value and high value customers --
		percentile_cont(0.25) WITHIN GROUP (ORDER BY total_ltv)  AS ltv_25th_percentile, -- low value
		percentile_cont(0.75) WITHIN GROUP (ORDER BY total_ltv)  AS ltv_75th_percentile -- high value
	FROM customer_ltv
),

-- CTE to store segmented customers by LTV --
segment_values AS(
SELECT 
	c.*,
	-- CASE statement to sort each customer by LTV --
	CASE
		WHEN c.total_ltv < cs.ltv_25th_percentile THEN '1 - Low-Value'
		WHEN c.total_ltv > cs.ltv_75th_percentile THEN '3 - High-Value'
		ELSE '2 - Mid-Value'
	END AS customer_segment

FROM 
	customer_ltv AS c,
	customer_segments AS cs
)

SELECT 
	customer_segment,
	-- total ltv per segment --
	SUM(total_ltv) AS sum_total_ltv, 
	-- total customers per segment --
	COUNT(customerkey) AS customer_count, 
	--avg ltv per customer --
	SUM(total_ltv) / COUNT(customerkey) AS avg_ltv, 
	 -- finds percentage OF segments contribution TO total_ltv --
    ROUND( (100.0 * SUM(total_ltv) / (SELECT SUM(total_ltv) FROM segment_values))::NUMERIC, 1)  AS ltv_percentage
FROM segment_values
GROUP BY customer_segment -- lets us see how much revenue EACH TYPE OF customer brings in
ORDER BY customer_segment DESC;



