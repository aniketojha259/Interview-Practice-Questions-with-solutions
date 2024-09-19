select * from trips;
select * from users;
-- The cancellation rate is computed by dividing the number of canceled 
-- (by client or driver) requests with unbanned users by the total number of requests with unbanned users on that day.

-- Write a solution to find the cancellation rate of requests with unbanned users (both client and driver must not be banned) each day
-- between "2013-10-01" and "2013-10-03". Round Cancellation Rate to two decimal points.
-- Return the result table in any order.
WITH cte AS (
    SELECT 
        request_at, 
        SUM(CASE WHEN status IN ('cancelled_by_driver', 'cancelled_by_client') THEN 1 ELSE 0 END) AS num_of_cancelled, 
        COUNT(*) AS total_num_request
    FROM 
        Trips t
    INNER JOIN 
        Users uc ON t.client_id = uc.users_id AND uc.banned = 'No'
    INNER JOIN 
        Users ud ON t.driver_id = ud.users_id AND ud.banned = 'No'
    WHERE 
        request_at BETWEEN '2013-10-01' AND '2013-10-03'
    GROUP BY 
        request_at
)
SELECT 
    request_at AS Day, 
    ROUND((num_of_cancelled / NULLIF(total_num_request, 0)), 2) AS "Cancellation Rate" 
FROM 
    cte;


