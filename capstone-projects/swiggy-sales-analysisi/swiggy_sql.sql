DROP TABLE IF EXISTS SWIGGY;

CREATE TABLE SWIGGY (
    "State" VARCHAR(100),
    "City" VARCHAR(100),
    "Order Date" TEXT,   -- IMPORTANT: TEXT for import
    "Restaurant Name" VARCHAR(150),
    "Location" VARCHAR(150),
    "Category" VARCHAR(100),
    "Dish Name" VARCHAR(200),
    "Price (INR)" FLOAT,
    "Rating" FLOAT,
    "Rating Count" INT
);

UPDATE swiggy
SET "Order Date" =TO_DATE("Order Date",'DD-MM-YY');

SELECT * FROM SWIGGY;

-- DATA VALIDATION & CLEANING
-- NULL CHECK

SELECT
SUM(CASE WHEN "State" IS NULL THEN 1 ELSE 0 END) AS NULL_STATE,
SUM(CASE WHEN "City" IS NULL THEN 1 ELSE 0 END) AS NULL_CITY,
SUM(CASE WHEN "Order Date" IS NULL THEN 1 ELSE 0 END) AS NULL_order_date,
SUM(CASE WHEN "Restaurant Name" IS NULL THEN 1 ELSE 0 END) AS NULL_restaurent,
SUM(CASE WHEN "Location" IS NULL THEN 1 ELSE 0 END) AS NULL_Location,
SUM(CASE WHEN "Category" IS NULL THEN 1 ELSE 0 END) AS NULL_Category,
SUM(CASE WHEN "Dish Name" IS NULL THEN 1 ELSE 0 END) AS NULL_Dish_Name,
SUM(CASE WHEN "Price (INR)" IS NULL THEN 1 ELSE 0 END) AS NULL_Price,
SUM(CASE WHEN "Rating" IS NULL THEN 1 ELSE 0 END) AS NULL_Rating,
SUM(CASE WHEN "Rating Count" IS NULL THEN 1 ELSE 0 END) AS NULL_rating_count
FROM SWIGGY;

--blank and string 

select * from swiggy 
where "State" is null or "City" is null or "Order Date" is null or 
"Restaurant Name" is null or
"Location" is null or "Category" is null or "Dish Name" is null or 
"Price (INR)" is null or "Rating" is null or "Rating Count" is null;

-- duplicate detection

select 
"State", "City", "Order Date", "Restaurant Name", "Location", "Category", "Dish Name", "Price (INR)", 
"Rating", "Rating Count", COUNT(*) AS CNT
from SWIGGY
GROUP BY "State", "City", "Order Date", "Restaurant Name", "Location", "Category", "Dish Name", "Price (INR)", 
"Rating", "Rating Count"
HAVING COUNT(*) > 1

-- DELETE DUPLICATE
WITH CTE AS 
(SELECT CTID, 
ROW_NUMBER() OVER(PARTITION BY "State", "City", "Order Date", "Restaurant Name", "Location", "Category", "Dish Name", "Price (INR)", 
"Rating", "Rating Count" ORDER BY(SELECT NULL)
) AS RN
FROM SWIGGY)
DELETE FROM SWIGGY
WHERE CTID IN (SELECT ctid FROM CTE WHERE rn > 1);

-- total number of restaurants statewise
select 
state,
count(distinct restaurant_name)  as total_restaurants
from swiggy
group by 1;

-- Show all the restaurants with rating above 3.5 

select restaurant_name,
state,
Round(avg(rating)::"numeric",1) as avg_rating
from swiggy
where rating > 3.5
group by 1,2
order by 2;

-- Find the total number of orders in the dataset.
select
count(*) as total_orders
from swiggy;

-- Show all dishes priced below ₹200.
select
dish_name,
price_inr
from swiggy
where price_inr < 200;

-- Find average rating of restaurants in each state.
select 
state,
Round(avg(rating)::"numeric", 1) as avg_rating
from swiggy
group by state;

-- Find the top 5 most expensive dishes.
select 
dish_name,
restaurant_name,
price_inr
from swiggy
order by 3 desc
limit 5;

-- Count number of restaurants per city.
select
city,
count(distinct restaurant_name) as restaurant_count
from swiggy
group  by 1;

-- Find the 10 highest orderered per category.
select 
category,
count(*) as total_no_orders
from swiggy
group by 1
order by 2 desc
limit 10;

-- Show restaurants with rating between 3.5 and 4.5.
select 
restaurant_name,
city,
round(avg(rating)::"numeric",1) as avg_rating
from swiggy
group by 1,2
having avg(rating) BETWEEN 3.5 and 4.5;

-- Find the cheapest dish for each restaurant.
select 
restaurant_name,
dish_name,
min(price_inr) as cheapest_dish
from swiggy
group by 1,2;

-- Find the top 3 restaurants in each city by average rating.
-- using windows function
with avg_rating as(
select
restaurant_name,
city,
round(avg(rating)::"numeric",1) as avg_rating,
row_number() over(partition by city order by avg(rating) desc) as rn
from swiggy
group by restaurant_name,city)
select * 
from avg_rating
where rn <= 3;

-- Find which dish has the maximum number of ratings.
select
dish_name,
sum(rating_count) as total_rating
from swiggy
group by 1
order by total_rating desc
limit 1;

-- find cities where the average price of dishes is higher than the overall average price.
select 
city,
round(avg(price_inr)::"numeric",1) as avg_price
from swiggy
group by 1
having  avg(price_inr) > (select avg(price_inr) from swiggy);

-- Find restaurants that offer more than 10 unique dishes.
select
restaurant_name,
count(distinct dish_name) as unique_dish_count
from swiggy
group by 1
having count(distinct dish_name) > 10;

-- Find duplicate orders (exact same restaurant, dish, price).
select
restaurant_name, city, dish_name, price_inr, count(*)
from swiggy
group by 1,2,3,4
having count(*) > 1;

-- Get the most popular dish (highest number of orders) in each city.
with dish as (
     select
	 city,
	 dish_name,
	 count(*) as order_count,
	 row_number() over(partition by city order by count(*) desc) as rn
	 from swiggy
	 group by 1,2
)
select 
dish_name,
order_count
from dish
where rn = 1;

-- Find which state has the highest average restaurant rating.
select
state,
round(avg(rating)::"numeric",1) as avg_rating
from swiggy
group by 1
order by 2 desc
limit 1;





