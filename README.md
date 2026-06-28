# 🛍️ Retail Sales Analysis using SQL

## 📌 Project Overview

This project analyzes a retail sales dataset using **MySQL** to answer real-world business questions and generate actionable insights. The analysis focuses on customer behavior, sales performance, product categories, and purchasing trends through SQL queries.

The project also demonstrates handling real-world data quality issues such as missing values and data import errors before loading the dataset into MySQL.

---

## 📊 Dataset Information

* **Dataset:** Retail Sales
* **Total Records:** 2,000
* **Successfully Imported into MySQL:** 1,987
* **Database:** MySQL
* **Query Tool:** MySQL Workbench
* **Data Cleaning:** Python (Pandas)

### Dataset Columns

* transactions_id
* sale_date
* sale_time
* customer_id
* gender
* age
* category
* quantity
* price_per_unit
* cogs
* total_sale

---

## 🛠️ Technologies Used

* SQL
* MySQL
* MySQL Workbench
* Python
* Pandas
* Git
* GitHub

---

# 📁 Project Structure

```
Retail_sales_project/
│
├── README.md
├── sql_query_p1.sql
├── retail_sales_cleaned.csv
└── insights.md
```

---

# ⚠️ Data Cleaning & Import Challenges

While importing the dataset into MySQL, only **1,987 out of 2,000** records were imported successfully.

### Root Cause

Several rows contained missing values in numeric columns such as:

* age
* cogs
* total_sale

MySQL Workbench rejected these rows during import because the values could not be converted into numeric data types under strict validation.

### Data Cleaning Performed

Python (Pandas) was used to inspect missing values.

Examples:

* Checked missing values using `isna().sum()`
* Verified duplicate transaction IDs
* Cleaned invalid numeric values
* Corrected date formatting
* Re-imported the cleaned dataset

This demonstrates a practical ETL (Extract–Transform–Load) workflow commonly used in real-world analytics projects.

---

# 📈 Business Questions Solved

The project answers several business questions using SQL.

### 1. Retrieve all sales made on a specific date.

### 2. Find Clothing sales with quantity greater than or equal to 4 during November 2022.

### 3. Calculate total sales for each product category.

### 4. Find the average customer age for Beauty products.

### 5. Retrieve transactions where total sales exceeded 1000.

### 6. Count transactions by gender and category.

### 7. Identify the best-selling month of each year using window functions.

### 8. Find the Top 5 customers based on total sales.

### 9. Count unique customers for each category.

### 10. Analyze order distribution by Morning, Afternoon, and Evening shifts.

### Bonus

Find customers who purchased from all three product categories.

---

# 💡 Key SQL Concepts Used

* SELECT
* WHERE
* GROUP BY
* ORDER BY
* Aggregate Functions
* CASE WHEN
* Subqueries
* Window Functions
* RANK()
* Common Business KPIs

---

# 📊 Key Business Insights

### 📦 Category Performance

* Electronics generated the highest revenue.
* Clothing recorded the highest number of transactions.
* Beauty products showed comparatively lower sales volume.

### 👥 Customer Analysis

* Top 5 customers contributed a significant share of total revenue.
* A small group of customers purchased across all three categories.

### 📅 Sales Trends

* November and December recorded the strongest sales performance.
* Sales declined during the first quarter of the year.

### ⏰ Shift Analysis

* Afternoon was the busiest sales period.
* Morning and Evening shifts had comparatively fewer transactions.

### 👨‍👩‍👧 Customer Preferences

* Electronics purchases were more common among male customers.
* Beauty and Clothing categories attracted more female customers.

---

# 🎯 Learning Outcomes

This project demonstrates my ability to:

* Write intermediate and advanced SQL queries
* Use aggregate functions and window functions
* Perform customer and sales analysis
* Handle real-world data quality issues
* Clean datasets using Python (Pandas)
* Import data into MySQL
* Generate business insights from raw transactional data

---

# 🚀 Future Improvements

* Build an interactive Power BI dashboard
* Develop Tableau visualizations
* Create stored procedures
* Add SQL views for reporting
* Automate ETL using Python

---

# 👨‍💻 Author

**Sunil Mishra**

MS in Data Science

Aspiring Data Analyst | SQL | Python | Excel | Tableau | Power BI

---

⭐ If you found this project useful, feel free to star the repository and connect with me.
