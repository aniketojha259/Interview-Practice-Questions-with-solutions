-- select * from artist;
-- select * from canvas_size;
-- select * from image_link;
-- select * from museum;
-- select * from museum_hours;
-- select * from product_size;
-- select * from subject;
-- select * from work;
-- 1. Fetch all the paintings which are not displayed on any museums
-- 2. Are there museums without any paintings?
-- select m.* from museum m
-- left join work w
-- on m.museum_id = w.museum_id
-- where work_id is null

-- 3. How many paintings have an asking price of more than their regular price?
-- select count(*) as total
-- from product_size
-- WHERE sale_price > regular_price;

-- 4. Identify the paintings whose asking price is less than 50% of its regular price
-- select * from product_size
-- where sale_price < (select  round(avg(regular_price)*0.5,2) from product_size)

-- 5. Which canva size costs the most?
-- SELECT c.size_id, MAX(p.sale_price) AS size_cost
-- FROM canvas_size c
-- JOIN product_size p ON c.size_id = p.size_id
-- GROUP BY c.size_id
-- ORDER BY size_cost DESC
-- limit 1;

-- 6. Delete duplicate records from work, product_size, subject and image_link tables
-- delete from work
-- where work_id not in (
-- select min(work_id) from work
-- group by work_id
-- )

-- 7. Identify the museums with invalid city information in the given dataset
-- SELECT COUNT(city)
-- FROM museum
-- WHERE city NOT REGEXP '^[a-zA-Z]+$';

-- 8. Museum_Hours table has 1 invalid entry. Identify it and remove it.


-- 9. Fetch the top 10 most famous painting subject
-- select distinct subject, count(*)
-- from subject s
-- join work w on s.work_id=w.work_id
-- group by subject
-- order by count(*) desc
-- limit 10;

-- 10. Identify the museums which are open on both Sunday and Monday. Display museum name, city
-- SELECT m.name, m.city
-- FROM museum m
-- JOIN museum_hours mh ON m.museum_id = mh.museum_id
-- WHERE mh.day IN ('Sunday', 'Monday')
-- AND m.city REGEXP '^[a-zA-Z]+$';

-- 11. How many museums are open every single day?
-- select count(*) as open from (
-- select museum_id from museum_hours
-- group by museum_id
-- having count(day)=7) a

-- 12. Which are the top 5 most popular museum? (Popularity is defined based on most no of paintings in a museum

-- SELECT m.name, COUNT(w.work_id) AS cn 
-- FROM work w
-- JOIN museum m ON w.museum_id = m.museum_id
-- GROUP BY m.name
-- ORDER BY cn DESC
-- LIMIT 5;

-- 13. Who are the top 5 most popular artist? (Popularity is defined based on most no of paintings done by an artist)
-- select  full_name, count(work_id) as cn from artist a
-- join work w
-- on a.artist_id = w.artist_id
-- group by  full_name
-- order by cn desc
-- limit 5

-- 14. Display the 3 least popular canva sizes
-- select size_id, count(work_id) as ls from product_size
-- group by size_id
-- order by ls 
-- limit 3

-- 15) Which museum is open for the longest during a day. Dispay museum name, state and hours open and which day?
-- select mh.museum_id, m.name, m.state, day, hour(timediff(open,close)) as td from museum_hours mh
-- join museum m
-- on mh.museum_id = m.museum_id
-- group by museum_id, day, td, m.name, m.state
-- order by td desc

-- 16. A Which museum has the most no of most popular painting style?*/
select m.name, w.style, count(*) as no_of_paint
from museum m
JOIN work w
on m.museum_id = w.museum_id
group by m.name, w.style
order by count(*) desc
limit 1;

-- 18. Display the country and the city with most no of museums. Output 2 seperate columns to mention the city and country. If there are multiple value, seperate them with comma. 
