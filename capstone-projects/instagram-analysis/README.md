# Instagram Analytics: End-to-End Data Portfolio Project

## 📌 Project Overview
This project performs a deep-dive analysis of Instagram performance metrics using a dataset of ~30,000 posts. The objective is to extract actionable insights regarding user engagement, content strategy, and growth trends by leveraging a modern data stack: **Python**, **SQL**, and **Power BI**.

---

### 🐍 Python (Data Science & EDA)
The Python analysis focuses on data exploration and identifying patterns in engagement across various content categories.
- **File:** `instagram.ipynb`
- **Libraries:** `pandas`, `numpy`, `matplotlib`, `seaborn`.
- **Key Analysis:** - Automated data ingestion from `Instagram_Analytics.csv`.
    - **Follower Growth Analysis:** Identified which content categories (e.g., Fitness, Technology, Comedy) drive the highest average follower gain.
    - **Engagement Visuals:** Created bar charts and distribution plots to visualize performance across categories.

### 🗄️ SQL (Advanced Data Querying)
The SQL component demonstrates the ability to manage relational data and perform complex business logic queries.
- **File:** `instagram.sql`
- **Key Features:**
    - **Database Schema:** Defined a structured table with appropriate data types for dates, metrics, and categories.
    - **Performance Ranking:** Utilized **Window Functions** (`DENSE_RANK()`, `ROW_NUMBER()`) to identify top-performing posts by reach and impressions within specific media types.
    - **Time-Series Analysis:** Calculated monthly average engagement rates and used `LAG()` to compare month-over-month performance.
    - **KPI Extraction:** Queries to find maximum impressions, total likes, and engagement summaries by traffic source (Home Feed, Explore, etc.).

### 📊 Power BI (Business Intelligence Dashboard)
The Power BI dashboard serves as the visual storytelling layer, converting raw data into interactive business insights.
- **File:** `instagram.pbix`
- **Dashboard Highlights:**
    - **Engagement Overview:** High-level KPIs for Total Reach, Likes, and Shares.
    - **Content Strategy:** Visual breakdown of performance by Media Type (Photo, Reel, Carousel).
    - **Growth Tracking:** Monitoring `followers_gained` trends over time.
    - **Interactive Filters:** Allows users to slice data by `content_category` and `traffic_source`.

---

## 📂 Repository Structure
* `Instagram_Analytics.csv`: The raw dataset containing 15 features including engagement metrics and post metadata.
* `instagram.ipynb`: Jupyter Notebook containing the Python exploratory analysis.
* `instagram.sql`: SQL script with table creation and analytical queries.
* `instagram.pbix`: Power BI Desktop file for the interactive dashboard.

---

## 📈 Key Business Insights
1. **Category Performance:** Certain niches (like Technology and Music) show significantly higher engagement rates compared to others.
2. **Growth Drivers:** Reels consistently drive higher reach, but Carousels often lead to higher "save" rates, indicating deeper value.
3. **Traffic Source Optimization:** Analyzing the "Reels Feed" vs. "Home Feed" reach helps in understanding how the Instagram algorithm prioritizes different content types.

---

## 🚀 How to Use This Project
1. **SQL:** Run the `instagram.sql` script in your database environment (PostgreSQL/MySQL) after importing the CSV.
2. **Python:** Open `instagram.ipynb` in Jupyter Lab or VS Code to view the data processing and visualization steps.
3. **Power BI:** Open `instagram.pbix` in Power BI Desktop to interact with the live dashboard.

---
