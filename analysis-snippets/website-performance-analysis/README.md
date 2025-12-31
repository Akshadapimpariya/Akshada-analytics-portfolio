# Website Performance Analysis (Traffic & Engagement)

## 📌 Project Overview
This project focuses on analyzing website traffic data to understand user behavior, channel performance, and engagement trends. By processing export data containing session metrics and timestamps, the analysis identifies which channels drive the most value and how engagement fluctuates over time.

## 🛠️ Tech Stack
- **Language:** Python
- **Libraries:** Pandas (Data Wrangling), Matplotlib & Seaborn (Visualization), NumPy

---

## 🔍 Key Analysis & Insights

### 1. Channel Performance
- **Insight:** Analyzed traffic distribution across primary channels such as **Direct**, **Organic Social**, and **Organic Search**.
- **Metric:** Evaluated which channels yield the highest **Engagement Rate** and **Events per Session**.

### 2. Engagement vs. Traffic Volume
- **Trend Analysis:** Compared the relationship between the number of **Sessions** and the **Engagement Rate** over a time-series (Date + Hour).
- **Observation:** Identified peak hours of activity and whether high-traffic periods maintain a consistent engagement quality.

### 3. User Behavior Metrics
- **Average Engagement Time:** Calculated the average time users spend per session to gauge content stickiness.
- **Event Count:** Monitored total events (clicks, scrolls, etc.) to understand the depth of user interaction.

### 4. Data Preprocessing
- **Cleaning:** Handled data export headers and formatted the `Date + hour` column into a usable datetime format for time-series plotting.
- **Aggregation:** Grouped data by channel and time intervals to extract high-level summaries.

---

## 📂 Repository Structure
- `data-export (1).csv`: The raw website traffic data (session-based metrics).
- `website performance analysis.ipynb`: The Jupyter Notebook containing the Python code for cleaning, analysis, and visualization.

---

## 🚀 How to Run the Project
1. **Clone the repository:**
   ```bash
   git clone [https://github.com/your-username/website-performance-analysis.git](https://github.com/your-username/website-performance-analysis.git)
