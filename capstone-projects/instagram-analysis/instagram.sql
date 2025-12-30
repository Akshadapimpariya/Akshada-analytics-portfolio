create table instagram(
post_id varchar (50),
upload_date date,
media_type varchar(50),
likes int,
comments int,
shares int,
saves int,
reach int,
impressions int,
caption_length int,
hashtags_count int,
followers_gained int,
traffic_source varchar(50),
engagement_rate	float,
content_category varchar(50)
)

select * from instagram;

-- Count total posts.
select count(*) from instagram;

-- Get unique media types.
select distinct media_type from instagram;

-- Find post with highest likes.
SELECT *
from instagram
order by likes DESC
limit 1;

-- Count posts by media type.
SELECT
media_type,
count(distinct post_id) as post_counts
from instagram
group by 1;

-- Average engagement rate.
select
round(avg(engagement_rate)::"numeric",1) as avg_engagementrate
from instagram;

-- Get posts uploaded in 2025.
select * from instagram
where extract(year from upload_date) = 2025;

-- Total likes.
select 
sum(likes) as total_like
from instagram;

-- Maximum impressions.
select 
max(impressions) as maximum_impression
from instagram;

-- Total likes, comments, shares by media type.
SELECT
media_type,
sum(likes) as total_likes,
sum(comments) as total_comments,
sum(shares) as total_no_shares
from instagram
group by 1;

-- Average followers gained by content category.
select 
content_category,
round(avg(followers_gained),1) as avg_followers_gained
from instagram
group by 1
order by 2 desc;

-- Top 5 posts with highest reach.
SELECT *
from instagram
order by reach DESC
limit 5;

-- Posts with more than 50,000 likes.
select * from instagram
where likes > 50000;

-- Posts with engagement rate between 5 and 10.
select * from instagram
where engagement_rate between 5 and 10;

-- Posts sorted by upload date (newest first).
select * from instagram
order by upload_date desc;

-- Total impressions by traffic source.
SELECT
traffic_source,
sum(impressions) as Total_impressions
from instagram
group by 1;

-- Count posts per hashtag range.
SELECT hashtags_count,
COUNT(*) as post_count
FROM instagram
GROUP BY hashtags_count;

-- Longest caption length.
SELECT
max(caption_length) as Longest_caption
from instagram;
-- using subquery
select * from instagram
where caption_length = (
      SELECT
max(caption_length)
from instagram
);

-- Find minimum reach.
select
min(reach)
from instagram;

-- media type with highest average impressions.
SELECT
media_type,
round(avg(impressions),1) as average_impressions
from instagram
group by 1
order by avg(impressions) desc;

-- Posts where engagement rate is above average.
select * from instagram
where engagement_rate > (select avg(engagement_rate) from instagram);

-- Rank posts by likes (window function).
select 
post_id,
likes,
rank() over(order by likes desc) as like_rank
from instagram;

-- . Dense rank based on impressions.
select 
post_id,
impressions,
dense_rank() over(order by impressions desc) as impressions_rank
from instagram;

-- Compute running total of likes.
SELECT
post_id,
likes,
sum(likes) over(order by upload_date) as total_like_running
from instagram;

-- Categorize posts as high/medium/low engagement.
select post_id,
engagement_rate,
case WHEN engagement_rate > 15 then 'high'
     when engagement_rate >= 7 then 'medium'
	 else 'low'
	 END as engagement_level
from instagram;

-- Posts with maximum likes in each media type (WINDOW).
select * FROM(
    select *,
	   row_number() over(partition by media_type order by likes desc) as rn
	   from instagram
) as t
where rn = 1;

--partition by content category and rank by impressions.
select post_id,content_category,impressions,
   rank() over(partition by content_category order by impressions desc) as cat_rank
from instagram;

-- Show previous post’s impressions
select post_id , impressions,
lag(impressions) over(partition by upload_date) as previous_impressions
from instagram;

-- Show next post’s likes (LEAD)
select post_id, likes,
lead(likes) over(PARTITION by upload_date) as next_like
from instagram;

-- Calculate percentage contribution of each post’s reach.
select post_id,reach,content_category,
round(reach * 100.0/sum(reach) over(partition by content_category) ,2) as percent_reach
from instagram;

-- Find the top 5 posts with the highest engagement using a CTE + RANK()
with top5_post as(
     select
	 post_id,
	 engagement_rate,
	 rank() over(order by engagement_rate desc) as engagement_rank
	 from instagram
)
select * from top5_post
where engagement_rank <=5;

-- Identify the best-performing media type by total interactions (likes+comments+shares+saves) using CTe
with interaction as(
   SELECT
   media_type,
   sum(likes+comments+shares+saves) as total_interaction
   from instagram
   group by media_type
)
select 
media_type,
total_interaction,
rank() over(order by total_interaction desc) as rank_interaction
from interaction;

-- Compare each post’s impressions to the previous post’s impressions (LEAD/LAG)
SELECT
post_id,
impressions,
lag(impressions,1) over(order by upload_date desc) as previous_year,
impressions - lag(impressions,1) over(order by upload_date desc) as diff_impression
from instagram;

-- Find the top post in each content_category (ROW_NUMBER + PARTITION)
with top_post as(
     select *,
	 rank() over(partition by content_category order by impressions desc) as ranked_post
	 from instagram
	 
)

select * from top_post
where ranked_post = 1;

-- Get monthly average engagement using CTE + DATE_TRUNC
with monthly as(
     select
	 date_trunc('month',upload_date) as month,
	 round(avg(engagement_rate)::"numeric",1) as avg_engagement
	 from instagram
	 group by month
)

SELECT
month,
avg_engagement,
lag(avg_engagement) over(order by month) as previous_year,
avg_engagement - lag(avg_engagement) over(order by month)
from monthly;

-- Find posts performing above average impressions using CTE
with avg_imp as(
   select
   round(avg(impressions)::"numeric",1) as overall_impression
   from instagram
)

select 
post_id,
avg_impression
from instagram,avg_imp
where instagram.impressions > avg_imp.overall_impression;

-- Ranking traffic sources by total reach
with a as(
     select
	 traffic_source,
	 sum(reach) as total_reach
	 from instagram
	 group by traffic_source
)

select *,
dense_rank() over(order by total_reach desc) as rt
from a;

-- Find top 3 posts within each media_type using ROW_NUMBER()
with top3 as(
     select
	 post_id,
	 media_type,
	 row_number() over(partition by media_type order by likes desc) as rn
	 from instagram
)

select *
from top3
where rn<=3;

-- Percentage contribution of each post to total impressions
select
post_id,
impressions,
round(impressions*100/sum(impressions)over() ::"numeric",2) as percent_impressions
from instagram;

