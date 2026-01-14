# Website Performance Analysis

A Python-based data analysis project that processes Google Analytics 4 (GA4) export data to visualize user engagement and traffic trends.

## Project Overview

This repository contains a Jupyter Notebook designed to clean, process, and analyze website traffic data. The analysis focuses on understanding how different acquisition channels perform and how engagement metrics fluctuate over time.

## Dataset

The analysis uses `data-export (1).csv`, which includes the following metrics:
* **Sessions & Users**: Volume of traffic.
* **Engagement Rate**: Percentage of engaged sessions.
* **Average Engagement Time**: Duration of user activity.
* **Event Count**: Total interactions per session.
* **Channel Group**: Traffic sources (Direct, Organic Social, etc.).

## Key Features

* **Data Cleaning**: Automatically handles GA4 header metadata and formats column headers.
* **Time-Series Analysis**: Converts raw date-hour strings into datetime objects for temporal plotting.
* **Performance Visualization**: Includes comparative line charts for Sessions and Engagement Rates.
* **Channel Segmentation**: Groups data by traffic source to identify high-performing channels.

## Installation & Requirements

To run this analysis, you will need Python installed along with the following libraries:

```bash
pip install pandas numpy matplotlib seaborn
