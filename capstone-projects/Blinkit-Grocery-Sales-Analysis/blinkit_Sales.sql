CREATE TABLE store_sales (
    Item_Fat_Content        VARCHAR(20),
    Item_Identifier         VARCHAR(20),
    Item_Type               VARCHAR(50),
    Outlet_Establishment_Year INT,
    Outlet_Identifier       VARCHAR(20),
    Outlet_Location_Type    VARCHAR(20),
    Outlet_Size             VARCHAR(20),
    Outlet_Type             VARCHAR(50),
    Item_Visibility         FLOAT,
    Item_Weight             FLOAT,
    Sales                   FLOAT,
    Rating                  INT
);

ALTER TABLE store_sales
ALTER COLUMN rating TYPE FLOAT;

select * from store_sales

update store_sales
SET item_fat_content = 
case
when item_fat_content in ('LF','low fat') then 'Low Fat'
when item_fat_content in ('reg') then 'Regular'
else item_fat_content
end;

select distinct(item_fat_content) from store_Sales;

-- Total Sales: The overall revenue generated from all items sold.

select 
   cast(sum(sales)/1000000 as decimal(10,2)) as total_sales
from store_Sales; --total sales in million

-- Average Sales: The average revenue per sale.
SELECT 
 cast(avg(sales) as decimal(10,0)) as avg_sales
 from store_sales;

-- Number of Items: The total count of different items sold.
select * from store_Sales

SELECT distinct item_type AS unique_items
FROM store_sales;

SELECT COUNT(distinct item_type) AS total_unique_items
FROM store_sales;

-- total sales for low fat

SELECT
  cast(sum(Sales)/1000000 as decimal(10,2)) as total_Sales_million
from store_Sales
where item_fat_content = 'Low Fat';

-- total sales for outlet_establishment_year = 2022
select 
  cast(sum(sales) as decimal (10,2)) as total_Sales
from store_Sales
where outlet_establishment_year = 2022;

-- to calculate total sales in million

SELECT
 cast(sum(sales)/1000000 as decimal(10,2)) as total_sales_million
 from store_sales
 where outlet_establishment_year = 2022;

-- Average Rating: The average customer rating for items sold. 

SELECT
cast(avg(Rating) as decimal(10,2)) as avg_rating
from store_sales;

-- Total Sales by yoy of Fat Content: Calculate the revenue generated for each fat-content category and analyze how metrics like average sales, item count, and average rating differ across them.

select 
 item_fat_content,
 outlet_establishment_year,
 cast(sum(sales) as decimal(10,2)) as total_sales,
 cast(avg(sales) as decimal(10,2)) as avg_sales,
 count(*) as no_of_items,
 cast(avg(Rating) as decimal(10,2)) as avg_rating
from store_sales
group by 1,2
order by 2,1 DESC

-- Total Sales by Item Type: Analyze which top 5 item types generate the highest sales and how KPIs like average sales, item count, and ratings vary across them.

select 
item_type,
cast(sum(sales) as decimal (10,2)) as total_Sales,
cast(avg(sales) as decimal (10,2)) as avg_Sales,
count(*) as no_of_item,
cast(avg(Rating) as decimal(10,2)) as avg_rating
from store_sales
group by 1
order by 2 desc
limit 5

-- Fat Content by Outlet for Total Sales: Compare total sales across outlets based on fat content and see how KPIs like average sales, item count, and ratings differ for each fat category.
select 
outlet_location_type,
item_fat_content,
cast(sum(sales) as decimal (10,2)) as total_Sales,
cast(avg(sales) as decimal (10,2)) as avg_Sales,
count(*) as no_of_item,
cast(avg(Rating) as decimal(10,2)) as avg_rating
from store_sales
group by 1,2
order by 1,2;

-- 4. Total Sales by Outlet Establishment: Evaluate how the age or type of outlet establishment influences total sales.
SELECT 
    outlet_establishment_year,
    outlet_type,
	cast(sum(sales) as decimal (10,2)) as total_Sales,
cast(avg(sales) as decimal (10,2)) as avg_Sales,
count(*) as no_of_item,
cast(avg(Rating) as decimal(10,2)) as avg_rating
    FROM store_sales
GROUP BY outlet_establishment_year, outlet_type
ORDER BY outlet_establishment_year, outlet_type;

--Percentage of Sales by Outlet Size: Analyze the correlation between outlet size and total sales.
select 
outlet_size,
cast(sum(sales) as decimal(10,2)) as total_Sales,
cast((sum(sales)*100/sum(sum(sales)) over()) as decimal (10,2)) as sales_percentage
from store_Sales
group by 1
order by 2 DESC;

-- Sales by Outlet Location: Assess the geographic distribution of sales across different locations.
select 
outlet_location_type,
outlet_establishment_year,
cast(sum(sales) as decimal(10,2)) as total_Sales
from store_Sales
group by 1,2
order by 1,2;

--All Metrics by Outlet Type:Provide a comprehensive view of all key metrics (Total Sales, Average Sales, Number of 	Items, Average Rating) broken down by different outlet types.

select 
outlet_type,
cast(sum(sales) as decimal (10,2)) as total_Sales,
cast(avg(sales) as decimal (10,2)) as avg_Sales,
count(*) as no_of_item,
cast(avg(Rating) as decimal(10,2)) as avg_rating
from store_sales
group by 1
order by 1 desc;
