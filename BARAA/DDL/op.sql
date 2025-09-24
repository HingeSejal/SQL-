select * from customers
where country = "USA" ;

select * from customers
where country != "USA"  ;

select * from customers
where country <> "USA" ;

select * from customers
where country="USA" AND score>500 ;

select * from customers
where country="USA" OR score>500 ;

select * from customers
where NOT score>500 ;

select * from customers
where score BETWEEN 500 AND 600 ;

--either germany or usa
select * from customers
where country IN ('GERMANY','USA') ;

--  (%)anything  exact(_)
select * from customers
where first_name LIKE '%n'; -- end with n

select * from customers
where first_name LIKE '%r%' ; -- r present

select * from customers
where first_name LIKE 'r%' ; -- start with r

select * from customers
where first_name LIKE '_r%' ; --second pos r

