with cte as (select * , day(date_value)- row_number() over(partition by state order by date_value) as rnk
from tasks)
select min(date_value) as start_date, max(date_value) as end_date, state
from cte
group by state, rnk



