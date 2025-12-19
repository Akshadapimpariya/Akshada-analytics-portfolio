# 🛒 Blinkit Grocery Sales Analysis (Capstone Project)

![Python](https://img.shields.io/badge/Python-3776AB?style=for-the-badge&logo=python&logoColor=white)
![SQL](https://img.shields.io/badge/SQL-4479A1?style=for-the-badge&logo=postgresql&logoColor=white)
![Power BI](https://img.shields.io/badge/Power_BI-F2C811?style=for-the-badge&logo=power-bi&logoColor=black)

## 📌 Project Overview
This Capstone Project provides a 360-degree analysis of **Blinkit's sales performance, customer satisfaction, and inventory distribution**. By utilizing a multi-tool approach (SQL, Python, and Power BI), I have transformed raw grocery data into actionable business insights that help identify top-performing categories and optimize outlet efficiency.

---

## 📂 Project Structure

### 1. 🐍 Python Analysis (`blinkit.ipynb`)
Focused on **Exploratory Data Analysis (EDA)** and data preprocessing.
* **Data Cleaning:** Standardized inconsistent labels in `Item Fat Content` (converting 'LF', 'low fat', and 'reg' into 'Low Fat' and 'Regular').
* **Statistical Profiling:** Generated descriptive statistics for sales, ratings, and item visibility.
* **Visualization:** Created distribution charts using `Matplotlib` and `Seaborn`, including a **Sales by Fat Content** pie chart to understand consumer preferences.

### 2. 🗄️ SQL Analysis (`blinkit_Sales.sql`)
Focused on **Database Management** and complex business logic.
* **Schema Design:** Created the `store_sales` table and optimized data types.
* **Advanced Querying:**
    * **KPI Calculation:** Developed queries for Total Sales (in Millions), Average Sales, and Average Ratings.
    * **Granular Reporting:** Grouped data by `Outlet Type`, `Outlet Size`, and `Location` to track performance.
    * **Window Functions:** Calculated the percentage of sales contributed by different outlet sizes using `OVER()`.
    * **Top Performers:** Identified the Top 5 item types generating the highest revenue.

### 3. 📊 Power BI Dashboard (`blinkit.pbix`)
The final **Interactive Visualization** layer.
* **KPI Scorecards:** Real-time tracking of Total Revenue, Avg Sales, and Item Counts.
* **Slicers:** Interactive filters for `Outlet Location`, `Outlet Size`, and `Item Type`.
* **Trend Analysis:** Visualizing how the Year of Establishment affects current sales performance.

---

## 📊 Key Metrics & Insights
* **Total Sales:** ~₹1.20M (Calculated via SQL and verified in Python).
* **Average Rating:** 3.9/5.0 across all product categories.
* **Consumer Preference:** Low Fat items significantly outperform Regular items in specific outlet locations.
* **Outlet Performance:** Tier 3 locations and Medium-sized outlets show the highest sales density.

## 🛠️ Tech Stack Used
* **Data Cleaning:** Python (Pandas), SQL (UPDATE/CASE statements)
* **Database:** PostgreSQL / MySQL
* **Visuals:** Power BI Desktop, Matplotlib, Seaborn
* **Environment:** Jupyter Notebook, SQL Workbench

---

## 🚀 How to Run
1. **Database:** Execute `blinkit_Sales.sql` in your SQL editor to create the table and run the analysis queries.
2. **Python:** Open `blinkit.ipynb` in Jupyter or VS Code to see the data exploration and cleaning steps.
3. **Dashboard:** Open `blinkit.pbix` in **Power BI Desktop** to interact with the final visual report.

---

