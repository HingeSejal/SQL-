create  table teacher(tno int primary key , name varchar(20) , salary float, city varchar(10));
CREATE TABLE
mydb=# create  table student(rno int primary key , name varchar(20) , per float, city varchar(10), tno int references teacher(tno) on delete cascade on update cascade , ldate date);
CREATE TABLE
mydb=# insert into faculty values(101,'Anurag',60000,'Pune'),(102,'Bajaj',75000,'Gondia'),(103,'Mayur',58000,'Delhi'),(104,'Dnyanesh',92000,'Pune');
ERROR:  relation "faculty" does not exist
LINE 1: insert into faculty values(101,'Anurag',60000,'Pune'),(102,'...
                    ^
mydb=# insert into teacher values(101,'Anurag',60000,'Pune'),(102,'Pravar',75000,'Gondia'),(103,'Vedha',58000,'Delhi'),(104,'Dheera',92000,'Pune');
INSERT 0 4
mydb=# insert into student values(101,'Arun',90,'Pune',104,'2026-01-22');
INSERT 0 1
mydb=# insert into student values(102,'Meghana',85,'Delhi',102,'2026-01-23');
INSERT 0 1
mydb=# insert into student values(103,'Viraj',70,'Rahur',101,'2026-01-23');
INSERT 0 1
mydb=# insert into student values(104,'Mahi',87,'Pune',102,'2026-01-11');
INSERT 0 1
mydb=# select * from student;
 rno |  name   | per | city  | tno |   ldate
-----+---------+-----+-------+-----+------------
 101 | Arun    |  90 | Pune  | 104 | 2026-01-22
 102 | Meghana |  85 | Delhi | 102 | 2026-01-23
 103 | Viraj   |  70 | Rahur | 101 | 2026-01-23
 104 | Mahi    |  87 | Pune  | 102 | 2026-01-11
(4 rows)


mydb=# select * from teacher;
 tno |  name  | salary |  city
-----+--------+--------+--------
 101 | Anurag |  60000 | Pune
 102 | Pravar |  75000 | Gondia
 103 | Vedha  |  58000 | Delhi
 104 | Dheera |  92000 | Pune
(4 rows)


mydb=# select * from student , teacher where student.tno = teacher.tno ;
 rno |  name   | per | city  | tno |   ldate    | tno |  name  | salary |  city
-----+---------+-----+-------+-----+------------+-----+--------+--------+--------
 101 | Arun    |  90 | Pune  | 104 | 2026-01-22 | 104 | Dheera |  92000 | Pune
 102 | Meghana |  85 | Delhi | 102 | 2026-01-23 | 102 | Pravar |  75000 | Gondia
 103 | Viraj   |  70 | Rahur | 101 | 2026-01-23 | 101 | Anurag |  60000 | Pune
 104 | Mahi    |  87 | Pune  | 102 | 2026-01-11 | 102 | Pravar |  75000 | Gondia
(4 rows)


mydb=# select * from student join teacher on student.tno = teacher.tno ;
 rno |  name   | per | city  | tno |   ldate    | tno |  name  | salary |  city
-----+---------+-----+-------+-----+------------+-----+--------+--------+--------
 101 | Arun    |  90 | Pune  | 104 | 2026-01-22 | 104 | Dheera |  92000 | Pune
 102 | Meghana |  85 | Delhi | 102 | 2026-01-23 | 102 | Pravar |  75000 | Gondia
 103 | Viraj   |  70 | Rahur | 101 | 2026-01-23 | 101 | Anurag |  60000 | Pune
 104 | Mahi    |  87 | Pune  | 102 | 2026-01-11 | 102 | Pravar |  75000 | Gondia
(4 rows)


select student.name ,teacher.name from student join teacher on student.tno=teacher.tno where teacher.name='Dheera';
                                  ^
mydb=# select student.name Dheera_Student from student join teacher on student.tno=teacher.tno where teacher.name='Dheera';
 dheera_student
----------------
 Arun
(1 row)


mydb=# select student.name ,teacher.name from student join teacher on student.tno=teacher.tno order by teacher.name;
  name   |  name
---------+--------
 Viraj   | Anurag
 Arun    | Dheera
 Meghana | Pravar
 Mahi    | Pravar
(4 rows)