tcadb=# create table Tab1(
tcadb(# t1 int primary key,
tcadb(# city varchar(10)
tcadb(# );
CREATE TABLE
tcadb=# create table Tab2(
tcadb(# t2 int primary key,
tcadb(# city varchar(10)
tcadb(# );
CREATE TABLE
tcadb=# insert into tab1 values(1,'pune');
INSERT 0 1
tcadb=# insert into tab1 values(2,'mumbai');
INSERT 0 1
tcadb=# insert into tab1 values(3,'banglore');
INSERT 0 1
tcadb=# insert into tab1 values(4,'delhi');
INSERT 0 1
tcadb=# insert into tab2 values(101,'mumbai');
INSERT 0 1
tcadb=# insert into tab2 values(102,'satara');
INSERT 0 1
tcadb=# insert into tab2 values(103,'pune');
INSERT 0 1
tcadb=# insert into tab2 values(104,'solapur');
INSERT 0 1
tcadb=# select * from tab1;
 t1 |   city
----+----------
  1 | pune
  2 | mumbai
  3 | banglore
  4 | delhi
(4 rows)


tcadb=# select * from tab2;
 t2  |  city
-----+---------
 101 | mumbai
 102 | satara
 103 | pune
 104 | solapur
(4 rows)


tcadb=# select * from tab1 as x join tab2 y on x.city=y.city;
 t1 |  city  | t2  |  city
----+--------+-----+--------
  2 | mumbai | 101 | mumbai
  1 | pune   | 103 | pune
(2 rows)


tcadb=# select * from tab1 as x join tab1 y on x.city=y.city;
 t1 |   city   | t1 |   city
----+----------+----+----------
  3 | banglore |  3 | banglore
  4 | delhi    |  4 | delhi
  2 | mumbai   |  2 | mumbai
  1 | pune     |  1 | pune
(4 rows)


tcadb=# create table employee(
tcadb(# emp_id int primary key,
tcadb(# name varchar(10),
tcadb(# manager_id int references employee(emp_id)
tcadb(# );
CREATE TABLE
tcadb=# insert into employee values(1,'Sejal',NULL);
INSERT 0 1
tcadb=# insert into employee values(2,'Rita',1);
INSERT 0 1
tcadb=# insert into employee values(3,'Rina',1);
INSERT 0 1
tcadb=# insert into employee values(4,'Aisha',2);
INSERT 0 1
tcadb=# insert into employee values(5,'Omkar',2);
INSERT 0 1
tcadb=# insert into employee values(6,'Vishal',3);
INSERT 0 1
tcadb=# insert into employee values(7,'Anuj',5);
INSERT 0 1
tcadb=# insert into employee values(8,'LOk',54);
ERROR:  insert or update on table "employee" violates foreign key constraint "employee_manager_id_fkey"
DETAIL:  Key (manager_id)=(54) is not present in table "employee".
tcadb=# select * from employee;
 emp_id |  name  | manager_id
--------+--------+------------
      1 | Sejal  |
      2 | Rita   |          1
      3 | Rina   |          1
      4 | Aisha  |          2
      5 | Omkar  |          2
      6 | Vishal |          3
      7 | Anuj   |          5
(7 rows)


tcadb=# select E.name as emp_name ,M.name as manager_name from employee as E left join employee as M on E.manager_id=M.emp_id;
 emp_name | manager_name
----------+--------------
 Sejal    |
 Rita     | Sejal
 Rina     | Sejal
 Aisha    | Rita
 Omkar    | Rita
 Vishal   | Rina
 Anuj     | Omkar
(7 rows)


tcadb=# select E.name as emp_name ,M.name as manager_name from employee as E join employee as M on E.manager_id=M.emp_id;
 emp_name | manager_name
----------+--------------
 Rita     | Sejal
 Rina     | Sejal
 Aisha    | Rita
 Omkar    | Rita
 Vishal   | Rina
 Anuj     | Omkar
(6 rows)


tcadb=# select emp_id from employee where name='Sejal
tcadb'# ;
 emp_id
--------
(0 rows)


                        ^
tcadb=# select emp_id , name from employee where manager_id=(select emp_id from employee where name='Sejal');
 emp_id | name
--------+------
      2 | Rita
      3 | Rina
(2 rows)


tcadb=# select * from employee where manager_id=(select emp_id from employee where name='Sejal');
 emp_id | name | manager_id
--------+------+------------
      2 | Rita |          1
      3 | Rina |          1
(2 rows)


tcadb=# select count(*) from employee where manager_id=(select emp_id from employee where name='Sejal');
 count
-------
     2
(1 row)


tcadb=# select * from Employee where manager_id is null;
 emp_id | name  | manager_id
--------+-------+------------
      1 | Sejal |
(1 row)


tcadb=# update employee set manager_id=4 where emp_id=5;
UPDATE 1
tcadb=# select * from employee;
 emp_id |  name  | manager_id
--------+--------+------------
      1 | Sejal  |
      2 | Rita   |          1
      3 | Rina   |          1
      4 | Aisha  |          2
      6 | Vishal |          3
      7 | Anuj   |          5
      5 | Omkar  |          4
(7 rows)