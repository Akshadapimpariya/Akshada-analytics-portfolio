# Sales Dashboard - Power BI Analytics

![Power BI](https://img.shields.io/badge/Data_Visualization-Power_BI-yellow)
![Status](https://img.shields.io/badge/Status-Completed-success)

## 📊 Project Overview
This Power BI dashboard provides a deep-dive analysis of sales performance, customer trends, and product profitability. It is designed to transform raw transactional data into actionable business insights, allowing stakeholders to monitor KPIs in real-time.



## 🚀 Key Features
* **Executive Summary:** High-level overview of Total Revenue, Profit, and Total Units Sold.
* **Trend Analysis:** Time-series charts showing sales growth month-over-month (MoM) and year-over-year (YoY).
* **Geographic Insights:** Interactive map visuals to identify high-performing regions.
* **Product Performance:** Analysis of top-selling products and categories using Pareto principles.
* **Dynamic Filtering:** Slicers for Date, Region, and Category to allow for granular data exploration.

## 🏗️ Technical Architecture
The report is built on a structured Power BI framework:

1.  **Data Connection:** Connected via [e.g., SQL Server / Excel / Web API].
2.  **Data Transformation (Power Query):** * Cleaned and transformed raw data.
    * Handled missing values and standardized date formats.
    * Created a dedicated `Dim_Date` table for time-intelligence calculations.
3.  **Data Modeling:** * Follows a **Star Schema** for optimal performance.
    * One-to-many relationships established between Fact tables and Dimension tables.
4.  **DAX Calculations:**
    * Created measures for Total Sales, YTD Revenue, and Profit Margin.



## 🛠️ Requirements
To view or edit this report, you will need:
* [Power BI Desktop](https://powerbi.microsoft.com/desktop/) (June 2024 version or newer recommended).
* Access to the underlying data source (if refreshing the data).

## 📂 File Structure
* `sales dashboard.pbix`: The main Power BI report file containing the data model and visualizations.
* `/Data`: (Optional) Folder containing raw CSV/Excel source files.
* `/Documentation`: Detailed data dictionary and measure definitions.

## 📖 How to Use
1.  **Clone the Repository:**
    ```bash
    git clone [https://github.com/your-username/sales-dashboard.git](https://github.com/your-username/sales-dashboard.git)
    ```
2.  **Open the Report:** Double-click `sales dashboard.pbix` to open it in Power BI Desktop.
3.  **Refresh Data:** If you have access to the data source, click the **Refresh** button in the Home ribbon to pull the latest figures.
4.  **Interact:** Use the slicers on the left/top of the report to filter the visuals.

---
