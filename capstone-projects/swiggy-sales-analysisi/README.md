# Swiggy Data Analysis Project 📊

## Project Overview
This project provides an end-to-end analysis of Swiggy's food delivery ecosystem across various Indian cities. By combining **Python** for data exploration, **SQL** for database management, and **Power BI** for interactive visualization, the project uncovers key insights into consumer behavior, restaurant performance, and regional food trends.

---

## 📂 Project Structure

| File | Description |
| :--- | :--- |
| `swiggy_data.csv` | The raw dataset containing 197,000+ records of food items and ratings. |
| `SWIGGY.ipynb` | Jupyter Notebook containing Python-based cleaning and EDA. |
| `swiggy_sql.sql` | SQL script featuring data validation and advanced analytical queries. |
| `swiggy.pbix` | Power BI dashboard for interactive business intelligence reports. |

---

## 🛠️ Technologies Used

- **Data Processing:** Python (Pandas, NumPy)
- **Data Visualization:** Matplotlib, Seaborn
- **Database Management:** PostgreSQL / MySQL (SQL)
- **Business Intelligence:** Power BI Desktop

---

## 🔍 Key Analysis Phases

### 1. Exploratory Data Analysis (Python)
The Python analysis focused on understanding data distribution and identifying market leaders.
- **Data Cleaning:** Handled date formatting and removed duplicate entries.
- **Price Analysis:** Identified price outliers and calculated average spending per dish.
- **Top 10 Analysis:** Visualized top-rated restaurants and those with the highest revenue potential.
- **Visual Insights:** Used Heatmaps and Bar charts to identify peak ordering categories like "Snacks" and "Recommended."

### 2. Database Analytical Queries (SQL)
The `swiggy_sql.sql` script transforms raw data into business logic:
- **City-wise Performance:** Found the top 3 highest-rated restaurants in every city.
- **Dish Popularity:** Identified the most ordered dishes based on `rating_count`.
- **Pricing Benchmarks:** Compared city-level average prices against the national average.
- **Integrity Checks:** Implemented logic to detect duplicate orders and null values across 10 parameters.

### 3. Interactive Dashboard (Power BI)
The dashboard provides a high-level view of the Swiggy ecosystem:
- **KPI Cards:** Total Restaurants, Average Rating, and Total Dishes.
- **Slicers:** Filter data by **State**, **City**, or **Category**.
- **Visuals:** Revenue trends, rating distribution by city, and category-wise performance.

---

## 💡 Key Insights
- **Top Categories:** "Recommended" and "Snacks" are the most dominant food categories across India.
- **Regional Trends:** Cities like **Gangtok** show a high density of "Momos" orders, while **Bengaluru** has the highest variety of multi-cuisine restaurants.
- **Pricing Strategy:** Most dishes are priced under ₹300, but high-end "Party Combo" packs push the upper boundary to ₹8,000.
- **Customer Engagement:** High-rated restaurants generally correlate with a higher variety of unique dishes (10+ items).

---

## 🚀 How to Run

### Prerequisites
- Python 3.x
- SQL Server (PostgreSQL/MySQL)
- Power BI Desktop

### Setup
1. **Clone the repository:**
   ```bash
   git clone [https://github.com/your-username/swiggy-analysis.git](https://github.com/your-username/swiggy-analysis.git)
