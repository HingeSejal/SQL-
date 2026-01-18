-- SET - we join data one after another like stack
-- JOIN - we combine data/cols horizontaly

-- 1] Basic JOIN
-- no join - nothing is common
-- inner join - common in both A and B
-- full join  - both A nd B 
-- left join  - left col + B's common part
-- right join - right col + A's common part


-- A] Inner join - returns only matching rows from both tables
-- execution - it start with left side nd start matching the data in the right side
SELECT 
    c.id, 
    c.first_name,
    o.customer_id,
    o.sales
FROM customers AS c
INNER JOIN orders AS o
    ON c.id = o.customer_id
WHERE c.id = 3;

-- B] Left Join - returns all rows from left table and only matching from right table
select c.first_name ,  
       c.id ,
       o.order_id ,
       o.sales
from customers as c
left join orders as o
on c.id = o.customer_id ;

-- C] Right JOIN - all rows from right table  and only matcvhing from left 
select c.first_name ,  
       c.id ,
       o.order_id ,
       o.sales
from customers as c
right join orders as o
on c.id = o.customer_id ;

--THIS IS EXACT SAME AS 

select c.first_name ,  
       c.id ,
       o.order_id ,
       o.sales
from  orders as o
left join customers as c
on c.id = o.customer_id ;

-- D] Full Join - all rows from both table (sequence doesnt matter)

-- ex.getting all customers and all orders even if theres no match
select c.first_name ,  
       c.id ,
       o.order_id ,
       o.sales
from  orders as o
full join customers as c
on c.id = o.customer_id ;

