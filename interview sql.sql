-- Query to delete dublucate record from the employee_info0 table
-- delete e1 from employee_info0 e1, employee_info0 e2
-- where e1.email = e2.email
-- and e1.id>e2.id;

-- Query to retrieve the first four characters of employee name from the employee_info0 table. 
-- select substring(name, 1,4 ) as names from employee_info0;

-- Query find number of employees whose DOB is between 01/06/1995 to 30/06/1998 and are grouped 
-- according to gender.
-- select gender,count(id) from employee_info0
-- where DOB between '1995-06-01' and '1998/06/30'
-- group by gender


-- Query to fetch details of all employee excluding the employees who are "HR" and "Admin"
-- select * from employee_info0
-- where department not in ("HR", "Admin")

-- Query to fetch 50% record from the employee_info table:
-- select * from employee_info0
-- where id <= (
-- select count(id)/2 from employee_info0)

-- Query to display the total salary of each employee after addding 10% increment in the  Salary:
-- select *, ((salary*10/100)+salary) as total_salary from employee_info0

-- Query to fetch the detail of two maxi and two minimum salary
WITH maxi AS (
    SELECT *, DENSE_RANK() OVER (ORDER BY salary DESC) AS max_rank
    FROM employee_info0
),
mini AS (
    SELECT *, DENSE_RANK() OVER (ORDER BY salary ASC) AS min_rank
    FROM employee_info0
)
SELECT * 
FROM employee_info0
WHERE id IN (
    SELECT id FROM maxi WHERE max_rank IN (1, 2)
    UNION
    SELECT id FROM mini WHERE min_rank IN (1, 2)
);


