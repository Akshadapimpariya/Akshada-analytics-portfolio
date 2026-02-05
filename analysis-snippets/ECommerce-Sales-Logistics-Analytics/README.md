# E-Commerce Sales & Logistics Analytics 📊

This repository contains a comprehensive data analytics and business intelligence project focused on e-commerce operations. It tracks the journey from customer sign-up and product management to order fulfillment and shipping efficiency.

## 📂 Project Structure

| File | Description |
| :--- | :--- |
| `users.csv` | Customer demographics including signup dates and premium membership status. |
| `products.csv` | Inventory data with product categories, pricing, and manufacturing costs. |
| `orders.csv` | Transactional records containing order dates, quantities, and fulfillment status. |
| `shipping.csv` | Logistics data tracking ship modes, fees, and delivery timelines. |
| `orders.sql` | PostgreSQL scripts for complex business logic, revenue trends, and churn analysis. |
| `orders.pbix` | Interactive Power BI dashboard for executive-level reporting. |

## 🛠️ Data Engineering & SQL Insights

The `orders.sql` file contains advanced analytical queries designed to drive business growth:
* **Revenue Performance:** Monthly trend analysis (2024 vs. 2025) to identify seasonal growth.
* **Customer Retention:** A "Lost Customer" query identifying users who purchased in 2024 but haven't returned in 2025.
* **Loyalty Segmentation:** Categorizes users into tiers based on purchase frequency (e.g., "Loyal" vs. "One-time" buyers).
* **Logistics Optimization:** Calculates shipping delays by comparing actual shipping dates against the average for each ship mode (Economy, Standard, Priority).
* **Profitability Analysis:** Joins orders with product costs to calculate net profit margins per category.

## 📊 Visual Intelligence (Power BI)

The `orders.pbix` dashboard provides a 360-degree view of the business:
* **Sales Overview:** Real-time tracking of completed vs. cancelled orders.
* **Premium vs. Standard:** Analyzing the spending habits of premium members compared to regular users.
* **Shipping Performance:** Gauging the cost-to-speed ratio of different logistics providers.
* **Product Popularity:** Heatmaps showing top-performing categories (Furniture, Electronics, Beauty, etc.).

## 🚀 How to Use
1. **Database Setup:** Load the CSV files into a PostgreSQL database.
2. **Execute Queries:** Run `orders.sql` to generate specialized reports on churn and loyalty.
3. **Explore Dashboard:** Open `orders.pbix` in Power BI Desktop to interact with the visualizations.

---
**Tech Stack:** SQL (PostgreSQL), Power BI, Data Modeling.
