-- 2] Advanced JOIN
-- left anti join
-- right anti join
-- full anti join
-- cross join

-- a] Left Anti Join - return rows from left that has no match in right

-- ex.customer that havent placed any order

select *
from customers as c
left join orders as o
on c.id = o.customer_id 
where o.customer_id  is NULL;