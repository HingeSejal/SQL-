tcadb=# select * from stud;
 rno |   name   | per | city
-----+----------+-----+-------
   1 | Kunal    |  60 | Pune
   3 | Mrunali  |  70 | Delhi
   4 | Shreedha |  90 | Pune
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
   4 | 103 | 2025-08-20
(4 rows)

tcadb=# select s.name Kunal ,f.name Kunal_teacher , sf.ldate
tcadb-# from stud s , faculty f , stud_faculty sf
tcadb-# where s.rno = sf.rno AND f.tno = sf.tno
tcadb-# AND s.name = 'Kunal';
 kunal | kunal_teacher |   ldate
-------+---------------+------------
 Kunal | Anurag        | 2025-08-21
 Kunal | Mayur         | 2025-08-25


tcadb=# select s.name bajaj_stud ,f.name bajaj , sf.ldate
tcadb-# from stud s , faculty f , stud_faculty sf
tcadb-# where s.rno = sf.rno AND f.tno = sf.tno
tcadb-# AND f.name = 'Bajaj';
 bajaj_stud | bajaj |   ldate
------------+-------+------------
 Mrunali    | Bajaj | 2025-08-20
(1 row)

tcadb=# (select name from stud where city in ((select city from stud )intersect(select city from faculty ))) union ( select name from faculty where city in ((select city from stud )intersect(select city from faculty )));
   name
----------
 Dnyanesh
 Anurag
 Kunal
 Shreedha
 Mayur
 Mrunali
(6 rows)


tcadb=# (select city from stud )intersect(select city from faculty );
 city
-------
 Pune
 Delhi
(2 rows)


tcadb=# (select name from stud where city='Pune')union(select name from faculty where city='Pune');
   name
----------
 Anurag
 Dnyanesh
 Kunal
 Shreedha
(4 rows)


tcadb=# select * from stud_faculty where tno in (select tno from faculty where salary = (select (salary) from faculty order by salary  limit 1 offset 1));
 rno | tno |   ldate
-----+-----+------------
   1 | 101 | 2025-08-21
(1 row)

tcadb=# select name from faculty where salary = (select salary from faculty order by salary desc limit 1 offset 1);
 name
-------
 Bajaj
(1 row)

tcadb=# select name from faculty where salary = (select max(salary) from faculty);
   name
----------
 Dnyanesh
(1 row)
