create table diwali_sales(
User_ID int,
Cust_name varchar(25),
Product_ID varchar(50),
Gender varchar(10),
Age_Group varchar(10),
Age	int,
Marital_Status int,
State varchar(25),
Zone varchar(25),
Occupation varchar(50),
Product_Category varchar(25),
Orders int,
Amount float
)

select count(*)
from diwali_sales

-- removing the duplicates
select 
user_id, cust_name,product_id,gender,age_group,age,marital_status,state,zone,occupation,
product_category,orders,amount,count(*)
from diwali_sales
group by user_id, cust_name,product_id,gender,age_group,age,marital_status,state,zone,occupation,
product_category,orders,amount
having count(*) > 1

-- deleting the duplicates

delete from diwali_sales
where ctid not in(
select min(ctid)
from diwali_sales
group by user_id, cust_name,product_id,gender,age_group,age,marital_status,state,zone,occupation,
product_category,orders,amount);

-- updating the null values with 0 in amount column
UPDATE diwali_sales
SET Amount = 0
WHERE Amount IS NULL;

-- Find total revenue generated during Diwali.
select
sum(Amount) as total_revenue 
from diwali_sales;

-- Find total orders and revenue by product category.
select
Product_Category,
sum(Amount) as total_revenue,
sum(Orders) as total_orders
from diwali_sales
group by Product_Category;

-- Show average order value (AOV) by gender.
select
gender,
sum(Amount)/sum(Orders) as avg_order_value
from diwali_sales
group by gender;

-- Find top 5 states by total revenue.
select
State,
sum(Amount) as total_revenue
from diwali_sales
group by State
order by sum(Amount)  desc
limit 5;

-- Count number of customers by marital status.
select
Marital_Status,
count(distinct User_ID) as customer_count
from diwali_sales
group by Marital_Status;

-- Find average spending per customer.
select avg(customer_total) as avg_spend_per_customer
from(select 
user_id,
sum(amount) as customer_total
from diwali_sales
group by user_id)
t;

-- Find revenue contribution by age group.
select
age_group,
sum(amount) as revenue
from diwali_sales
group by age_group;

-- Identify most common occupation among customers.
select
occupation,
count(*) as customer_count
from diwali_sales
group by occupation
order by count(*) desc;

-- Find zones with average order value greater than 3500.
select
Zone,
sum(amount)/sum(orders) as avg_order_values
from diwali_Sales
group by zone
having sum(amount)/sum(orders) > 3500;

-- Find customers who placed more than 5 orders.
SELECT 
user_id,
cust_name,
sum(orders) as total_order
from diwali_sales
group by user_id, cust_name
having sum(orders) > 5;

-- Rank customers by total spending (window function).
select
user_id,
sum(amount) as total_spent,
dense_rank() over(order by sum(amount) desc) as rn
from diwali_sales
group by user_id
FROM diwali_sales;

-- Find top 3 customers in each state by revenue.
with top3 as(
     select
	 user_id,
	 state,
	 sum(amount) as revenue,
	 dense_rank() over(partition by state order by sum(amount) desc) as rn
	 from diwali_sales
	 group by user_id, state
	 )
select * from top3
where rn <=3;

-- Calculate percentage contribution of each product category.
select
product_category,
(sum(amount) * 100/sum(sum(amount)) over() as revenue_percent
from diwali_sales
group by product_category;

-- Identify customers whose spending is above average.
select
user_id,
sum(amount) as total_spent
from diwali_sales
group by user_id
having sum(amount) > 
      (select avg(total_amount) as avg_spend
	  from(select 
	  user_id,
	  sum(amount) as total_amount
	  from diwali_Sales
	  group by user_id
	  )t);
                     
-- Find state-wise revenue running total.
SELECT 
    State,
    SUM(Amount) AS revenue,
    SUM(SUM(Amount)) OVER (ORDER BY SUM(Amount) DESC) AS running_total
FROM diwali_sales
GROUP BY State;

-- Compare married vs unmarried spending using CASE.
select
 case
    when Marital_Status = 1 then 'married'
    else 'unmarried'
  end as marital_group,
  sum(amount) as total_Spend
 from diwali_sales
 group by marital_status;

-- Find highest selling category per zone.
with highest_selling as(
     select
	 zone,
	 product_category,
	 sum(amount) as total_amount,
	 rank() over(partition by zone order by sum(amount) desc) as rn
	 from diwali_sales
	 group by zone,product_category
	 )
select * from highest_selling
where rn = 1;

-- Find average order value by age group and gender.
SELECT 
    age_group,
    Gender,
    SUM(Amount) / SUM(Orders) AS avg_order_value
FROM diwali_sales
GROUP BY age_group, Gender

-- Detect states with declining order size
SELECT 
    State,
    AVG(Orders) AS avg_orders
FROM diwali_sales
GROUP BY State
HAVING AVG(Orders) < 2;

-- Find occupation contributing highest revenue per zone.
with highest_revenue as(
     select
	 occupation,
	 zone,
	 sum(amount) as revenue,
	 rank() over(partition by zone order by sum(amount) desc) rn
	 from diwali_sales
	 group by occupation,zone
)
select * from highest_revenue
where rn = 1;

-- Find customers active across multiple states. 
SELECT User_ID
FROM diwali_sales
GROUP BY User_ID
HAVING COUNT(DISTINCT State) > 1;

-- Create customer value segmentation (High / Medium / Low).
SELECT 
    User_ID,
    SUM(Amount) AS total_spent,
    CASE 
        WHEN SUM(Amount) >= 30000 THEN 'High Value'
        WHEN SUM(Amount) BETWEEN 15000 AND 29999 THEN 'Medium Value'
        ELSE 'Low Value'
    END AS customer_segment
FROM diwali_sales
GROUP BY User_ID;



  
