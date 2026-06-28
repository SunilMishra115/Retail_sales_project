# Retail_sales_project
##🛍️ Retail Sales Analysis – SQL Project (Complete Documentation)

##📌 Project Overview
This project involves analyzing retail sales data using MySQL Workbench to extract business insights such as sales trends, customer behavior, category performance, and shift-wise order distribution.

#📂 Dataset Details
Total Records: 2000 rows (1987 imported due to missing/null values)

Tools Used: MySQL Workbench, Python (pandas for data cleaning)

Key Columns: transactions_id (PK), sale_date, sale_time, customer_id, gender, age, category, quantiy, price_per_unit, cogs, total_sale

⚠️ Data Import Issues & Fixes
Issue: Only 1987 out of 2000 rows were imported because MySQL’s strict mode rejected rows with null values in numeric columns (age, cogs, total_sale), empty strings, or non-convertible data. Also, the sale_date column required proper formatting (YYYY-MM-DD) for successful insertion.

Fix Applied: Missing values were handled using Python (pandas) before re-importing:

age → filled with median

cogs → filled with 0

total_sale → filled with median

sale_date formatted as YYYY-MM-DD to avoid import errors.

🧹 Data Exploration (Setup Queries)
sql
-- Total sales
SELECT COUNT(*) FROM retail_sales;

-- Unique customers
SELECT COUNT(DISTINCT customer_id) FROM retail_sales;

-- Unique categories
SELECT DISTINCT category FROM retail_sales;
📊 Business Questions & SQL Queries
Q1. Retrieve all sales made on 2022-11-05

sql
SELECT * FROM retail_sales WHERE sale_date = '2022-11-05';
Q2. Clothing category sales with quantity ≥ 4 in Nov 2022

sql
SELECT *
FROM retail_sales
WHERE category = 'Clothing'
  AND DATE_FORMAT(sale_date, '%Y-%m') = '2022-11'
  AND quantiy >= 4;
Q3. Total sales per category

sql
SELECT category, COUNT(*) AS No_of_orders, SUM(total_sale) AS Total_sales
FROM retail_sales
GROUP BY category;
Q4. Average age of customers in Beauty category

sql
SELECT category, ROUND(AVG(age), 2) AS Customer_average_age
FROM retail_sales
WHERE category = 'Beauty'
GROUP BY category;
Q5. Transactions with total_sale > 1000

sql
SELECT * FROM retail_sales WHERE total_sale > 1000;
Q6. Total transactions by gender and category

sql
SELECT category, gender, COUNT(transactions_id) AS Total_number
FROM retail_sales
GROUP BY category, gender
ORDER BY 1;
Q7. Best selling month per year (based on avg sales)

sql
SELECT *
FROM (
    SELECT 
        YEAR(sale_date) AS Yr,
        MONTHNAME(sale_date) AS months,
        ROUND(AVG(total_sale), 2) AS Avgerage_sales_month_wise,
        RANK() OVER (PARTITION BY YEAR(sale_date) ORDER BY AVG(total_sale) DESC) AS rn
    FROM retail_sales
    GROUP BY 1, 2
    ORDER BY 1, 3
) t
WHERE rn = 1;
Q8. Top 5 customers by highest total sales

sql
SELECT *
FROM (
    SELECT customer_id, SUM(total_sale) AS Highest_Sales,
           RANK() OVER (ORDER BY SUM(total_sale) DESC) AS rn
    FROM retail_sales
    GROUP BY 1
) t
WHERE rn <= 5;
Q9. Unique customers per category

sql
SELECT COUNT(DISTINCT customer_id) AS total_count, category
FROM retail_sales
GROUP BY category;
Bonus – Customers who purchased from all 3 categories:

sql
SELECT COUNT(*)
FROM (
    SELECT customer_id
    FROM retail_sales
    GROUP BY customer_id
    HAVING COUNT(DISTINCT category) = 3
) t;
Q10. Shift-wise order distribution

sql
SELECT
    CASE
        WHEN HOUR(sale_time) < 12 THEN 'Morning'
        WHEN HOUR(sale_time) BETWEEN 12 AND 17 THEN 'Afternoon'
        ELSE 'Evening'
    END AS Shift,
    COUNT(*) AS Total_Order_Count
FROM retail_sales
GROUP BY 1
ORDER BY 2 DESC;
📈 Key Findings Report
1. Category Performance
Electronics generates the highest total sales, followed by Clothing and Beauty.

Clothing has the highest number of orders, indicating high volume but lower average transaction value.

Beauty has the lowest sales volume but attracts a slightly older customer base (avg age ~40+).

2. Customer Insights
Top 5 customers contribute significantly to overall revenue – these are ideal targets for loyalty programs.

A small group of customers purchased from all 3 categories, indicating cross-category shopping behavior.

3. Seasonal Trends
The best-selling month varies by year, but November and December consistently show peak sales (holiday season effect).

Sales dip in Q1 (January–March), suggesting a post-holiday slowdown.

4. Shift-Wise Order Analysis
Afternoon (12 PM – 5 PM) has the highest number of orders, making it the busiest shift.

Morning and Evening shifts have relatively lower order volumes – potential for targeted promotions during these hours.

5. Gender & Category Preferences
Electronics is more popular among male customers.

Beauty and Clothing categories show higher engagement from female customers.

This insight can be used for gender-based marketing campaigns.

🧠 Conclusion
This analysis provides actionable insights for business decision-making:

Inventory Planning: Focus on high-performing categories like Electronics and Clothing.

Marketing Strategy: Target top customers with exclusive offers; run gender-specific campaigns.

Operational Efficiency: Optimize staffing during afternoon shifts to handle peak order volume.

Promotional Timing: Run campaigns during slow months (Q1) to boost sales.

🚀 How to Use This Project / Report
For Recruiters / Hiring Managers:
This project demonstrates my ability to:

Write complex SQL queries (window functions, subqueries, CTEs)

Handle real-world data issues (null values, import errors)

Extract business insights from raw data

Present findings in a clear, structured format

For Other Data Analysts / Learners:
Clone the repo and run the queries on your own MySQL Workbench.

Modify the queries to explore additional questions or datasets.

Use the findings as a template for your own retail or e-commerce analysis projects.

For Business Stakeholders:
Use the findings to inform inventory, marketing, and operations strategies.

The SQL queries can be adapted into automated dashboards or reporting pipelines.

🧰 Tools & Technologies
Database: MySQL

Query Tool: MySQL Workbench

Data Cleaning: Python (pandas)

Version Control: Git & GitHub

📁 Project Structure
text
📦 retail-sales-analysis
├── 📄 README.md
├── 📄 retail_sales.sql
├── 📄 data_cleaning.ipynb
├── 📄 insights.md
└── 📂 data/
    └── retail_sales_cleaned.csv
