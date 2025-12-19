✈️ Airline Flight Data Analysis
This project involves an exploratory data analysis (EDA) of a comprehensive flight dataset to understand the factors influencing flight ticket prices and travel patterns across various Indian cities.

📋 Dataset Description
The analysis is based on the airlines_flights_data.csv dataset, which contains 300,153 records and 11 columns.

Key Attributes:
airline: The name of the airline operating the flight.

flight: The flight code.

source_city: The city from which the flight departs.

departure_time: Time of day for departure (e.g., Morning, Evening, Night).

stops: Number of stops between source and destination.

arrival_time: Time of day for arrival.

destination_city: The city where the flight lands.

class: Travel class (Economy or Business).

duration: Total travel time in hours.

days_left: Number of days between booking and departure.

price: Ticket price.

🔍 Analysis Highlights
The notebook flight.ipynb performs several data cleaning and exploration tasks:

Data Cleaning: Removed unnecessary columns like index to streamline the analysis.

Exploratory Statistics:

The average flight duration is approximately 12.22 hours.

The maximum flight duration observed is 49.83 hours (Air India flight AI-672).

The minimum flight duration is 0.83 hours (primarily Indigo flights between Bangalore and Chennai).

Price Insights: Analyzed ticket pricing which ranges from a minimum of 1,105 to a maximum of 123,071.

Data Visualization: Utilized libraries like seaborn and matplotlib to visualize relationships between different flight features and their impact on pricing.

🛠️ Tools & Libraries
Python 🐍: The core programming language.

Pandas: For data manipulation and loading the CSV.

NumPy: For numerical computations.

Matplotlib & Seaborn: For creating insightful data visualizations.

🚀 Getting Started
Ensure airlines_flights_data.csv is in your working directory.

Open flight.ipynb in your preferred Jupyter environment.

Run the cells sequentially to reproduce the analysis and view the generated plots.
