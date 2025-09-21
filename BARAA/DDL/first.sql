create table persons(
    id int primary key not null auto_increemnt,
    name varchar(50) not null,
    phone varchar(15) ,
    city varchar(50) not null
)

alter table persons 
add email varchar(50) not null
select * from persons 

alter table persons 
drop column phone 
select * from persons 