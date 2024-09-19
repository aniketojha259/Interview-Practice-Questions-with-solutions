-- Retrieve the total number of orders placed.
-- -> select count(*) from orders

-- Calculate the total revenue generated from pizza sales.
-- ->with cte as (select pizza_id, avg(price) as avgs from  pizzas
-- group by pizza_id)
-- select sum(quanity*avgs) as revenue from order_details od
-- join cte c
-- on od.pizza_id = c.pizza_id

-- Identify the highest-priced pizza.
-- select p.price as ms, pt.name from pizzas p
-- join pizza_types pt
-- on p.pizza_type_id = pt.pizza_type_id
-- order by ms desc
-- limit 1

-- Identify the most common pizza size ordered.
-- select count(*) as mp, p.size from pizzas p
-- join order_details od
-- on p.pizza_id = od.pizza_id
-- group by p.size
-- order by mp desc
-- limit 1

-- List the top 5 most ordered pizza types along with their quantities.
-- SELECT pt.name AS pizza_type, SUM(od.quanity) AS total_quantity
-- FROM order_details od
-- JOIN pizzas p ON od.pizza_id = p.pizza_id
-- JOIN pizza_types pt ON p.pizza_type_id = pt.pizza_type_id
-- GROUP BY pt.name
-- ORDER BY total_quantity DESC
-- LIMIT 5; 



