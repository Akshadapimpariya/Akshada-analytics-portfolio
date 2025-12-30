# Shopping Behaviour Analysis: Multi-Platform Capstone Project

## 📌 Project Overview
This capstone project provides a 360-degree analysis of consumer purchasing patterns using a dataset of 300,000 shopping records. The goal of this project is to demonstrate data engineering and analytics proficiency across three core technologies: **Python** for data science, **SQL** for database management, and **Power BI** for executive-level storytelling.

---

## 📂 Repository Structure
* `shopping_behavior_300k.csv`: The primary dataset containing customer demographics and transaction details.
* `shopping behaviour.ipynb`: Jupyter Notebook containing Python EDA and statistical analysis.
* `shopping_behaviour.sql`: SQL script containing table schemas and advanced business logic queries.
* `shopping behaviour.pbix`: Power BI Dashboard file for interactive visualization.
* `README.md`: Project documentation (this file).

---

## 🛠️ Technical Implementation

### 1. Python Data Analysis
Using the `pandas`, `numpy`, and `matplotlib` libraries, I performed deep-dive Exploratory Data Analysis (EDA).
* **Key Tasks:** Data cleaning, handling 300k rows, and identifying spending outliers.
* **Key Findings:** * Calculated a global average spending of ~$60.
    * Identified top-performing locations (Rhode Island, North Carolina, Illinois) where spending consistently exceeds the average.
    * Analyzed the correlation between Review Ratings and Purchase Amounts.

### 2. SQL Database Management
The SQL portion focuses on transforming raw data into actionable business insights through complex querying.
* **Schema Design:** Created a structured `shopping_behaviour` table with appropriate data types.
* **Advanced Analytics:**
    * **Segmentation:** Grouping customers by Gender, Age, and Frequency.
    * **Window Functions:** Calculated price differences from category averages and ranked top-spending customers using `ROW_NUMBER()`.
    * **Revenue Share:** Calculated the percentage share of total revenue contributed by each season using CTEs and window aggregates.
    * **Performance Metrics:** Analyzed the impact of `Subscription_Status` on the `average_spend`.

### 3. Power BI Dashboard
An interactive dashboard was built to translate the data into visual stories for stakeholders.
* **KPIs:** Total Revenue, Average Order Value, and Total Customer Count.
* **Visualizations:** * Seasonal trends in purchasing behavior.
    * Demographic breakdown (Gender & Age distribution).
    * Popularity analysis of Shipping Types and Payment Methods.

---

## 📊 Key Business Insights
* **Location Strategy:** Marketing efforts should be intensified in high-spending regions like Rhode Island and North Carolina.
* **Subscription Impact:** Analysis shows a clear variance in spending patterns between subscribed and non-subscribed members, suggesting opportunities for loyalty program optimization.
* **Category Trends:** Detailed analysis of item categories (Clothing, Footwear, etc.) reveals which segments drive the highest revenue per season.

---

## 🚀 How to Run the Project

### Prerequisites
* **Python:** Install dependencies via `pip install pandas numpy matplotlib`.
* **SQL:** Any SQL-compliant database (MySQL, PostgreSQL, SQL Server).
* **Power BI:** Power BI Desktop (free version).

### Steps
1.  **Clone the Repo:** ```bash
    git clone [https://github.com/your-username/shopping-behaviour-analysis.git](https://github.com/your-username/shopping-behaviour-analysis.git)
    ```
2.  **Run Python Analysis:** Open `shopping behaviour.ipynb` in Jupyter and run all cells.
3.  **Execute SQL Script:** Import `shopping_behavior_300k.csv` into your DB and run `shopping_behaviour.sql`.
4.  **View Dashboard:** Open `shopping behaviour.pbix` to explore the interactive charts.

---
