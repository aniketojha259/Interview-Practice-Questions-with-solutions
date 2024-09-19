/* User purchase platform.
-- The table logs the spendings history of users that make purchases from an online shopping website which has a desktop 
and a mobile application.
-- Write an SQL query to find the total number of users and the total amount spent using mobile only, desktop only 
and both mobile and desktop together for each date.
*/
with cte as (select spend_date, user_id, max(platform) as mx_plt, sum(amount) as total_amnt from spending
group by spend_date, user_id
having count(distinct platform)=1
union all
select spend_date, user_id,'both' as mx_plt, sum(amount) as total_amnt from spending
group by spend_date, user_id
having count(distinct platform)=2
union all 
select spend_date, null as user_id,'both' as mx_plt, 0 as total_amnt from spending
group by spend_date, user_id
)
select spend_date, mx_plt, sum(total_amnt) as Amount, count(distinct user_id) as no_of_user
from cte
group by  spend_date, mx_plt
order by spend_date, mx_plt desc