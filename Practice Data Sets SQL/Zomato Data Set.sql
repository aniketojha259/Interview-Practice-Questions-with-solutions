-- what is the total amount each customer spend on zomato
-- select sum(p.price), s.userid from product p
-- join sales s
-- on p.product_id = s.product_id
-- group by s.userid

-- how many days has each customer visited zomato
-- select * from product;
-- select * from sales;
-- select * from users;
-- select * from goldusers_signup;
-- select userid, count(distinct created_date) as cr from sales
-- group by userid

-- what was the first product purchased by each customer
-- select distinct s.userid, created_date, p.product_name
-- from sales s
-- join product p
-- on s.product_id = p.product_id
-- where (userid , created_date) in 
-- (select userid , min(created_date)
-- from sales
-- group by userid) 

-- what is the most purchased item on the menu and how many time was it purchase by the customer
-- select userid, max(product_id) as purchase_id, count(product_id) as total_count
-- from sales
-- group by userid
-- order by userid

-- which item was the most popular for each customer?
-- select * from (
-- select *, rank() over( partition by userid order by cnt desc) rnk from(
-- select userid , product_id, count(product_id) as cnt from sales
-- group by userid, product_id
-- )a)b
-- where rnk = 1




--  

