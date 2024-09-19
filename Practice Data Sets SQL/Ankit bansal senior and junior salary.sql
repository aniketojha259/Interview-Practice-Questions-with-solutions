/* A company wants to hire new employees. The budget of the company for the salaries is $70000.
The Company criteria for hiring are:
Keep hiring the senior with the smallest salary until you cannot hire any more seniors.
Use the remaining budget to hire the junior with the smallest salary.
Keep hiring the junior with the smallest salary until you cannot hire any more juniors.
-- Write an SQL query to find the seniors and juniors hired under the mentioned criteria. *?
*/
with cte as (select *, sum(salary) over(partition by experience order by salary) as sm_salary
 from candidates), senior as (
 select emp_id, experience, salary from cte
where experience = 'Senior' and sm_salary <= 70000
), junior as (
 select emp_id, experience, salary from cte
where experience = 'junior' and sm_salary <=34000)
 select emp_id, experience, salary from senior
 union all
  select emp_id, experience, salary from junior
  order by emp_id