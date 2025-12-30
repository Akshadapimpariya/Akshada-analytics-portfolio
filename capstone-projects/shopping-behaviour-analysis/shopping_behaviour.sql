create table shopping_behaviour(
Customer_id int,	
Age	int,
Gender varchar(20),
Item_Purchased varchar(25),
Category varchar(25),
Purchase_Amount_usd int,
Location varchar(50),
Size varchar(10),
Color varchar(25),
Season varchar(25),
Review_Rating float,
Subscription_Status varchar(10),
Shipping_Type varchar(25),
Discount_Applied varchar(10),
Promo_Code_Used varchar(10),
Previous_Purchases int,
Payment_Method varchar(20),
Frequency_Purchases varchar(50)
)

select * from shopping_behaviour;

-- Select first 10 rows.
select * from shopping_behaviour
limit 10;

-- Find distinct payment methods.
select distinct payment_method
from shopping_behaviour;

-- Count customers by gender.
select 
gender,
count(*)
from shopping_behaviour
group by 1;

-- Find average age.
SELECT
round(avg(age),1)
from shopping_behaviour;

--Find max and min price of each item
SELECT
item_purchased,
min(purchase_amount_usd) as minimum_price,
max(purchase_amount_usd) as maximum_price
from shopping_behaviour
group by 1;

-- Find total revenue.
SELECT
sum(purchase_amount_usd) as total_revenue
from shopping_behaviour;

-- Get most purchased item.
SELECT
item_purchased,
count(*)
from shopping_behaviour
group by 1
order by 2 desc
limit 1;

--Find total item purchases from a payment_method.
SELECT 
payment_method,
count(item_purchased) as total_item_purchased
from shopping_behaviour
group by 1;

-- Find average spending by gender,
SELECT 
gender,
round(avg(purchase_amount_usd)) as avg_spending
from shopping_behaviour
group by 1;

-- Get transactions above $50.
select * from shopping_behaviour
where purchase_amount_usd > 50;

-- . Find top 3 categories by revenue.
SELECT
category,
sum(purchase_amount_usd) as revenue
from shopping_behaviour
group by 1
order by 2 desc
limit 3;

-- Count customers by age group.
SELECT
case when age < 20 then 'teen'
     WHEN age < 30 then 'young'
	 when age < 45 then 'adult'
	 WHEN age < 60 then 'mid_age'
	 else 'senior'
end as age_group,
count(*)
from shopping_behaviour
group by age_group;

-- Rank customers by total spending.
with rank_cust as(
     select 
	 customer_id,
	 sum(purchase_amount_usd) as total_spending
	 from shopping_behaviour
	 group by 1
)

SELECT
customer_id,
total_spending,
       RANK() OVER (ORDER BY total_spending DESC) AS spend_rank
from rank_cust;

-- Find top-selling item per category.
with top_selling as(
       select
	   item_purchased,
	   category,
	   count(*) as cnt,
	   row_number() over(partition by category order by count(*) desc) as rn
	   from shopping_behaviour
	   group by item_purchased,category
)
select * from top_selling
where rn =1;

-- Revenue % by category
WITH total AS (
    SELECT SUM(purchase_amount_usd)::numeric AS t
    FROM shopping_behaviour
)
SELECT 
    category,
    SUM(purchase_amount_usd) AS revenue,
    round((SUM(purchase_amount_usd)::numeric / (SELECT t FROM total)) * 100,2) AS percent_share
FROM shopping_behaviour
GROUP BY category;

-- Find customers who spent more than avg spending.

WITH avg_spend AS (
    SELECT AVG(purchase_amount_usd) AS avg_spent
    FROM shopping_behaviour
)
SELECT 
    customer_id,
    purchase_amount_usd AS total_spent
FROM shopping_behaviour
WHERE purchase_amount_usd > (SELECT avg_spent FROM avg_spend);

-- Category-wise minimum price item.
with t as(
     select
	 category,
	 item_purchased,
	 purchase_amount_usd,
	 row_number() over(PARTITION by category order by purchase_amount_usd asc) as rn
	 from shopping_behaviour
	 )
SELECT *
from t
where rn = 1;

-- Find most used payment method by gender.

SELECT
gender,
payment_method,
count(*)
from shopping_behaviour
group by 1,2;

-- Top 10 customers by average transaction value.
SELECT customer_id, AVG(purchase_amount_usd) AS avg_value
FROM shopping_behaviour
GROUP BY customer_id
ORDER BY avg_value DESC
LIMIT 10;

-- Window: Dense rank by category spending.
SELECT
category,
sum(purchase_amount_usd) as revenue,
dense_rank() over(order by sum(purchase_amount_usd) desc) as category_rank
from shopping_behaviour
group by category;

-- Category revenue with cumulative %.
with a as(
    SELECT
    category,
    sum(purchase_amount_usd) as revenue
    from shopping_behaviour
    group by category)
select 
category,
revenue,
sum(revenue) over(order by revenue desc) as cum_Rev,
round(SUM(revenue) OVER (ORDER BY revenue DESC) * 100.0 /
        SUM(revenue) OVER ())AS cum_percentage
from a;

-- Customers spending highest in each gender group.
with cust_spend as (
     select
	 gender,
	 customer_id,
	 sum(purchase_amount_usd) as total_spent,
	 row_number() over(partition by gender order by sum(purchase_amount_usd) desc) as rn
	 from shopping_behaviour
	 group by gender,customer_id)
select * from cust_spend
where rn = 1;

-- Window: Price difference from category average.
SELECT
customer_id,
category,
purchase_amount_usd,
purchase_amount_usd-avg(purchase_amount_usd)over(partition by category) as price_diff
from shopping_behaviour

-- Subscription Impact Analysis
SELECT
subscription_status,
avg(purchase_amount_usd) as avg_spend
from shopping_behaviour
group by subscription_status;

-- Seasonal Revenue Contribution (%)
select
season,
sum(purchase_amount_usd) as season_revenue,
sum(purchase_amount_usd)*100/sum(sum(purchase_amount_usd)) over() as percent_share
from shopping_behaviour
group by season;

-- Customers with High Previous Purchases
with high_purchase as(
      select 
	  customer_id,
	  category,
	  previous_purchases,
	  avg(previous_purchases) over() as overall_avg,
	  avg(previous_purchases) over(partition by category) as cat_avg
	  from shopping_behaviour
	  
)
select *
from high_purchase
where previous_purchases > overall_avg
and previous_purchases > cat_avg;

-- Discount & Promo Effectiveness
with t as (
       select
	   discount_applied,
	   promo_code_used,
	   avg(purchase_amount_usd) as avg_spend
	   from shopping_behaviour
	   group by discount_applied,promo_code_used
)
select * from t
order by avg_spend desc;


