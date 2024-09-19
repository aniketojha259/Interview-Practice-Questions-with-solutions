/* Write a SQL query to find the winner in each group.
The winner in each group is the player who scored the max total points within the group. In the case
of a tie, the lowest player_id wins. */
with cte as (select first_player as player_id, first_score as score from matches
union all
select second_player as player_id, second_score as score from matches
), total_score as 
(select p.group_id, c.player_id, sum(score) as TotalScore from cte c
join players p 
on c.player_id = p.player_id
group by player_id)
, answer as (
select t.*, rank() over(partition by group_id order by TotalScore desc) as rnk
from total_score t)
select * from answer
where rnk = 1