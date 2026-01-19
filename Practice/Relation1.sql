
postgres=# \l
                                                            List of databases
   Name    |  Owner   | Encoding | Locale Provider |      Collate       |       Ctype        | Locale | ICU Rules |   Access privileges
-----------+----------+----------+-----------------+--------------------+--------------------+--------+-----------+-----------------------
 advjavadb | postgres | UTF8     | libc            | English_India.1252 | English_India.1252 |        |           |
 mydb      | postgres | UTF8     | libc            | English_India.1252 | English_India.1252 |        |           |
 postgres  | postgres | UTF8     | libc            | English_India.1252 | English_India.1252 |        |           |
 tcadb     | postgres | UTF8     | libc            | English_India.1252 | English_India.1252 |        |           |
 template0 | postgres | UTF8     | libc            | English_India.1252 | English_India.1252 |        |           | =c/postgres          +
           |          |          |                 |                    |                    |        |           | postgres=CTc/postgres
 template1 | postgres | UTF8     | libc            | English_India.1252 | English_India.1252 |        |           | =c/postgres          +
           |          |          |                 |                    |                    |        |           | postgres=CTc/postgres
(6 rows)


postgres=# \c tcadb;
You are now connected to database "tcadb" as user "postgres".
tcadb=# \d
           List of relations
 Schema |  Name   |   Type   |  Owner
--------+---------+----------+----------
 public | student | table    | postgres
 public | tcaseq  | sequence | postgres
(2 rows)


tcadb=# create table Stud ( rno int primary key , name varchar(20) , per double , city varchar(10));
ERROR:  type "double" does not exist
LINE 1: ...ud ( rno int primary key , name varchar(20) , per double , c...
                                                             ^
tcadb=# create table Stud ( rno int primary key , name varchar(20) , per float , city varchar(10));
CREATE TABLE
tcadb=# create table faculty( tno int primary key , name varchar(20), salary float , city varchar(10));
CREATE TABLE
tcadb=# create table Stud_faculty (rno int references stud(rno) on delete cascade on update cascade,tno int references faculty(tno) on delete cascade on update cascade, ldate date);
CREATE TABLE
tcadb=# insert into student values(1,'AAA',60,'Pune'),(2,'BBB',80,'Gondia'),(3,'CCC',70,'Delhi'),(4,'DDD',90,'Pune');
ERROR:  invalid input syntax for type double precision: "Pune"
LINE 1: insert into student values(1,'AAA',60,'Pune'),(2,'BBB',80,'G...
                                              ^
tcadb=# insert into stud values(1,'AAA',60,'Pune'),(2,'BBB',80,'Gondia'),(3,'CCC',70,'Delhi'),(4,'DDD',90,'Pune');
INSERT 0 4
tcadb=# insert into faculty values(101,'Anurag',60000,'Pune'),(102,'Bajaj',75000,'Gondia'),(103,'Mayur',58000,'Delhi'),(104,'Dnyanesh',92000,'Pune');
INSERT 0 4
tcadb=# insert into stud_faculty values(1,101,'2025-08-21'),(1,103,'2025-08-25'),(2,104,'2025-08-21'),(3,102,'2025-08-20'),(2,101,'2025-08-17');
INSERT 0 5
tcadb=# select * from stud;
 rno | name | per |  city
-----+------+-----+--------
   1 | AAA  |  60 | Pune
   2 | BBB  |  80 | Gondia
   3 | CCC  |  70 | Delhi
   4 | DDD  |  90 | Pune
(4 rows)


tcadb=# select * from faculty;
 tno |   name   | salary |  city
-----+----------+--------+--------
 101 | Anurag   |  60000 | Pune
 102 | Bajaj    |  75000 | Gondia
 103 | Mayur    |  58000 | Delhi
 104 | Dnyanesh |  92000 | Pune
(4 rows)


tcadb=# select * from stud_faculty;
 rno | tno |   ldate
-----+-----+------------
   1 | 101 | 2025-08-21
   1 | 103 | 2025-08-25
   2 | 104 | 2025-08-21
   3 | 102 | 2025-08-20
   2 | 101 | 2025-08-17
(5 rows)


tcadb=# update stud set rno=7 where rno=2;
UPDATE 1
tcadb=# select * from stud_faculty;
 rno | tno |   ldate
-----+-----+------------
   1 | 101 | 2025-08-21
   1 | 103 | 2025-08-25
   3 | 102 | 2025-08-20
   7 | 104 | 2025-08-21
   7 | 101 | 2025-08-17
(5 rows)


tcadb=# select * from stud;
 rno | name | per |  city
-----+------+-----+--------
   1 | AAA  |  60 | Pune
   3 | CCC  |  70 | Delhi
   4 | DDD  |  90 | Pune
   7 | BBB  |  80 | Gondia
(4 rows)


tcadb=# delete from stud where rno=7;
DELETE 1
tcadb=# select * from stud_faculty;
 rno | tno |   ldate
-----+-----+------------
   1 | 101 | 2025-08-21
   1 | 103 | 2025-08-25
   3 | 102 | 2025-08-20
(3 rows)


tcadb=# select * from stud;
 rno | name | per | city
-----+------+-----+-------
   1 | AAA  |  60 | Pune
   3 | CCC  |  70 | Delhi
   4 | DDD  |  90 | Pune
(3 rows)


tcadb=# select count(*) from stud , faculty where stud.city='Pune';
 count
-------
     8
(1 row)


tcadb=# select * from faculty;
 tno |   name   | salary |  city
-----+----------+--------+--------
 101 | Anurag   |  60000 | Pune
 102 | Bajaj    |  75000 | Gondia
 103 | Mayur    |  58000 | Delhi
 104 | Dnyanesh |  92000 | Pune
(4 rows)


tcadb=# select (select count(*) from stud where city='Pune')+(select count(*) from faculty where city='Pune') as count_of_pune_people;
 count_of_pune_people
----------------------
                    4
(1 row)


tcadb=# select * from stud, faculty;
 rno | name | per | city  | tno |   name   | salary |  city
-----+------+-----+-------+-----+----------+--------+--------
   1 | AAA  |  60 | Pune  | 101 | Anurag   |  60000 | Pune
   1 | AAA  |  60 | Pune  | 102 | Bajaj    |  75000 | Gondia
   1 | AAA  |  60 | Pune  | 103 | Mayur    |  58000 | Delhi
   1 | AAA  |  60 | Pune  | 104 | Dnyanesh |  92000 | Pune
   3 | CCC  |  70 | Delhi | 101 | Anurag   |  60000 | Pune
   3 | CCC  |  70 | Delhi | 102 | Bajaj    |  75000 | Gondia
   3 | CCC  |  70 | Delhi | 103 | Mayur    |  58000 | Delhi
   3 | CCC  |  70 | Delhi | 104 | Dnyanesh |  92000 | Pune
   4 | DDD  |  90 | Pune  | 101 | Anurag   |  60000 | Pune
   4 | DDD  |  90 | Pune  | 102 | Bajaj    |  75000 | Gondia
   4 | DDD  |  90 | Pune  | 103 | Mayur    |  58000 | Delhi
   4 | DDD  |  90 | Pune  | 104 | Dnyanesh |  92000 | Pune
(12 rows)


tcadb=# select count(*) from stud , faculty where stud.city='Pune';
 count
-------
     8
(1 row)

