# Diwali Sales Data Analytics 🪔📊

A comprehensive data analytics project aimed at improving customer experience and increasing sales during the festive season. This repository features an end-to-end pipeline including data cleaning, SQL-based business intelligence, and Python-driven exploratory data analysis (EDA).

## 📂 Project Structure

| File | Description |
| :--- | :--- |
| `Diwali Sales Data.csv` | Raw transactional dataset featuring 11,000+ records of customer demographics and purchase history. |
| `Diwali_Sales_Analysis.ipynb` | Python Notebook for data cleaning, handling null values, and performing EDA with Seaborn/Matplotlib. |
| `diwali sales.sql` | SQL script for database schema management, duplicate removal, and advanced analytical queries. |
| `Diwali Sales.pbix` | Interactive Power BI dashboard providing a visual summary of sales performance across states and sectors. |

## 🛠️ Data Pipeline & Insights

### 1. Data Cleaning (Python & SQL)
* [cite_start]**Deduplication:** Successfully identified and removed duplicate records to ensure data integrity[cite: 13].
* [cite_start]**Handling Missing Values:** Used Python and SQL to update null values in the 'Amount' column and remove incomplete entries[cite: 13].
* [cite_start]**Data Types:** Standardized numerical columns (Orders, Amount) for high-performance calculations[cite: 13].

### 2. Exploratory Data Analysis (EDA)
[cite_start]Using Python libraries like `pandas` and `seaborn`, the project identifies key consumer behaviors[cite: 11]:
* [cite_start]**Gender-Based Spending:** Analysis shows that female customers significantly outspend male customers[cite: 11].
* [cite_start]**Age Demographics:** The **26-35 age group** is the primary driver of revenue across most states[cite: 11].
* [cite_start]**Regional Performance:** Uttar Pradesh, Maharashtra, and Karnataka emerge as the top states by total order volume and amount[cite: 13].

### 3. Advanced SQL Business Logic
[cite_start]The `diwali sales.sql` script provides deep-dive queries including[cite: 13]:
* [cite_start]**Top Selling Categories:** Identifying the highest-selling product categories (Food, Clothing, Electronics) per zone using window functions[cite: 13].
* [cite_start]**Customer Activity:** Detecting customers active across multiple states and calculating average order values (AOV) by demographic[cite: 13].
* [cite_start]**Revenue by Occupation:** Pinpointing the top-contributing sectors (IT, Healthcare, Aviation) per geographic zone[cite: 13].

## 📊 Visual Intelligence (Power BI)
The Power BI dashboard translates complex datasets into interactive visuals, focusing on:
* **State-wise Sales Distribution:** Heatmaps for geographic targeting.
* **Occupation & Sector Analysis:** Visualizing which professional sectors dominate festive spending.
* **Product Performance:** Tracking top-selling products by volume.

## 🚀 How to Run
1.  **Clone the repo:** `git clone https://github.com/your-username/Diwali-Sales-Analysis.git`
2.  [cite_start]**SQL Setup:** Execute the `diwali sales.sql` script in a PostgreSQL or compatible environment to create and populate the database[cite: 13].
3.  [cite_start]**Python Analysis:** Open `Diwali_Sales_Analysis.ipynb` in Jupyter Notebook or VS Code to view the data cleaning and visualization logic[cite: 11].
4.  **Dashboard:** Use Power BI Desktop to open `Diwali Sales.pbix` and explore the interactive report.

---
**Tech Stack:** Python (Pandas, Seaborn), SQL (PostgreSQL), Power BI, Data Wrangling.
