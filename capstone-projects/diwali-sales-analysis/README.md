# Diwali Festive Sales Analysis 🪔

An end-to-end data analytics project focused on identifying consumer behavior and sales trends during the Diwali festive season. This project provides actionable insights into customer demographics, high-performing regions, and top-selling product categories.

## 📂 Project Components

| File | Description |
| :--- | :--- |
| `Diwali Sales Data.csv` | Raw dataset containing over 11,000 transaction records. |
| `Diwali_Sales_Analysis.ipynb` | Python notebook for data cleaning (handling nulls/duplicates) and Exploratory Data Analysis (EDA). |
| `diwali sales.sql` | SQL scripts for advanced database queries, revenue tracking, and customer segmentation. |
| `Diwali Sales.pbix` | Interactive Power BI Dashboard for high-level executive reporting. |

## 🛠️ Key Technical Features

### 1. Data Wrangling (Python & SQL)
* **Cleaning:** Removed duplicate entries and handled missing values in the 'Amount' column.
* **Optimization:** Standardized data types for faster calculation of total revenue and order volume.

### 2. Business Insights
* **Demographics:** Analysis revealed that the **26-35 age group** and **female customers** are the highest contributors to total sales.
* **Regional Trends:** Identified **Uttar Pradesh, Maharashtra, and Karnataka** as the top three revenue-generating states.
* **Sector Analysis:** Discovered that employees in the **IT, Healthcare, and Aviation** sectors have the highest festive spending power.

### 3. Advanced SQL Queries
* **Market Hubs:** Queries to find the highest-selling product category per geographic zone.
* **Customer Loyalty:** Identified "Power Users" active across multiple states.
* **Profitability:** Rank-based analysis of the most profitable occupations by region.

## 🚀 How to Use
1.  **Run Python Analysis:** Use the `.ipynb` file to see the step-by-step cleaning and visualization process.
2.  **Database Queries:** Import the CSV into a SQL environment and run `diwali sales.sql` for deep-dive reporting.
3.  **View Dashboard:** Open `Diwali Sales.pbix` in Power BI Desktop to interact with the visual data.

---
**Tech Stack:** Python (Pandas, Seaborn), SQL (PostgreSQL), Power BI.
