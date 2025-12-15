# 🛒 Retail Sales Analysis Project (SQL)

## Project Overview

This project involves a comprehensive analysis of retail sales data using SQL. The goal is to set up a transactional database, ensure data quality through cleaning, and extract actionable business intelligence by answering specific, high-value business questions.

## Data Source and Schema

The analysis is based on a single transactional dataset.

### `RETAIL_SALES` Table Schema

| Column Name | Data Type | Description |
| :--- | :--- | :--- |
| `TRANSACTIONS_ID` | `INT` | Unique identifier for each sale. |
| `SALE_DATE` | `DATE` | The date the transaction occurred. |
| `SALE_TIME` | `TIME` | The time the transaction occurred. |
| `CUSTOMER_ID` | `INT` | Unique identifier for the customer. |
| `GENDER` | `VARCHAR(15)` | Customer's gender. |
| `AGE` | `INT` | Customer's age. |
| `CATEGORY` | `VARCHAR(15)` | Product category sold (e.g., 'Clothing', 'Beauty'). |
| `QUANTIY` | `INT` | Number of units sold. |
| `PRICE_PER_UNIT` | `FLOAT` | Price of a single unit. |
| `COGS` | `FLOAT` | Cost of Goods Sold for the transaction. |
| `TOTAL_SALE` | `FLOAT` | Total revenue generated from the transaction. |

## SQL Analysis Phases

The script is logically divided into four main phases:

### 1. Database Setup
* Creation of the `DQL_PROJECT_P2` database.
* Definition and creation of the `RETAIL_SALES` table.

### 2. Data Cleaning
* **Missing Value Handling:** A two-step process to first identify and then **delete** all rows where critical columns contain `NULL` values, ensuring the integrity of subsequent analysis.

### 3. Data Exploration
* Calculates fundamental metrics: Total Sales, Total Unique Customers, and Total Unique Categories.

### 4. Business Analysis Queries

The script addresses ten key business questions, demonstrating proficiency in filtering, aggregation, grouping, and advanced window functions.

| # | Business Question | SQL Technique Used |
| :--- | :--- | :--- |
| **Q3** | Total sales for each category. | `GROUP BY`, `SUM()` |
| **Q6** | Total transactions by gender and category. | Multi-column `GROUP BY` |
| **Q7** | Best selling month in **each year**. | `EXTRACT()`, **`RANK()` Window Function**, CTE |
| **Q8** | Top 5 customers based on total sales. | `GROUP BY`, `ORDER BY`, `LIMIT` |
| **Q10** | Number of orders for different sales shifts (morning, afternoon, evening). | **`CASE` Statement**, CTE, `EXTRACT(HOUR)` |

## How to Run the Script

1.  **Environment:** The SQL code is compatible with most standard SQL database systems (e.g., PostgreSQL, MySQL, SQL Server) that support standard SQL functions like `EXTRACT` and Window Functions.
2.  **Load Data:** You will need to load your retail sales data into a temporary table or directly into the `RETAIL_SALES` table after running the `CREATE TABLE` command.
3.  **Execution:** Execute the `sql_query_p1.sql` file sequentially against your chosen database engine.

---
Would you like me to execute any of these SQL queries against a sample dataset, or perhaps explain the logic of a specific query (like Q7 or Q10) in more detail?
