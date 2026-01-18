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

-- b] Right Anti Join - return rows from right that has no match in left

-- ex.customer that havent placed any order

select *
from customers as c
left join orders as o
on c.id = o.customer_id 
where c.id is NOT NULL;

-- c} cross join
-- everything in A is connected to everything in B 
select *
from customers 
cross join orders;