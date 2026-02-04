create table freelancer_earning(
freelancer_id varchar(25),
category varchar(100),
region varchar(50),
education varchar(50),
primary_platform varchar(50),
country varchar(50),
years_experience float,
experience_level varchar(25),
hourly_rate_usd	float,
annual_income_usd text
)

select * from freelancer_earning;

alter table freelancer_earning
alter column annual_income_usd type double precision
using (regexp_replace(annual_income_usd , '[^0-9.]','', 'g') :: double precision)

ALTER TABLE freelancer_earning 
ALTER COLUMN years_experience TYPE INTEGER 
USING (NULLIF(REGEXP_REPLACE(years_experience::text, '[^0-9]', '', 'g'), '')::INTEGER);

UPDATE freelancer_earning 
SET years_experience = 0 
WHERE years_experience IS NULL;
-- Check the new data type
SELECT column_name, data_type 
FROM information_schema.columns 
WHERE table_name = 'freelancer_earning' 
AND column_name = 'annual_income_usd';

-- Look at the first few rows to ensure the numbers look correct
SELECT annual_income_usd FROM freelancer_earning LIMIT 5;

-- Standardizing Text (Trimming & Casing)
UPDATE freelancer_earning
SET
category = initcap(trim(category)),
region = initcap(trim(region)),
education = initcap(trim(education)),
primary_platform = initcap((trim(primary_platform))),
country = upper(trim(country)),
experience_level = initcap(trim(experience_level));

-- Handling Missing Values (NULLs)
-- Fill missing years_experience with the median or 0
update freelancer_earning
set years_experience= 0
where years_experience is null

UPDATE freelancer_earning
SET education = 'Unknown'
WHERE education IS NULL OR TRIM(education) = '';

UPDATE freelancer_earning 
SET category = 'Unknown' 
WHERE category IS NULL OR category = '';

-- Fix Hourly Rates (Blanks, Negatives, and Outliers to 0)
UPDATE freelancer_earning
SET hourly_rate_usd = 0
WHERE hourly_rate_usd IS NULL 
   OR hourly_rate_usd < 0 
   OR hourly_rate_usd > 1000;

-- deleting the duplicate
DELETE FROM freelancer_earning f
USING (
    SELECT 
        ctid
    FROM (
        SELECT 
            ctid,
            ROW_NUMBER() OVER (
                PARTITION BY 
                    freelancer_id,
                    category,
                    region,
                    education,
                    primary_platform,
                    country,
                    years_experience,
                    experience_level,
                    hourly_rate_usd,
                    annual_income_usd
                ORDER BY ctid
            ) AS rn
        FROM freelancer_earning
    ) t
    WHERE rn > 1
) d
WHERE f.ctid = d.ctid;


-- overall average annual_income_usd
select
round(avg(annual_income_usd):: numeric,2) as avg_global_income
from freelancer_earning;

-- Which 5 job categories have the highest average hourly_rate_usd
SELECT
category,
round(avg(hourly_rate_usd):: numeric,2) as avg_hourly_rate_usd
from freelancer_earning
group by category
order by avg_hourly_rate_usd DESC
limit 5;

-- For each primary_platform, how many freelancers are there and what is their total annual_income_usd
SELECT
primary_platform,
count(*) as freelancer_count,
sum(annual_income_usd) as total_income
from freelancer_earning
group by 1;

-- What is the average annual_income_usd for each experience_level?
select
experience_level,
avg(annual_income_usd) as avg_income
from freelancer_earning
group by experience_level;

-- List the region and the count of freelancers, but only for regions with more than 20 freelancers.
SELECT
region,
count(*) as freelancer_count
from freelancer_earning
group by region
having count(*) > 20
order by freelancer_count desc;

-- Find all freelancers with an experience_level of 'junior' who earn more than the global average income.
SELECT
freelancer_id, category, annual_income_usd
from freelancer_earning
WHERE experience_level IN ('Junior') 
AND annual_income_usd > (SELECT AVG(annual_income_usd) FROM freelancer_earning);

-- Which 3 countries have the highest average years_experience
SELECT country, 
ROUND(AVG(years_experience)::numeric, 1) AS avg_years
FROM freelancer_earning
GROUP BY country
ORDER BY avg_years DESC
LIMIT 3;

-- Calculate the average annual_income_usd grouped by education. Does a higher degree correlate with higher pay
SELECT education, ROUND(AVG(annual_income_usd)::numeric, 0) AS avg_income
FROM freelancer_earning
GROUP BY education
ORDER BY avg_income DESC;

-- On 'Upwork', what are the Min, Max, and Average hourly_rate_usd
SELECT MIN(hourly_rate_usd) as min_rate, 
MAX(hourly_rate_usd) as max_rate, 
AVG(hourly_rate_usd) as avg_rate
FROM freelancer_earning
WHERE primary_platform = 'Upwork';

-- Count how many freelancers earn between $60,000 and $120,000 annually.
SELECT COUNT(*) AS middle_class_count
FROM freelancer_earning
WHERE annual_income_usd BETWEEN 60000 AND 120000;

-- Calculate the average annual_income_usd for freelancers with exactly 5, 10, and 15 years of experience.
SELECT years_experience, AVG(annual_income_usd)
FROM freelancer_earning
WHERE years_experience IN (5, 10, 15)
GROUP BY years_experience;

-- Which education level is most common in each region
SELECT region, education, COUNT(*) 
FROM freelancer_earning
GROUP BY region, education
ORDER BY region, COUNT(*) DESC;

-- Find categories where the average years_experience is less than 5, but the average annual_income_usd is over $80,000.
SELECT category,avg(years_experience),avg(annual_income_usd)
from freelancer_earning
group by category
having avg(years_experience)> 5 AND AVG(annual_income_usd) > 80000;

-- Find the top 10 freelancers where the ratio of annual_income_usd to hourly_rate_usd is the highest.
SELECT 
    freelancer_id, 
    category,
    (annual_income_usd / hourly_rate_usd) AS income_to_rate_ratio
FROM freelancer_earning
WHERE hourly_rate_usd > 0 
ORDER BY income_to_rate_ratio DESC
LIMIT 10;

-- In every country, who are the 3 people making the most money
with t as(
     select 
	 freelancer_id,
	 country,
	 category,
	 annual_income_usd,
	 dense_rank() over(partition by country order by annual_income_usd desc) as rn
	 from freelancer_earning
)
select * from t
where rn <= 3;

-- For each platform (Upwork, Fiverr, etc.), find the freelancer with the most years of experience.
SELECT DISTINCT ON (primary_platform)
    primary_platform, 
    freelancer_id, 
    years_experience
FROM freelancer_earning
ORDER BY primary_platform, years_experience DESC;

-- Compare each freelancer's pay to their peers. Who is earning "above market" for their specific job
with categoryaverage as(
     select
	 category,
	 avg(annual_income_usd) as avg_income
	 from freelancer_earning
	 group by category
)
select f.freelancer_id,f.category,f.annual_income_usd,round(c.avg_income :: numeric ,2) as market_avg
from freelancer_earning f
join categoryaverage c on f.category = c.category
where f.annual_income_usd > c.avg_income;

-- How much does one person's income matter to the regional total?
SELECT 
    freelancer_id, 
    region, 
    annual_income_usd,
    ROUND(((annual_income_usd / SUM(annual_income_usd) OVER (PARTITION BY region)) * 100)::numeric, 2) || '%' as pct_of_region
FROM freelancer_earning
WHERE annual_income_usd > 0;

-- Identify which job category has the widest gap between the lowest and highest earner.
SELECT 
    category, 
    MAX(annual_income_usd) - MIN(annual_income_usd) AS income_spread,
    MIN(annual_income_usd) AS lowest_earner,
    MAX(annual_income_usd) AS highest_earner
FROM freelancer_earning
WHERE annual_income_usd > 0
GROUP BY category
ORDER BY income_spread DESC;

-- Calculate the 25th, 50th (Median), and 75th percentiles to see the market distribution.
SELECT 
    ROUND(PERCENTILE_CONT(0.25) WITHIN GROUP (ORDER BY hourly_rate_usd)::numeric, 2) AS q1_25th_percentile,
    ROUND(PERCENTILE_CONT(0.50) WITHIN GROUP (ORDER BY hourly_rate_usd)::numeric, 2) AS median_rate,
    ROUND(PERCENTILE_CONT(0.75) WITHIN GROUP (ORDER BY hourly_rate_usd)::numeric, 2) AS q3_75th_percentile
FROM freelancer_earning
WHERE hourly_rate_usd > 0;

-- Find countries that act as "hubs" for high earners (more than 5 freelancers making > $150k).
SELECT country, COUNT(*) AS high_earner_count
FROM freelancer_earning
WHERE annual_income_usd > 150000
GROUP BY country
HAVING COUNT(*) > 5
ORDER BY high_earner_count DESC;

-- Group experience into 5-year chunks to see when pay peaks.
select
   case 
     when years_experience between 0 and 5 then '0-5 years'
	 when years_experience between 6 and 10 then '6-10 years'
	 when years_experience between 10 and 15 then '10-15 years'
	 else '15+ years'
    end as experience_brancket,
  round(avg(annual_income_usd):: numeric,0) as avg_income
 from freelancer_earning
 group by 1
 order by 1;

-- Which region has the widest variety of job categories?
SELECT
region,
count(distinct category) as unique_jobs
from freelancer_earning
group by 1
order by 2 desc;

-- Which platforms attract senior talent vs. juniors
select 
primary_platform,
experience_level,
count(*) as head_count
from freelancer_earning
group by 1,2
order by 1,3;

-- Isolate the top 5% of earners in the whole database
select freelancer_id, annual_income_usd,category
from ( 
     select freelancer_id, annual_income_usd,category,
	 percent_rank() over(order by annual_income_usd) as p_rank
	 from freelancer_earning)t
where p_rank >= 0.95
order by annual_income_usd desc;

