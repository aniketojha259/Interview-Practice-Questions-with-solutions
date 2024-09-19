-- use exceldata;
-- Swiggy Case Study-

-- 1. Find customers who have never ordered
-- 2. Average Price/dish
-- 3. Find the top restaurant in terms of the number of orders for a given month
-- 4. restaurants with monthly sales greater than x for 
-- 5. Show all orders with order details for a particular customer in a particular date range
-- 6. Find restaurants with max repeated customers 
-- 7. Month over month revenue growth of swiggy
-- 8. Customer - favorite food

-- Homework
-- Find the most loyal customers for all restaurant
-- Month over month revenue growth of a restaurant
-- Most Paired Products

-- use exceldata;
-- -- -- 1. Find customers who have never ordered
-- -- -- select name from users
-- -- -- where user_id not in ( select user_id from orders)

-- -- --  2. Average Price/dish
-- -- -- select * from menu;
-- -- -- select * from food;
-- -- -- select f.f_name, m.f_id, round(avg(m.price),2) as average
-- -- -- from menu m
-- -- -- join food f
-- -- -- on m.f_id = f.f_id
-- -- -- group by m.f_id, f.f_name

-- -- --  3. Find the top restaurant in terms of the number of orders for a given month
-- -- -- select * from restaurants;
-- -- -- select * from orders;
-- -- -- select r.r_id, r.r_name, count(o.r_id) as no_of_orders from restaurants r
-- -- -- join orders o
-- -- -- on r.r_id = o.r_id
-- -- -- where month(date) = 6
-- -- -- group by r.r_name, r.r_id
-- -- -- order by no_of_orders desc
-- -- -- limit 1

-- -- --  4. restaurants with monthly sales greater than x for wht, where month is 6 and x = 500
-- -- -- with cte as (select r_id, sum(amount) as revenue from orders
-- -- -- where month(date) = 6
-- -- -- group by r_id)
-- -- -- select distinct c.r_id, r.r_name, revenue from cte c 
-- -- -- join restaurants r
-- -- -- on c.r_id = r.r_id
-- -- -- where c.revenue>500


-- -- -- 5. Show all orders with order details for a particular customer in a particular date range. user name = 'Ankit' date range 15-05 to 15-06


-- -- -- with cte as (select * from orders where user_id =(select user_id from users
-- -- -- where user_id = 4)
-- -- -- and (date > '2022-06-10' and date < '2022-07-10'))
-- -- -- select c.*, r.r_name, f.f_name from cte c
-- -- -- join restaurants r
-- -- -- on c.r_id = r.r_id
-- -- -- join menu m
-- -- -- on r.r_id = m.r_id
-- -- -- join food f
-- -- -- on m.f_id = f.f_id

-- -- -- 6. Find restaurants with max repeated customers 
-- -- -- WITH repeated_customers AS (
-- -- --     SELECT r_id, user_id, COUNT(*) AS order_count
-- -- --     FROM orders
-- -- --     GROUP BY r_id, user_id
-- -- --     HAVING COUNT(*) > 1
-- -- -- )
-- -- -- SELECT r.r_id, r.r_name, COUNT(rc.user_id) AS repeated_customers_count
-- -- -- FROM repeated_customers rc
-- -- -- JOIN restaurants r ON rc.r_id = r.r_id
-- -- -- GROUP BY r.r_id, r.r_name
-- -- -- ORDER BY repeated_customers_count DESC
-- -- -- LIMIT 1;

-- -- 7. Month over month revenue growth of swiggy
-- -- select months, ((revenue-prev)/prev)*100 from (
-- -- with cte as (select monthname(date) as 'Months', sum(amount) as 'revenue'
-- -- from orders
-- -- group by Months
-- -- order by revenue
-- -- )
-- -- select Months, revenue, lag(revenue,1) over(order by revenue) as prev from cte) t

-- -- 8. Customer - favorite food
-- with temp as (select o.user_id, od.f_id,  count(*) as frequency from orders o
-- join order_details od
-- on o.order_id = od.order_id
-- group by user_id,f_id
-- ),
-- ranked AS (
--     SELECT *,
--         DENSE_RANK() OVER (PARTITION BY user_id ORDER BY frequency DESC) AS ranks
--     FROM temp
-- )
-- SELECT 
--     user_id, 
--     f_id, 
--     frequency
-- FROM ranked
-- WHERE ranks = 1;

