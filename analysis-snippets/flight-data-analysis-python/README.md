# ✈️ Airline Flight Data Analysis Project (Python)

![Python](https://img.shields.io/badge/Python-3776AB?style=for-the-badge&logo=python&logoColor=white)
![Pandas](https://img.shields.io/badge/Pandas-150458?style=for-the-badge&logo=pandas&logoColor=white)
![Data Analysis](https://img.shields.io/badge/Exploratory-Data_Analysis-blueviolet?style=for-the-badge)

## Project Overview

This project performs an in-depth **Exploratory Data Analysis (EDA)** on a flight booking dataset. The goal is to clean large-scale transactional data and derive insights regarding pricing trends, flight durations, and service patterns across major Indian cities using Python.

## Data Source and Schema

The analysis uses the `airlines_flights_data.csv` dataset, which contains **300,153 rows** and **11 columns**.

### Flight Data Table Schema

| Column Name | Data Type | Description |
| :--- | :--- | :--- |
| `airline` | `Object` | Name of the airline company. |
| `flight` | `Object` | Specific flight code/number. |
| `source_city` | `Object` | City of departure. |
| `departure_time` | `Object` | Time slot of departure (e.g., Morning, Night). |
| `stops` | `Object` | Number of stops (zero, one, two_or_more). |
| `arrival_time` | `Object` | Time slot of arrival. |
| `destination_city`| `Object` | City of arrival. |
| `class` | `Object` | Travel class (Economy or Business). |
| `duration` | `Float` | Total travel time in hours. |
| `days_left` | `Int` | Days remaining between booking and travel. |
| `price` | `Int` | Ticket price in INR. |

## Analysis Phases

The project is structured into logical data science workflows:

### 1. Environment Setup 🏗️
* Integration of core data science libraries: `Pandas`, `NumPy`, `Matplotlib`, and `Seaborn`.

### 2. Data Cleaning 🧹
* **Refining Features:** Removed unnecessary columns such as `index` to optimize memory usage and focus on relevant variables.
* **Integrity Check:** Performed `.info()` and `.describe()` to verify data types and identify statistical anomalies.

### 3. Exploratory Data Analysis (EDA) 🕵️
* **Statistical Summary:** Identified the average flight price is **₹20,889**, while durations average **12.22 hours**.
* **Extreme Value Analysis:**
    * **Maximum Duration:** Identified Air India flight `AI-672` as the longest flight at **49.83 hours**.
    * **Minimum Duration:** Found multiple Indigo flights between Bangalore and Chennai taking only **0.83 hours**.

### 4. Visual Insights & Business Logic 📈
The notebook uses visualization techniques to answer critical travel business questions:
* Relationship between **Class (Economy vs. Business)** and ticket pricing.
* Impact of **Days Left** for booking on the final price.

## 🛠️ Requirements & Execution

1. **Prerequisites:** Python 3.x with `pandas`, `numpy`, `matplotlib`, and `seaborn` installed.
2. **Dataset:** Place `airlines_flights_data.csv` in the root directory.
3. **Execution:** Run the `flight.ipynb` notebook sequentially to generate full statistical reports and plots.

---
