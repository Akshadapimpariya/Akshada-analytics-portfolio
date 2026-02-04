# Freelancer Earning Analysis 🚀

This repository contains a comprehensive data engineering and analytics pipeline designed to process, clean, and analyze a global dataset of freelancer earnings. It spans the entire data lifecycle, from raw CSV ingestion and Python-based wrangling to SQL-driven business intelligence and interactive Power BI visualizations.

## 📂 Project Structure

| File | Description |
| :--- | :--- |
| `freelancer_earning.csv` | The raw dataset containing ~505,000 records of freelancer profiles, rates, and platforms. |
| `freelancer_earning.ipynb` | Jupyter Notebook containing the Data Cleaning and Exploratory Data Analysis (EDA) process. |
| `freelancer earning.sql` | SQL scripts for schema definition, data type conversion, and advanced analytical queries. |
| `freelancer.pbix` | Power BI Desktop file providing a visual dashboard of market trends and income distributions. |

## 🛠️ Data Pipeline & Workflow

### 1. Data Cleaning & EDA (Python)
The `freelancer_earning.ipynb` notebook performs the following:
* **Library Stack:** `pandas`, `numpy`, `matplotlib`, and `seaborn`.
* **Preprocessing:** Handles missing values in hourly rates and cleans inconsistent string formatting in the income columns.
* **Outlier Detection:** Identifies anomalies in years of experience and hourly rates to ensure statistical integrity.
* **Visual Profiling:** Uses heatmaps and distribution plots to identify correlation between education levels and annual income.

### 2. Database Transformation (SQL)
The `freelancer earning.sql` script focuses on transforming the raw data into a structured format suitable for high-performance querying:
* **Regex Wrangling:** Converts currency strings (e.g., "$194,300.90") into `DOUBLE PRECISION` numeric types using `regexp_replace`.
* **Data Standardization:** Uses `INITCAP` to normalize job categories and handles null values in experience metrics.
* **Advanced Analytics:** * Calculates **Percentiles (Q1, Median, Q3)** for hourly rates.
    * Identifies **High-Earner Hubs** (Countries with >5 freelancers earning above $150k).
    * Performs **Experience Bracket Analysis** (0-5, 6-10, 11-15, 15+ years) to find peak earning windows.
    * Analyzes **Platform Demographics** to see which sites (Upwork, Toptal, etc.) attract senior vs. junior talent.

### 3. Business Intelligence (Power BI)
The `freelancer.pbix` file transforms the processed data into an interactive executive dashboard, focusing on:
* **Global Earnings Map:** Visualizing the geographic distribution of high-paying regions.
* **Job Category Variety:** A breakdown of which regions offer the widest variety of specialized roles.
* **Platform Comparison:** Comparing average hourly rates across LinkedIn, Fiverr, Toptal, and Direct Clients.

## 📊 Key Analytics Goals
* **Income Normalization:** Standardizing disparate currency formats for global comparison.
* **Market Segmentation:** Understanding the "sweet spot" for years of experience versus annual income.
* **Geographic Insights:** Highlighting specific countries (like Israel, UAE, and USA) that lead in freelancer compensation.

## 🚀 Getting Started
1. **Data:** Ensure `freelancer_earning.csv` is in the root directory.
2. **Analysis:** Run the `freelancer_earning.ipynb` to see the cleaning logic and initial visualizations.
3. **Database:** Import the CSV into a PostgreSQL (or compatible) database and run the `freelancer earning.sql` script to generate business reports.
4. **Visualization:** Open `freelancer.pbix` in Power BI Desktop to view the final dashboard.

---
**Tech Stack:** Python, SQL (PostgreSQL), Power BI, Pandas.
