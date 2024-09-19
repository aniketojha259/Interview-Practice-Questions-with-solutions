-- Internidiate ---
--  -- Join the necessary tables to find the total quantity of each pizza category ordered.
-- SELECT SUM(od.quanity) AS total_quantity, pt.category
-- FROM order_details od
-- JOIN pizzas p ON od.pizza_id = p.pizza_id
-- JOIN pizza_types pt ON p.pizza_type_id = pt.pizza_type_id
-- GROUP BY pt.category
-- order by total_quantity desc

-- Determine the distribution of orders by hour of the day.
-- select count(order_id), hour(order_time) as hour_of_day from orders
-- group by hour(order_time)

-- Join relevant tables to find the category-wise distribution of pizzas.
-- select category, count(name) from pizza_types
-- group by category

-- Group the orders by date and calculate the average number of pizzas ordered per day.
-- select o.order_date, avg(od.order_id) as avg_or from orders o 
-- join order_details od
-- on o.order_id = od.order_id
-- group by o.order_date

-- Determine the top 3 most ordered pizza types based on revenue.
-- with cte as (select pizza_id, avg(price) as avgs from pizzas
-- group by pizza_id)
-- select count(pt.pizza_type_id) as pizza_type, sum(od.quanity*avgs) as revenues from pizza_types pt
-- join pizzas p
-- on pt.pizza_type_id = p.pizza_type_id
-- join order_details od
-- on p.pizza_id = od.pizza_id
-- join cte c
-- on od.pizza_id = c.pizza_id
-- group by pt.pizza_type_id
-- order by revenues desc
-- limit 3

