/* there is a Phonelog table that has information about callers, call history.
Write a SQL to find out callers whose first and last call was to the same person on a
given day */
with cte as (select callerid, cast(datecalled as date) as called_date, min(datecalled) as first_called, max(datecalled) as last_called from phonelog 
group by callerid, cast(datecalled as date)) 
select c.*, p1.Recipientid from cte c
join phonelog p1
on c.callerid = p1.callerid and c.first_called = p1.Datecalled
join phonelog p2
on c.callerid = p2.callerid and c.last_called = p2.Datecalled
where p1.Recipientid = p2.Recipientid

