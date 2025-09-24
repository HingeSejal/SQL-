-- SET - we join data one after another like stack
-- JOIN - we combine data/cols horizontaly

-- 1] Basic JOIN
-- no join - nothing is common
-- inner join - common in both A and B
-- full join  - both A nd B 
-- left join  - left col + B's common part
-- right join - right col + A's common part


-- inner join - returns only matching rows from both tables
SELECT 
    c.id, 
    c.first_name,
    o.customer_id,
    o.sales
FROM customers AS c
INNER JOIN orders AS o
    ON c.id = o.customer_id
WHERE c.id = 3;

