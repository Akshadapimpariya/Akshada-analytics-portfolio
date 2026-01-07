# Customer Churn Analysis - Predictive Insights & EDA

## 📌 Project Overview
Customer churn is one of the most critical metrics for any subscription-based business. This project involves a deep-dive Exploratory Data Analysis (EDA) of a telecommunications dataset to identify the key factors that lead to customer attrition. By understanding why customers leave, businesses can implement better retention strategies.

## 🛠️ Tech Stack
- **Language:** Python
- **Libraries:** Pandas (Data Manipulation), NumPy, Matplotlib & Seaborn (Data Visualization)

---

## 🔍 Key Analysis & Insights

### 1. Payment Method & Churn
- **Insight:** Customers using **Electronic Checks** churn at a significantly higher rate compared to any other payment method.
- **Trend:** Customers using automatic payment methods—**Bank Transfer** and **Credit Card**—are the most stable and show the lowest churn rates.

### 2. Contract Terms
- **Insight:** Month-to-month contract holders are the most likely to churn.
- **Strategy:** Moving customers from monthly plans to one-year or two-year contracts could drastically reduce the churn rate.

### 3. Service Influence
- **Insight:** Analysis of technical services (Online Security, Tech Support, etc.) shows that customers *without* these add-ons are more prone to leaving.
- **Observation:** Fiber optic users show a higher churn rate compared to DSL users, possibly due to pricing or service stability issues.

### 4. Demographic Impact
- **Insight:** Senior citizens and customers without partners/dependents show a higher tendency to churn.
- **Observation:** Tenure plays a massive role; the risk of churn is highest in the first few months of a customer's journey.

---

## 📂 Repository Structure
- `Customer Churn.csv`: The primary dataset containing customer demographics, account information, and churn status.
- `customerchurn (1).ipynb`: The Jupyter Notebook containing the full Python workflow, including data cleaning, feature analysis, and visualization.

---

## 🚀 How to Run the Project
1. **Clone the repository:**
   ```bash
   git clone [https://github.com/your-username/customer-churn-analysis.git](https://github.com/your-username/customer-churn-analysis.git)
