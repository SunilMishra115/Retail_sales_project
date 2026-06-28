-- Sales Reatail Prject --

-- USE SQL_PROJECT_P1;

-- DROP TABLE IF EXISTS retail_sales;
-- CREATE TABLE  retail_sales 
-- 					(
-- 					transactions_id	INT Primary key,
-- 					sale_date	DATE,
-- 					sale_time	TIME,
-- 					customer_id	 INT,
-- 					gender	VARCHAR(15),
-- 					age	INT null,
-- 					category	VARCHAR(15),
-- 					quantiy	INT null,
-- 					price_per_unit	FLOAT null, -- DUE TO ISSUE IN MY SQL WORKBENCH (SO I ADDED NULL CONSTRAINT)
-- 					cogs	FLOAT null,
-- 					total_sale FLOAT null
--                     );
--     
-- TRUNCATE TABLE retail_sales;
-- DROP TABLE retail_sales;
--     
--     
--  Why MySQL removed those rows

-- When Workbench imports:

-- If ANY required column becomes invalid:
-- NULL in numeric column (if strict mode / type mismatch)
-- empty string ""
-- or non-convertible value

-- MySQL rejects entire row
-- So even if:
-- age is missing OR
-- cogs is missing OR
-- total_sale is missing
-- whole row is dropped
                   
--   SELECT * FROM retail_sales ;    -- total rows 2000 and imported only 1987 due to null values myqsl dropped those rows. 


 -- USED PYTHON TO PERFOEM THIS
 
--   df['age'] = df['age'].fillna(df['age'].median())
-- df['cogs'] = df['cogs'].fillna(0)
-- df['total_sale'] = df['total_sale'].fillna(df['total_sale'].median())

-- fill the missing values using above technique of median and fill zero.

-- Data Exploration

 -- How many sales do we have ?
 select count(*) from retail_sales;
 
-- How Many unique Customers we have?
 select count(distinct customer_id) as Customer_count from retail_sales;
 
 -- How Many Category we have?
 select distinct category from retail_sales;

 
 -- Data Analysis & Business Key Problems & Answers

-- My Analysis & Findings
-- Q.1 Write a SQL query to retrieve all columns for sales made on '2022-11-05
-- Q.2 Write a SQL query to retrieve all transactions where the category is 'Clothing' and the quantity sold is more than 10 in the month of Nov-2022
-- Q.3 Write a SQL query to calculate the total sales (total_sale) for each category.
-- Q.4 Write a SQL query to find the average age of customers who purchased items from the 'Beauty' category.
-- Q.5 Write a SQL query to find all transactions where the total_sale is greater than 1000.
-- Q.6 Write a SQL query to find the total number of transactions (transaction_id) made by each gender in each category.
-- Q.7 Write a SQL query to calculate the average sale for each month. Find out best selling month in each year
-- Q.8 Write a SQL query to find the top 5 customers based on the highest total sales 
-- Q.9 Write a SQL query to find the number of unique customers who purchased items from each category.
-- Q.10 Write a SQL query to create each shift and number of orders (Example Morning <=12, Afternoon Between 12 & 17, Evening >17)

 -- use sql_project_p1;
 
 -- Q.1 Write a SQL query to retrieve all columns for sales made on '2022-11-05'
 
SELECT * 
FROM
 retail_sales
WHERE sale_date ='2022-11-05';
  
-- Q.2 Write a SQL query to retrieve all transactions where the category is 'Clothing' and the quantity sold is equal or more than 4 in the month of Nov-2022

SELECT  *
FROM 
	retail_sales
WHERE 
	category ='Clothing' AND
	DATE_FORMAT(sale_date, '%Y-%m') = '2022-11' AND  
    quantiy >=4;

-- Q.3 Write a SQL query to calculate the total sales (total_sale) for each category.
SELECT 
	category, 
    COUNT(*) AS No_of_orders,
    SUM(total_sale) AS Total_sales
FROM 
	retail_sales
GROUP BY 
	category ;

-- Q.4 Write a SQL query to find the average age of customers who purchased items from the 'Beauty' category.


SELECT 
	category,
    round(AVG(age),2) AS Customer_average_age
FROM 
	retail_sales
WHERE
	Category='Beauty'
GROUP BY 
	category;

-- Q.5 Write a SQL query to find all transactions where the total_sale is greater than 1000.

SELECT *
FROM 
	retail_sales
WHERE 
	total_sale > 1000;

 -- Q.6 Write a SQL query to find the total number of transactions (transaction_id) made by each gender in each category.
 
 SELECT 
	category,
    gender,
	COUNT(transactions_id) AS Total_number
 FROM 
	retail_sales
GROUP BY 
	category,
	gender
ORDER BY 1;

-- Q.7 Write a SQL query to calculate the average sale for each month. Find out best selling month in each year

SELECT *
FROM
	 (
	SELECT 
		YEAR(sale_date) AS Yr,
        MONTHNAME(sale_date) AS months,
		ROUND(AVG(total_sale),2) AS Avgerage_sales_month_wise,
        RANK() OVER (PARTITION BY YEAR(sale_date) ORDER BY AVG(total_sale) DESC) rn
	FROM
		retail_sales
	GROUP BY 1,2
    ORDER BY 1,3)t
WHERE rn =1;

-- Q.8 Write a SQL query to find the top 5 customers based on the highest total sales 
SELECT 
	customer_id,
    Highest_Sales
FROM 
	(
	SELECT
		customer_id,
		SUM(total_sale) as Highest_Sales,
		RANK() OVER (ORDER BY  SUM(total_sale) DESC) rn
	FROM 
		retail_sales
	GROUP BY 1) t
    WHERE rn <=5;
    
-- Q.9 Write a SQL query to find the number of unique customers who purchased items from each category.
  
  -- this query for  unique customer who purchased from all category 
SELECT 
	COUNT(*) AS Total_customer_shoped_in_all_catogery
FROM  
	(
	SELECT 
	customer_id,
	COUNT(DISTINCT category) AS all_three_category
	FROM
		retail_sales
	GROUP BY
		 (customer_id)
	HAVING COUNT(DISTINCT category) =3) t;

-- Actual question 9:

SELECT 
	COUNT(DISTINCT customer_id) AS total_count,
    category
FROM 
	retail_sales
GROUP BY 
	category;
    

-- Q.10 Write a SQL query to create each shift and number of orders 
-- (Example Morning <=12, Afternoon Between 12 & 17, Evening >17)


SELECT
    CASE
		WHEN HOUR(sale_time) <12 THEN 'Morning'
		WHEN HOUR(sale_time) BETWEEN 12 AND 17 THEN 'afternoon'
        ELSE 'Evening' 
	END AS Shift,
        COUNT(*) AS Total_Order_Count	
FROM 
	retail_sales
GROUP BY 1
ORDER BY  2 DESC;

-- End of Project.


		
	




