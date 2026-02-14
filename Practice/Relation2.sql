tcadb=# select * from stud;
 rno | name | per | city
-----+------+-----+-------
   1 | AAA  |  60 | Pune
   3 | CCC  |  70 | Delhi
   4 | DDD  |  90 | Pune
(3 rows)


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
   3 | 102 | 2025-08-20
(3 rows)


tcadb=# select * from stud,faculty;
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


tcadb=# select * from stud,faculty,stud_faculty;
 rno | name | per | city  | tno |   name   | salary |  city  | rno | tno |   ldate
-----+------+-----+-------+-----+----------+--------+--------+-----+-----+------------
   1 | AAA  |  60 | Pune  | 101 | Anurag   |  60000 | Pune   |   1 | 101 | 2025-08-21
   1 | AAA  |  60 | Pune  | 101 | Anurag   |  60000 | Pune   |   1 | 103 | 2025-08-25
   1 | AAA  |  60 | Pune  | 101 | Anurag   |  60000 | Pune   |   3 | 102 | 2025-08-20
   1 | AAA  |  60 | Pune  | 102 | Bajaj    |  75000 | Gondia |   1 | 101 | 2025-08-21
   1 | AAA  |  60 | Pune  | 102 | Bajaj    |  75000 | Gondia |   1 | 103 | 2025-08-25
   1 | AAA  |  60 | Pune  | 102 | Bajaj    |  75000 | Gondia |   3 | 102 | 2025-08-20
   1 | AAA  |  60 | Pune  | 103 | Mayur    |  58000 | Delhi  |   1 | 101 | 2025-08-21
   1 | AAA  |  60 | Pune  | 103 | Mayur    |  58000 | Delhi  |   1 | 103 | 2025-08-25
   1 | AAA  |  60 | Pune  | 103 | Mayur    |  58000 | Delhi  |   3 | 102 | 2025-08-20
   1 | AAA  |  60 | Pune  | 104 | Dnyanesh |  92000 | Pune   |   1 | 101 | 2025-08-21
   1 | AAA  |  60 | Pune  | 104 | Dnyanesh |  92000 | Pune   |   1 | 103 | 2025-08-25
   1 | AAA  |  60 | Pune  | 104 | Dnyanesh |  92000 | Pune   |   3 | 102 | 2025-08-20
   3 | CCC  |  70 | Delhi | 101 | Anurag   |  60000 | Pune   |   1 | 101 | 2025-08-21
   3 | CCC  |  70 | Delhi | 101 | Anurag   |  60000 | Pune   |   1 | 103 | 2025-08-25
   3 | CCC  |  70 | Delhi | 101 | Anurag   |  60000 | Pune   |   3 | 102 | 2025-08-20
   3 | CCC  |  70 | Delhi | 102 | Bajaj    |  75000 | Gondia |   1 | 101 | 2025-08-21
   3 | CCC  |  70 | Delhi | 102 | Bajaj    |  75000 | Gondia |   1 | 103 | 2025-08-25
   3 | CCC  |  70 | Delhi | 102 | Bajaj    |  75000 | Gondia |   3 | 102 | 2025-08-20
   3 | CCC  |  70 | Delhi | 103 | Mayur    |  58000 | Delhi  |   1 | 101 | 2025-08-21
   3 | CCC  |  70 | Delhi | 103 | Mayur    |  58000 | Delhi  |   1 | 103 | 2025-08-25
   3 | CCC  |  70 | Delhi | 103 | Mayur    |  58000 | Delhi  |   3 | 102 | 2025-08-20
   3 | CCC  |  70 | Delhi | 104 | Dnyanesh |  92000 | Pune   |   1 | 101 | 2025-08-21
   3 | CCC  |  70 | Delhi | 104 | Dnyanesh |  92000 | Pune   |   1 | 103 | 2025-08-25
   3 | CCC  |  70 | Delhi | 104 | Dnyanesh |  92000 | Pune   |   3 | 102 | 2025-08-20
   4 | DDD  |  90 | Pune  | 101 | Anurag   |  60000 | Pune   |   1 | 101 | 2025-08-21
   4 | DDD  |  90 | Pune  | 101 | Anurag   |  60000 | Pune   |   1 | 103 | 2025-08-25
   4 | DDD  |  90 | Pune  | 101 | Anurag   |  60000 | Pune   |   3 | 102 | 2025-08-20
   4 | DDD  |  90 | Pune  | 102 | Bajaj    |  75000 | Gondia |   1 | 101 | 2025-08-21
   4 | DDD  |  90 | Pune  | 102 | Bajaj    |  75000 | Gondia |   1 | 103 | 2025-08-25
   4 | DDD  |  90 | Pune  | 102 | Bajaj    |  75000 | Gondia |   3 | 102 | 2025-08-20
   4 | DDD  |  90 | Pune  | 103 | Mayur    |  58000 | Delhi  |   1 | 101 | 2025-08-21
   4 | DDD  |  90 | Pune  | 103 | Mayur    |  58000 | Delhi  |   1 | 103 | 2025-08-25
   4 | DDD  |  90 | Pune  | 103 | Mayur    |  58000 | Delhi  |   3 | 102 | 2025-08-20
   4 | DDD  |  90 | Pune  | 104 | Dnyanesh |  92000 | Pune   |   1 | 101 | 2025-08-21
   4 | DDD  |  90 | Pune  | 104 | Dnyanesh |  92000 | Pune   |   1 | 103 | 2025-08-25
   4 | DDD  |  90 | Pune  | 104 | Dnyanesh |  92000 | Pune   |   3 | 102 | 2025-08-20
(36 rows)


tcadb=#
tcadb=#
tcadb=# select * from stud,faculty,stud_faculty where stud.rno = stud_faculty.rno AND faculty.tno = stud_faculty.tno;
 rno | name | per | city  | tno |  name  | salary |  city  | rno | tno |   ldate
-----+------+-----+-------+-----+--------+--------+--------+-----+-----+------------
   1 | AAA  |  60 | Pune  | 101 | Anurag |  60000 | Pune   |   1 | 101 | 2025-08-21
   1 | AAA  |  60 | Pune  | 103 | Mayur  |  58000 | Delhi  |   1 | 103 | 2025-08-25
   3 | CCC  |  70 | Delhi | 102 | Bajaj  |  75000 | Gondia |   3 | 102 | 2025-08-20
(3 rows)


tcadb=# select stud.name stud_name, faculty.name faculty_name, ldate from stud,faculty,stud_faculty where stud.rno = stud_faculty.rno AND faculty.tno = stud_faculty.tno;
 stud_name | faculty_name |   ldate
-----------+--------------+------------
 AAA       | Anurag       | 2025-08-21
 AAA       | Mayur        | 2025-08-25
 CCC       | Bajaj        | 2025-08-20
(3 rows)


                                                             ^
tcadb=# select stud.name stud_name, faculty.name faculty_name, ldate from stud,faculty,stud_faculty where stud.rno = stud_faculty.rno AND faculty.tno = stud_faculty.tno order by faculty.name;
 stud_name | faculty_name |   ldate
-----------+--------------+------------
 AAA       | Anurag       | 2025-08-21
 CCC       | Bajaj        | 2025-08-20
 AAA       | Mayur        | 2025-08-25
(3 rows)


tcadb=# select * from stud,faculty,stud_faculty where stud.rno = stud_faculty.rno AND faculty.tno = stud_faculty.tno AND faculty.city='Pune';
 rno | name | per | city | tno |  name  | salary | city | rno | tno |   ldate
-----+------+-----+------+-----+--------+--------+------+-----+-----+------------
   1 | AAA  |  60 | Pune | 101 | Anurag |  60000 | Pune |   1 | 101 | 2025-08-21
(1 row)


tcadb=# select s.name stud_name, f.name faculty_name, ldate from stud s,faculty f,stud_faculty st where s.rno = st.rno AND f.tno = st.tno order by f.name;
 stud_name | faculty_name |   ldate
-----------+--------------+------------
 AAA       | Anurag       | 2025-08-21
 CCC       | Bajaj        | 2025-08-20
 AAA       | Mayur        | 2025-08-25
(3 rows)


tcadb=# select f.name faculty_name,s.name stud_name, ldate from stud s,faculty f,stud_faculty st where s.rno = st.rno AND f.tno = st.tno order by f.name;
 faculty_name | stud_name |   ldate
--------------+-----------+------------
 Anurag       | AAA       | 2025-08-21
 Bajaj        | CCC       | 2025-08-20
 Mayur        | AAA       | 2025-08-25
(3 rows)


tcadb=# select f.name faculty_name,s.name stud_name, ldate from stud s,faculty f,stud_faculty st where s.rno = st.rno AND f.tno = st.tno order by s.name;
 faculty_name | stud_name |   ldate
--------------+-----------+------------
 Anurag       | AAA       | 2025-08-21
 Mayur        | AAA       | 2025-08-25
 Bajaj        | CCC       | 2025-08-20
(3 rows)


tcadb=# select s.name stud_name, f.name faculty_name, ldate from stud s,faculty f,stud_faculty st where s.rno = st.rno AND f.tno = st.tno order by s.name;
 stud_name | faculty_name |   ldate
-----------+--------------+------------
 AAA       | Anurag       | 2025-08-21
 AAA       | Mayur        | 2025-08-25
 CCC       | Bajaj        | 2025-08-20
(3 rows)


tcadb=# select * from stud,faculty,stud_faculty where stud.rno = stud_faculty.rno AND faculty.tno = stud_faculty.tno;
 rno | name | per | city  | tno |  name  | salary |  city  | rno | tno |   ldate
-----+------+-----+-------+-----+--------+--------+--------+-----+-----+------------
   1 | AAA  |  60 | Pune  | 101 | Anurag |  60000 | Pune   |   1 | 101 | 2025-08-21
   1 | AAA  |  60 | Pune  | 103 | Mayur  |  58000 | Delhi  |   1 | 103 | 2025-08-25
   3 | CCC  |  70 | Delhi | 102 | Bajaj  |  75000 | Gondia |   3 | 102 | 2025-08-20
(3 rows)


tcadb=# select * from stud join stud_faculty on stud.rno = stud_faculty.rno join faculty on faculty.tno = stud_faculty.tno;
 rno | name | per | city  | rno | tno |   ldate    | tno |  name  | salary |  city
-----+------+-----+-------+-----+-----+------------+-----+--------+--------+--------
   1 | AAA  |  60 | Pune  |   1 | 101 | 2025-08-21 | 101 | Anurag |  60000 | Pune
   1 | AAA  |  60 | Pune  |   1 | 103 | 2025-08-25 | 103 | Mayur  |  58000 | Delhi
   3 | CCC  |  70 | Delhi |   3 | 102 | 2025-08-20 | 102 | Bajaj  |  75000 | Gondia
(3 rows)


tcadb=# select s.name stud_name from stud s,faculty f,stud_faculty st where s.rno = st.rno AND f.tno = st.tno and f.name='Anurag';
 stud_name
-----------
 AAA
(1 row)


tcadb=# select stud.name
tcadb-# from stud , stud_faculty
tcadb-# where stud.rno = stud_faculty.rno
tcadb-# and ldate != '2025-08-20'
tcadb-# ;
 name
------
 AAA
 AAA
(2 rows)


tcadb=# select distinct stud.name as stud_absent_on20
tcadb-# from stud , stud_faculty
tcadb-# where stud.rno = stud_faculty.rno
tcadb-# and ldate != '2025-08-20'
tcadb-# ;
 stud_absent_on20
------------------
 AAA
(1 row)


tcadb=# select * from stud_faculty;
 rno | tno |   ldate
-----+-----+------------
   1 | 101 | 2025-08-21
   1 | 103 | 2025-08-25
   3 | 102 | 2025-08-20
(3 rows)


tcadb=# insert into stud_faculty values(4,103,'2025-08-20');
INSERT 0 1
tcadb=# select * from stud_faculty;
 rno | tno |   ldate
-----+-----+------------
   1 | 101 | 2025-08-21
   1 | 103 | 2025-08-25
   3 | 102 | 2025-08-20
   4 | 103 | 2025-08-20
(4 rows)


tcadb=# select distinct stud.name as stud_absent_on20
tcadb-# from stud , stud_faculty
tcadb-# where stud.rno = stud_faculty.rno
tcadb-# and ldate != '2025-08-20'
tcadb-# ;
 stud_absent_on20
------------------
 AAA
(1 row)
