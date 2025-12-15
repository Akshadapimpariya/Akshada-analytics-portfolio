-- sql retail sales analysis -p1
CREATE DATABASE DQL_PROJECT_P2;

-- 
CREATE TABLE RETAIL_SALES (
	TRANSACTIONS_ID INT,
	SALE_DATE DATE,
	SALE_TIME TIME,
	CUSTOMER_ID INT,
	GENDER VARCHAR(15),
	AGE INT,
	CATEGORY VARCHAR(15),
	QUANTIY INT,
	PRICE_PER_UNIT FLOAT,
	COGS FLOAT,
	TOTAL_SALE FLOAT
);

-- data cleaning
SELECT
	*
FROM
	RETAIL_SALES
WHERE
	TRANSACTIONS_ID IS NULL
	OR SALE_DATE IS NULL
	OR SALE_TIME IS NULL
	OR GENDER IS NULL
	OR CATEGORY IS NULL
	OR QUANTIY IS NULL
	OR COGS IS NULL
	OR TOTAL_SALE IS NULL;

DELETE FROM RETAIL_SALES
WHERE
	TRANSACTIONS_ID IS NULL
	OR SALE_DATE IS NULL
	OR SALE_TIME IS NULL
	OR GENDER IS NULL
	OR CATEGORY IS NULL
	OR QUANTIY IS NULL
	OR COGS IS NULL
	OR TOTAL_SALE IS NULL;

-- data exploration
-- total number of sales
SELECT
	COUNT(*) AS TOTAL_SALES
FROM
	RETAIL_SALES
	-- total number of unique customers
SELECT
	COUNT(DISTINCT CUSTOMER_ID) AS TOTAL_CUSTOMERS
FROM
	RETAIL_SALES
	-- total number of unique category we have
SELECT DISTINCT
	CATEGORY AS TOTAL_CATEGORY
FROM
	RETAIL_SALES
	-- data analysis & business problem
	-- 1. Write a SQL query to retrieve all columns for sales made on '2022-11-05:
SELECT
	*
FROM
	RETAIL_SALES
WHERE
	SALE_DATE = '2022-11-05'
	-- 2. Write a SQL query to retrieve all transactions where the category is 'Clothing' and the quantity sold is more than 4 in the month of Nov-2022:
SELECT
	*
FROM
	RETAIL_SALES
WHERE
	CATEGORY = 'Clothing'
	AND TO_CHAR(SALE_DATE, 'YYYY-MM') = '2022-11'
	AND QUANTITY >= 4
	-- 3.Write a SQL query to calculate the total sales (total_sale) for each category.:
SELECT
	CATEGORY,
	SUM(TOTAL_SALE) AS NET_SALE,
	COUNT(*) AS TOTAL_ORDERS
FROM
	RETAIL_SALES
GROUP BY
	1
	--4. Write a SQL query to find the average age of customers who purchased items from the 'Beauty' category.:
SELECT
	ROUND(AVG(AGE)) AS AVG_AGE
FROM
	RETAIL_SALES
WHERE
	CATEGORY = 'Beauty'
	-- 5.Write a SQL query to find all transactions where the total_sale is greater than 1000.:
SELECT
	*
FROM
	RETAIL_SALES
WHERE
	TOTAL_SALE > 1000
	-- 6.Write a SQL query to find the total number of transactions (transaction_id) made by each gender in each category.:
SELECT
	CATEGORY,
	GENDER,
	COUNT(*) AS TOTAL_TRANS
FROM
	RETAIL_SALES
GROUP BY
	CATEGORY,
	GENDER
ORDER BY
	1
	--7. Write a SQL query to calculate the average sale for each month. Find out best selling month in each year:
SELECT 
       year,
       month,
    avg_sale
FROM 
(    
SELECT 
    EXTRACT(YEAR FROM sale_date) as year,
    EXTRACT(MONTH FROM sale_date) as month,
    AVG(total_sale) as avg_sale,
    RANK() OVER(PARTITION BY EXTRACT(YEAR FROM sale_date) ORDER BY AVG(total_sale) DESC) as rank
FROM retail_sales
GROUP BY 1, 2
) as t1
WHERE rank = 1

-- 8.Write a SQL query to find the top 5 customers based on the highest total sales 
SELECT
	CUSTOMER_ID,
	SUM(TOTAL_SALE) AS TOTAL_SALES
FROM
	RETAIL_SALES
GROUP BY 1
ORDER BY 2 DESC
LIMIT 5 

--9. Write a SQL query to find the number of unique customers who purchased items from each category.:
SELECT
	CATEGORY,
	COUNT(DISTINCT CUSTOMER_ID) AS UNIQUE_CUSTOMER_ID
FROM
	RETAIL_SALES
GROUP BY 1

-- 10.Write a SQL query to create each shift and number of orders (Example Morning <12, Afternoon Between 12 & 17, Evening >17):
WITH
	HOURLY_SALE AS (
		SELECT
			*,
			CASE
				WHEN EXTRACT(
					HOUR
					FROM
						SALE_TIME
				) < 12 THEN 'morning'
				WHEN EXTRACT(
					HOUR
					FROM
						SALE_TIME
				) BETWEEN 12 AND 17  THEN 'afternoon'
				ELSE 'evening'
			END AS SHIFT
		FROM
			RETAIL_SALES
	)
SELECT
	SHIFT,
	COUNT(*) AS TOTAL_ORDERS
FROM
	HOURLY_SALE
GROUP BY
	SHIFT


