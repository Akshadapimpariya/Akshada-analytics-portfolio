# 🎵 Spotify Music Data Analysis - Advanced SQL Queries

This repository showcases a data analysis project executed entirely using SQL. The project focuses on a dataset of Spotify tracks and their associated audio features, engagement metrics, and artist information. It demonstrates proficiency in complex SQL query writing, including aggregation, window functions, and Common Table Expressions (CTEs).

## 🎯 Project Goal

The primary objective is to extract meaningful business intelligence and insights from the music data, showcasing advanced SQL skills for data manipulation and reporting.

## 🔬 Key SQL Skills Demonstrated

The `spotify_sql.sql` file contains a series of queries designed to answer specific business questions:

* **Database Setup:** Contains the `CREATE TABLE` and schema definition for the `SPOTIFY` dataset.
* **Exploratory Data Analysis (EDA):** Queries to understand basic data statistics (e.g., count of distinct artists, max/min track duration).
* **Aggregation:** Calculating average track features.
* **Advanced Window Functions:**
    * Finding the **top 3 most-viewed tracks for each artist** using `DENSE_RANK()` over a partition. (This is a strong demonstration of advanced SQL ability).
* **Common Table Expressions (CTEs):**
    * Using a CTE to calculate the **difference between the highest and lowest energy values** for tracks in each album.
* **Subqueries:** Identifying tracks where a feature (e.g., `LIVENESS`) is above the global average.

## 🛠️ Technologies Used

| Tool | Purpose |
| :--- | :--- |
| **SQL** | Primary language for data querying and analysis. |
| **Database Platform** | Designed for execution on relational databases (e.g., PostgreSQL, MySQL, SQL Server). |

## 📂 Repository Structure

* `spotify_sql.sql`: Contains the table schema definition and all analytical SQL queries.

## 🚀 How to Run the Queries

1.  **Setup:** Connect to your preferred SQL environment (e.g., DB Fiddle, a local PostgreSQL instance).
2.  **Data:** Execute the `CREATE TABLE` statement and import your Spotify track data into the table.
3.  **Analyze:** Copy and execute the subsequent queries in `spotify_sql.sql` to generate the insights.
