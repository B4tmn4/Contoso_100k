# Contoso E-Commerce - Sales Analysis

## Overview 🗺️

This project dives into sales and customer data from Contoso, a large retail and e-commerce company. The aim is to better understand how customers behave: who spends the most, how long they stick around, and when they tend to drop off.

By using SQL and data visualization tools, the analysis focuses on three key questions:

1. **Customer Segmentation:** Who are our most valuable customers?
2. **Cohort Analysis:** How do different customer groups generate revenue?
3. **Retention Analysis:** Which customers haven't purchased recently?

The goal is to turn these insights into practical recommendations that can help the business grow revenue, retain more customers, and make smarter decisions about who to focus on.

## Analysis Approach 🧠

### ***1. Customer Segmentation***

- Categorized customers based on total lifetime value (LTV)
- Assigned customers to High, Mid, and Low-value segments
- Calculated key metrics: total revenue

🖥️ Query: [1_customer_segmentation.sql](/1_customer_segmentation.sql)

📊  **Visualisations:**

<img src="images\revenueshare_by_segment.png" width=75%>

![LTV percentage VS Customer Count by Segment](images\ltv_pct_vs_customer_count_by_segment.png)

![Average LTV by Segment](images\avg_ltv_by_segment.png)

📌 **Key Findings:**

- 🥇 **High-Value customers** (top 25%) make up only **25% of customers** but generate a massive **65.6% ($135.4M) of total revenue**, with an **average LTV of ~$10,946.**

- 🥈 **Mid-Value customers** (50%) contribute **32.3%** ($66.6M) of revenue, averaging **~$2,693 per customer.**

- 🥉 **Low-Value customers** (bottom 25%) contribute just **2.1%** ($4.3M) of total revenue, with an average LTV of only **~$351** over **30x lower** than high-value customers.

💡 **Business Insights:**

- **Prioritize high-value customers:** Revenue is highly concentrated in VIP customers ($135.4M) Invest in personalized engagement, retention, and premium experiences, as losing one customer significantly impacts revenue

- **Nurture mid-value customers:** Identify behaviors/products or create upgrade paths through personalized promotions that move them into high-value tier. Potential $66.6M → $135.4M revenue opportunity

- **Evaluate acquisition channels for low-value users:** Design re-engagement campaigns and price-sensitive promotions to increase purchase frequency



### ***2. Cohort Analysis*** 

- Tracked revenue and customer count per cohorts
- Cohorts were grouped by year of first purchase
- Analyzed customer retention at a cohort level

🖥️ ***Query:*** [2_cohort_analysis.sql](/2_cohort_analysis.sql)

📊  **Visualisations:**

![Customer Revenue By First Purchase Year](images\customer_rev_by_first_purchase_year.png)

![Monthly Revenue Vs Customer Count](images\monthly_rev_vs_customer_count.png)

📌 **Key Findings:** 

- **Newer customer cohorts (2022–2024) are underperforming** in terms of average revenue per customer, with a ~30% drop in value from ~$2,800 (2016–2019) to under ~$2,000 by 2024.

- Several months *(highlighted in red)* show **high customer counts** but **low revenue per customer**, suggesting a decline in customer spend quality.

*NOTE: Although net revenue is increasing, this is likely due to a larger customer base, which is not reflective of customer value*

💡 **Business Insights:**

- 📉 **Customer value is declining:** Newer cohorts are spending less at the point of acquisition, possibly due to lower-priced product purchases or changes in marketing strategy.

- 🧲 **High acquisition volume doesn’t guarantee revenue growth:** Without increasing average spend or repeat purchases, new customers add less value.

- 🎯 **Review acquisition strategy:** Focus should shift toward **improving first-order conversion value** and identifying **segments that attract higher-spending customers.**

### ***3. Retention Analysis***

- Identified customers at risk of churning (no purchase within last 3 months)
- Analyzed last purchase patterns
- Calculated customer-specific metrics

🖥️ Query: [3_retention_analysis.sql](3_retention_analysis.sql)

📊  **Visualisations:**

<img src="images\customer_status_pct.png" width=75%>

![customer_status_by_cohort](images\customer_status_by_cohort.png)

📌 **Key Findings:**

- **90.5%** of customers are churned — meaning they haven’t made a purchase in the last 6 months. Only **4.4%** remain active, and **5.0%** are at risk, showing a severe drop-off in customer engagement after initial purchase.

- Across **every cohort** from 2015 to 2023, churn **consistently exceeds 90%**, indicating **long-term retention issues** across the board.

- Even **newer cohorts** (e.g., 2022 and 2023) show almost **identical churn rates** to older cohorts, suggesting the **issue is systemic**, not cohort-specific, signaling that without intervention, **future cohorts will follow the same pattern**.

💡 **Business Insights:**

- 🚨 A very high proportion of customers stop purchasing after their first order. This suggests that the business is **strong at acquiring customers** but **weak at keeping them engaged**.

- 🧭 Since the pattern is consistent across all years, the churn issue likely reflects a **lack of follow-up or loyalty strategy** rather than a problem with specific cohorts or time periods.

- 🎁 Introducing basic retention strategies such as **reminder emails, exclusive offers, or post-purchase follow-up messages** could help turn **one-time buyers** into **repeat customers**.

- ⚠️ Customers who haven’t purchased in 3–6 months are labeled **"at risk"**. This group still shows signs of recent activity and should be prioritized for **win-back campaigns** before they fully churn.

- 💸 Improving customer retention, even slightly, would likely have a **major impact on overall revenue**, especially when focused on **high-value customers**.

##  Strategic Recommendations 🎯
 
### 📊 1. Customer Value Optimisation (Customer Segmentation)

- **Prioritize retention of high-value customers**  
  These customers account for over 65% of total revenue. Tailored experiences, loyalty perks, and strong follow-up strategies can help retain them.

- **Grow mid-value customers through targeted campaigns**  
  Mid-tier customers show potential, use promotions, product recommendations, or personalized offers to move them into the high-value tier.

- **Reassess acquisition sources for low-value customers**  
  Consider adjusting acquisition strategies to focus on long-term value. Avoid channels that consistently bring in low-LTV users.



### 📈 2. Cohort Performance Strategy (Customer Revenue by Cohort)

- **Improve first-order conversion value**  
  Newer cohorts spend less up front. Consider bundling, minimum spend offers, or higher-margin products to increase first-order value.

- **Focus on acquiring high-intent customers**  
  Revenue growth is not guaranteed by volume. Shift targeting toward customers more likely to become repeat buyers or spend more over time.

- **Monitor average revenue per customer over time**  
  Continuously track LTV trends across cohorts to assess how customer value is shifting and identify issues early.



### 🔁 3. Retention and Churn Prevention (Customer Retention)

- **Introduce lifecycle retention strategies**  
  Implement simple but effective tactics like post-purchase emails, reminders, loyalty points, and exclusive reactivation offers.

- **Focus on win-back campaigns for 'At Risk' customers**  
  Customers inactive for 3–6 months are still recoverable, prioritize this segment before they fully churn. Also consider implementing a proactive intervention system for at-risk customers before they lapse.

- **Continuously track churn by cohort**  
  Cohort-level churn tracking will help you understand if new retention strategies are working and where drop-offs are occurring.

## Technical Details 🛠️

- **Database:** *PostgreSQL*
- **Analysis Tools:** *PostgreSQL, DBeaver, PGadmin*
- **Visualisation:** *Microsoft Excel*, *ChatGPT* 


