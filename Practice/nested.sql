Type "help" for help.

advjavadb=# select s.rno , s.fname from student as s;
ERROR:  column s.fname does not exist
LINE 1: select s.rno , s.fname from student as s;
                       ^
HINT:  Perhaps you meant to reference the column "s.name".
advjavadb=# \d
               List of relations
 Schema |      Name       |   Type   |  Owner
--------+-----------------+----------+----------
 public | dateclass       | table    | postgres
 public | lad             | table    | postgres
 public | lad_rno_seq     | sequence | postgres
 public | personn         | table    | postgres
 public | session         | table    | postgres
 public | session_sid_seq | sequence | postgres
 public | student         | table    | postgres
 public | student_id_seq  | sequence | postgres
 public | teacher         | table    | postgres
 public | teacher_rno_seq | sequence | postgres
(10 rows)


advjavadb=# \d student;
                             Table "public.student"
 Column |         Type          | Collation | Nullable |         Default
--------+-----------------------+-----------+----------+-------------------------
 rno    | integer               |           | not null |
 name   | character varying(10) |           | not null | NULL::character varying
 per    | double precision      |           |          |
Indexes:
    "student_pkey" PRIMARY KEY, btree (rno)


advjavadb=# select s.rno , s.name from student as s;
 rno |   name
-----+-----------
  11 | sejaaaalu
  54 | sejala
  13 | lok
  12 | Raha
  14 | Vihan
  15 | Ritaa
  16 | Ritaa
(7 rows)


advjavadb=# select rno as rollnum from student;
 rollnum
---------
      11
      54
      13
      12
      14
      15
      16
(7 rows)


advjavadb=# select rno rollnum from student;
 rollnum
---------
      11
      54
      13
      12
      14
      15
      16
(7 rows)


advjavadb=# select * from teacher;
 rno |  name   | per  | city
-----+---------+------+------
   1 | Rekha   | 98.8 | Pune
   2 | Ramesh  | 95.8 | Pune
   3 | Vidya   | 92.4 | Pune
   4 | Balram  | 87.8 | Pune
   5 | Raul    | 76.8 | Pune
   6 | Megha   | 79.2 | Pune
   7 | Nupur   |   73 | Pune
   8 | Sejal   | 98.8 | Pune
   9 | Varun   | 95.8 | Pune
  10 | Nahik   | 93.4 | Pune
  11 | Dnyanda | 89.8 | Pune
  12 | Piyush  | 71.8 | Pune
  13 | Ethiya  | 73.2 | Pune
  14 | Utku    |   85 | Pune
(14 rows)


advjavadb=# UPDATE teacher
advjavadb-# SET city = CASE
advjavadb-#     WHEN rno IN (1, 3, 5) THEN 'Delhi'
advjavadb-#     WHEN rno IN (6, 8) THEN 'Bangalore'
advjavadb-#     WHEN rno = 12 THEN 'Chennai'
advjavadb-#     ELSE city
advjavadb-# END;
UPDATE 14
advjavadb=# select * from teacher;
 rno |  name   | per  |   city
-----+---------+------+-----------
   1 | Rekha   | 98.8 | Delhi
   2 | Ramesh  | 95.8 | Pune
   3 | Vidya   | 92.4 | Delhi
   4 | Balram  | 87.8 | Pune
   5 | Raul    | 76.8 | Delhi
   6 | Megha   | 79.2 | Bangalore
   7 | Nupur   |   73 | Pune
   8 | Sejal   | 98.8 | Bangalore
   9 | Varun   | 95.8 | Pune
  10 | Nahik   | 93.4 | Pune
  11 | Dnyanda | 89.8 | Pune
  12 | Piyush  | 71.8 | Chennai
  13 | Ethiya  | 73.2 | Pune
  14 | Utku    |   85 | Pune
(14 rows)


advjavadb=# select * from teacher order by per desc;
 rno |  name   | per  |   city
-----+---------+------+-----------
   1 | Rekha   | 98.8 | Delhi
   8 | Sejal   | 98.8 | Bangalore
   2 | Ramesh  | 95.8 | Pune
   9 | Varun   | 95.8 | Pune
  10 | Nahik   | 93.4 | Pune
   3 | Vidya   | 92.4 | Delhi
  11 | Dnyanda | 89.8 | Pune
   4 | Balram  | 87.8 | Pune
  14 | Utku    |   85 | Pune
   6 | Megha   | 79.2 | Bangalore
   5 | Raul    | 76.8 | Delhi
  13 | Ethiya  | 73.2 | Pune
   7 | Nupur   |   73 | Pune
  12 | Piyush  | 71.8 | Chennai
(14 rows)


advjavadb=# select * from teacher order by name desc;
 rno |  name   | per  |   city
-----+---------+------+-----------
   3 | Vidya   | 92.4 | Delhi
   9 | Varun   | 95.8 | Pune
  14 | Utku    |   85 | Pune
   8 | Sejal   | 98.8 | Bangalore
   1 | Rekha   | 98.8 | Delhi
   5 | Raul    | 76.8 | Delhi
   2 | Ramesh  | 95.8 | Pune
  12 | Piyush  | 71.8 | Chennai
   7 | Nupur   |   73 | Pune
  10 | Nahik   | 93.4 | Pune
   6 | Megha   | 79.2 | Bangalore
  13 | Ethiya  | 73.2 | Pune
  11 | Dnyanda | 89.8 | Pune
   4 | Balram  | 87.8 | Pune
(14 rows)


advjavadb=# select * from teacher order by name asc;
 rno |  name   | per  |   city
-----+---------+------+-----------
   4 | Balram  | 87.8 | Pune
  11 | Dnyanda | 89.8 | Pune
  13 | Ethiya  | 73.2 | Pune
   6 | Megha   | 79.2 | Bangalore
  10 | Nahik   | 93.4 | Pune
   7 | Nupur   |   73 | Pune
  12 | Piyush  | 71.8 | Chennai
   2 | Ramesh  | 95.8 | Pune
   5 | Raul    | 76.8 | Delhi
   1 | Rekha   | 98.8 | Delhi
   8 | Sejal   | 98.8 | Bangalore
  14 | Utku    |   85 | Pune
   9 | Varun   | 95.8 | Pune
   3 | Vidya   | 92.4 | Delhi
(14 rows)


advjavadb=# insert into teacher(name,per) values('Chaittrali',92.4);
INSERT 0 1
advjavadb=# select * from teacher order by name asc;
 rno |    name    | per  |   city
-----+------------+------+-----------
   4 | Balram     | 87.8 | Pune
  15 | Chaittrali | 92.4 | Pune
  11 | Dnyanda    | 89.8 | Pune
  13 | Ethiya     | 73.2 | Pune
   6 | Megha      | 79.2 | Bangalore
  10 | Nahik      | 93.4 | Pune
   7 | Nupur      |   73 | Pune
  12 | Piyush     | 71.8 | Chennai
   2 | Ramesh     | 95.8 | Pune
   5 | Raul       | 76.8 | Delhi
   1 | Rekha      | 98.8 | Delhi
   8 | Sejal      | 98.8 | Bangalore
  14 | Utku       |   85 | Pune
   9 | Varun      | 95.8 | Pune
   3 | Vidya      | 92.4 | Delhi
(15 rows)


advjavadb=# alter table teacher drop constraint default;
ERROR:  syntax error at or near "default"
LINE 1: alter table teacher drop constraint default;
                                            ^
advjavadb=# alter table teacher alter column city drop default;
ALTER TABLE
advjavadb=# insert into teacher(name,per) values('Dnyanu',92.4);
INSERT 0 1
advjavadb=# select * from teacher order by per desc null first;
ERROR:  syntax error at or near "null"
LINE 1: select * from teacher order by per desc null first;
                                                ^
advjavadb=# select * from teacher order by per desc null last;
ERROR:  syntax error at or near "null"
LINE 1: select * from teacher order by per desc null last;
                                                ^
advjavadb=# select * from teacher order by per desc;
 rno |    name    | per  |   city
-----+------------+------+-----------
   1 | Rekha      | 98.8 | Delhi
   8 | Sejal      | 98.8 | Bangalore
   9 | Varun      | 95.8 | Pune
   2 | Ramesh     | 95.8 | Pune
  10 | Nahik      | 93.4 | Pune
   3 | Vidya      | 92.4 | Delhi
  16 | Dnyanu     | 92.4 |
  15 | Chaittrali | 92.4 | Pune
  11 | Dnyanda    | 89.8 | Pune
   4 | Balram     | 87.8 | Pune
  14 | Utku       |   85 | Pune
   6 | Megha      | 79.2 | Bangalore
   5 | Raul       | 76.8 | Delhi
  13 | Ethiya     | 73.2 | Pune
   7 | Nupur      |   73 | Pune
  12 | Piyush     | 71.8 | Chennai
(16 rows)


advjavadb=# select * from teacher order by per desc nulls last;
 rno |    name    | per  |   city
-----+------------+------+-----------
   1 | Rekha      | 98.8 | Delhi
   8 | Sejal      | 98.8 | Bangalore
   9 | Varun      | 95.8 | Pune
   2 | Ramesh     | 95.8 | Pune
  10 | Nahik      | 93.4 | Pune
   3 | Vidya      | 92.4 | Delhi
  16 | Dnyanu     | 92.4 |
  15 | Chaittrali | 92.4 | Pune
  11 | Dnyanda    | 89.8 | Pune
   4 | Balram     | 87.8 | Pune
  14 | Utku       |   85 | Pune
   6 | Megha      | 79.2 | Bangalore
   5 | Raul       | 76.8 | Delhi
  13 | Ethiya     | 73.2 | Pune
   7 | Nupur      |   73 | Pune
  12 | Piyush     | 71.8 | Chennai
(16 rows)


advjavadb=# select * from teacher nulls last;
ERROR:  syntax error at or near "nulls"
LINE 1: select * from teacher nulls last;
                              ^
advjavadb=# select * from teacher order by per limit 2;
 rno |  name  | per  |  city
-----+--------+------+---------
  12 | Piyush | 71.8 | Chennai
   7 | Nupur  |   73 | Pune
(2 rows)


advjavadb=# select * from teacher order by per limit 1 offset 2;
 rno |  name  | per  | city
-----+--------+------+------
  13 | Ethiya | 73.2 | Pune
(1 row)


advjavadb=# select * from student where city between 'BANGLORE' and 'CHENNAI'
advjavadb-# ;
ERROR:  column "city" does not exist
LINE 1: select * from student where city between 'BANGLORE' and 'CHE...
                                    ^
advjavadb=# select * from teacher where city between 'BANGLORE' and 'CHENNAI';
 rno |  name  | per  |  city
-----+--------+------+---------
  12 | Piyush | 71.8 | Chennai
(1 row)


advjavadb=# select * from teacher order by asc;
ERROR:  syntax error at or near "asc"
LINE 1: select * from teacher order by asc;
                                       ^
advjavadb=# select * from teacher order by city asc;
 rno |    name    | per  |   city
-----+------------+------+-----------
   6 | Megha      | 79.2 | Bangalore
   8 | Sejal      | 98.8 | Bangalore
  12 | Piyush     | 71.8 | Chennai
   5 | Raul       | 76.8 | Delhi
   3 | Vidya      | 92.4 | Delhi
   1 | Rekha      | 98.8 | Delhi
  13 | Ethiya     | 73.2 | Pune
  14 | Utku       |   85 | Pune
  15 | Chaittrali | 92.4 | Pune
   9 | Varun      | 95.8 | Pune
   2 | Ramesh     | 95.8 | Pune
   4 | Balram     | 87.8 | Pune
   7 | Nupur      |   73 | Pune
  10 | Nahik      | 93.4 | Pune
  11 | Dnyanda    | 89.8 | Pune
  16 | Dnyanu     | 92.4 |
(16 rows)


advjavadb=# select * from teacher where city between'CHENNAI' and 'BANGLORE';
 rno | name | per | city
-----+------+-----+------
(0 rows)


advjavadb=# select * from teacher where city between 'BANGLORE' and 'CHENNAI';
 rno |  name  | per  |  city
-----+--------+------+---------
  12 | Piyush | 71.8 | Chennai
(1 row)


advjavadb=# select * from teacher where city in( 'BANGLORE' and 'CHENNAI');
ERROR:  invalid input syntax for type boolean: "BANGLORE"
LINE 1: select * from teacher where city in( 'BANGLORE' and 'CHENNAI...
                                             ^
advjavadb=# select * from teacher where city in( 'BANGLORE' , 'CHENNAI');
 rno | name | per | city
-----+------+-----+------
(0 rows)


advjavadb=# select name from teacher where city in( 'BANGLORE' , 'CHENNAI');
 name
------
(0 rows)


advjavadb=# select name from teacher where city in( 'Pune');
    name
------------
 Ramesh
 Balram
 Nupur
 Varun
 Nahik
 Dnyanda
 Ethiya
 Utku
 Chaittrali
(9 rows)


advjavadb=# select name from teacher where city in( 'Bangalore','chennai');
 name
-------
 Megha
 Sejal
(2 rows)


advjavadb=# select name from teacher where city not in( 'Bangalore','chennai');
    name
------------
 Rekha
 Ramesh
 Vidya
 Balram
 Raul
 Nupur
 Varun
 Nahik
 Dnyanda
 Piyush
 Ethiya
 Utku
 Chaittrali
(13 rows)


advjavadb=# select name from teacher where city !=( 'Bangalore','chennai');
ERROR:  operator does not exist: character varying <> record
LINE 1: select name from teacher where city !=( 'Bangalore','chennai...
                                            ^
HINT:  No operator matches the given name and argument types. You might need to add explicit type casts.
advjavadb=# select name from teacher where city !='Bangalore' and city!='chennai';
    name
------------
 Rekha
 Ramesh
 Vidya
 Balram
 Raul
 Nupur
 Varun
 Nahik
 Dnyanda
 Piyush
 Ethiya
 Utku
 Chaittrali
(13 rows)


advjavadb=# select name from teacher where city<>'Bangalore' and city<>'chennai';
    name
------------
 Rekha
 Ramesh
 Vidya
 Balram
 Raul
 Nupur
 Varun
 Nahik
 Dnyanda
 Piyush
 Ethiya
 Utku
 Chaittrali
(13 rows)


advjavadb=# select name from teacher where city<>'Bangalore' and city like 'p%';
 name
------
(0 rows)


advjavadb=# select name from teacher where city<>'Bangalore' or city like 'p%';
    name
------------
 Rekha
 Ramesh
 Vidya
 Balram
 Raul
 Nupur
 Varun
 Nahik
 Dnyanda
 Piyush
 Ethiya
 Utku
 Chaittrali
(13 rows)


advjavadb=# select * from student;
 rno |   name    | per
-----+-----------+------
  11 | sejaaaalu |   87
  54 | sejala    | 97.9
  13 | lok       | 98.8
  12 | Raha      |   89
  14 | Vihan     |   82
  15 | Ritaa     | 98.8
  16 | Ritaa     | 98.8
(7 rows)


advjavadb=# alter table student add column ph check ((ph like '7%' or ph like '8%' or ph like '9%') and length(ph)=10);
ERROR:  syntax error at or near "check"
LINE 1: alter table student add column ph check ((ph like '7%' or ph...
                                          ^
advjavadb=# alter table student add column ph varchar(10) check ((ph like '7%' or ph like '8%' or ph like '9%') and length(ph)=10);
ALTER TABLE
advjavadb=# update student set ph='7777732626' where rno in (11,14,15);
UPDATE 3
advjavadb=# update student set ph='8889732626' where rno in (11,14,15);
UPDATE 3
advjavadb=# update student set ph='7777732626' where rno in (16,13,12);
UPDATE 3
advjavadb=# update student set ph='9849832626' where rno=54;
UPDATE 1
advjavadb=# select * from student;
 rno |   name    | per  |     ph
-----+-----------+------+------------
  11 | sejaaaalu |   87 | 8889732626
  14 | Vihan     |   82 | 8889732626
  15 | Ritaa     | 98.8 | 8889732626
  13 | lok       | 98.8 | 7777732626
  12 | Raha      |   89 | 7777732626
  16 | Ritaa     | 98.8 | 7777732626
  54 | sejala    | 97.9 | 9849832626
(7 rows)


advjavadb=# select * from student where ph like '7%';
 rno | name  | per  |     ph
-----+-------+------+------------
  13 | lok   | 98.8 | 7777732626
  12 | Raha  |   89 | 7777732626
  16 | Ritaa | 98.8 | 7777732626
(3 rows)


advjavadb=# select * from student where ph like '8%';
 rno |   name    | per  |     ph
-----+-----------+------+------------
  11 | sejaaaalu |   87 | 8889732626
  14 | Vihan     |   82 | 8889732626
  15 | Ritaa     | 98.8 | 8889732626
(3 rows)


advjavadb=# select * from student where ph like '9%';
 rno |  name  | per  |     ph
-----+--------+------+------------
  54 | sejala | 97.9 | 9849832626
(1 row)


advjavadb=# select * from teacher where city=null;
 rno | name | per | city
-----+------+-----+------
(0 rows)


advjavadb=# select * from teacher where city is null;
 rno |  name  | per  | city
-----+--------+------+------
  16 | Dnyanu | 92.4 |
(1 row)


advjavadb=# insert into teacher(name,city) values('Dnywri','satara');
INSERT 0 1
advjavadb=# select * from teacher where per=null;
 rno | name | per | city
-----+------+-----+------
(0 rows)


advjavadb=# select * from teacher where per is null;
 rno |  name  | per |  city
-----+--------+-----+--------
  17 | Dnywri |     | satara
(1 row)


advjavadb=# \d teacher;
                                    Table "public.teacher"
 Column |         Type          | Collation | Nullable |               Default
--------+-----------------------+-----------+----------+--------------------------------------
 rno    | integer               |           | not null | nextval('teacher_rno_seq'::regclass)
 name   | character varying(20) |           | not null |
 per    | double precision      |           |          |
 city   | character varying(10) |           |          |


advjavadb=# update teacher set per=per+5 where name='vihan' returning *;
 rno | name | per | city
-----+------+-----+------
(0 rows)


UPDATE 0
advjavadb=# update student set per=per+5 where name='vihan' returning *;
 rno | name | per | ph
-----+------+-----+----
(0 rows)


UPDATE 0
advjavadb=# update student set per=per+5 where name='Vihan' returning *;
 rno | name  | per |     ph
-----+-------+-----+------------
  14 | Vihan |  87 | 8889732626
(1 row)


UPDATE 1
advjavadb=# select * from teacher where city ilike 'b%';
 rno | name  | per  |   city
-----+-------+------+-----------
   6 | Megha | 79.2 | Bangalore
   8 | Sejal | 98.8 | Bangalore
(2 rows)


advjavadb=# select * from teacher where city like 'b%';
 rno | name | per | city
-----+------+-----+------
(0 rows)


advjavadb=# select max(city) from teacher;
  max
--------
 satara
(1 row)


advjavadb=# select * from teacher;
 rno |    name    | per  |   city
-----+------------+------+-----------
   1 | Rekha      | 98.8 | Delhi
   2 | Ramesh     | 95.8 | Pune
   3 | Vidya      | 92.4 | Delhi
   4 | Balram     | 87.8 | Pune
   5 | Raul       | 76.8 | Delhi
   6 | Megha      | 79.2 | Bangalore
   7 | Nupur      |   73 | Pune
   8 | Sejal      | 98.8 | Bangalore
   9 | Varun      | 95.8 | Pune
  10 | Nahik      | 93.4 | Pune
  11 | Dnyanda    | 89.8 | Pune
  12 | Piyush     | 71.8 | Chennai
  13 | Ethiya     | 73.2 | Pune
  14 | Utku       |   85 | Pune
  15 | Chaittrali | 92.4 | Pune
  16 | Dnyanu     | 92.4 |
  17 | Dnywri     |      | satara
(17 rows)


advjavadb=# select max(city) from teacher;
  max
--------
 satara
(1 row)


advjavadb=# select max(city) as maxbyAsciiVal from teacher;
 maxbyasciival
---------------
 satara
(1 row)


advjavadb=# select max(city) as maxbyOccurance from teacher where city in ('Pune','Delhi');
 maxbyoccurance
----------------
 Pune
(1 row)


advjavadb=# select * from student limit 1;
 rno |   name    | per |     ph
-----+-----------+-----+------------
  11 | sejaaaalu |  87 | 8889732626
(1 row)


advjavadb=# select * from student order by per desc limit 1;
 rno | name  | per  |     ph
-----+-------+------+------------
  15 | Ritaa | 98.8 | 8889732626
(1 row)


advjavadb=# select * from student where per=(select max(per) from student);
 rno | name  | per  |     ph
-----+-------+------+------------
  15 | Ritaa | 98.8 | 8889732626
  13 | lok   | 98.8 | 7777732626
  16 | Ritaa | 98.8 | 7777732626
(3 rows)


advjavadb=# select * from student where city='Delhi' and per=(select max(per) from student where city='Delhi');
ERROR:  column "city" does not exist
LINE 1: select * from student where city='Delhi' and per=(select max...
                                    ^
advjavadb=# select * from teacher where city='Delhi' and per=(select max(per) from student where city='Delhi');
 rno | name  | per  | city
-----+-------+------+-------
   1 | Rekha | 98.8 | Delhi
(1 row)


advjavadb=# select * from student where per=(select max(per) from student where per!=(select max(per) from student));
 rno |  name  | per  |     ph
-----+--------+------+------------
  54 | sejala | 97.9 | 9849832626
(1 row)


advjavadb=# select * from student order by per desc limit 5;
 rno |  name  | per  |     ph
-----+--------+------+------------
  16 | Ritaa  | 98.8 | 7777732626
  15 | Ritaa  | 98.8 | 8889732626
  13 | lok    | 98.8 | 7777732626
  54 | sejala | 97.9 | 9849832626
  12 | Raha   |   89 | 7777732626
(5 rows)


advjavadb=# select max(per) from student where per=(select max(per) from student where per!=(select max(per) from student where per!=(select max(per) from student)));
 max
------
 98.8
(1 row)


advjavadb=# select * from student where per=(select max(per) from student where per!=(select max(per) from student where per!=(select max(per) from student)));
 rno | name  | per  |     ph
-----+-------+------+------------
  15 | Ritaa | 98.8 | 8889732626
  13 | lok   | 98.8 | 7777732626
  16 | Ritaa | 98.8 | 7777732626
(3 rows)


advjavadb=# select * from student where per=(select max(per) from student where per!=(select max(per) from student));
 rno |  name  | per  |     ph
-----+--------+------+------------
  54 | sejala | 97.9 | 9849832626
(1 row)


advjavadb=# select * from student where per=(select max(per) from student where per!=(select max(per) from student where per!=(select max(per) from student)));
 rno | name  | per  |     ph
-----+-------+------+------------
  15 | Ritaa | 98.8 | 8889732626
  13 | lok   | 98.8 | 7777732626
  16 | Ritaa | 98.8 | 7777732626
(3 rows)


advjavadb=# select * from student where per=(select max(per) from student where per<(select max(per) from student where per<(select max(per) from student)));
 rno | name | per |     ph
-----+------+-----+------------
  12 | Raha |  89 | 7777732626
(1 row)


advjavadb=# select city , count(*) from teacher group by city;
   city    | count
-----------+-------
           |     1
 Pune      |     9
 satara    |     1
 Delhi     |     3
 Chennai   |     1
 Bangalore |     2
(6 rows)


advjavadb=# select city , max(per) from teacher group by city order by per desc;
ERROR:  column "teacher.per" must appear in the GROUP BY clause or be used in an aggregate function
LINE 1: ...ity , max(per) from teacher group by city order by per desc;
                                                              ^
advjavadb=# select * from teacher;
 rno |    name    | per  |   city
-----+------------+------+-----------
   1 | Rekha      | 98.8 | Delhi
   2 | Ramesh     | 95.8 | Pune
   3 | Vidya      | 92.4 | Delhi
   4 | Balram     | 87.8 | Pune
   5 | Raul       | 76.8 | Delhi
   6 | Megha      | 79.2 | Bangalore
   7 | Nupur      |   73 | Pune
   8 | Sejal      | 98.8 | Bangalore
   9 | Varun      | 95.8 | Pune
  10 | Nahik      | 93.4 | Pune
  11 | Dnyanda    | 89.8 | Pune
  12 | Piyush     | 71.8 | Chennai
  13 | Ethiya     | 73.2 | Pune
  14 | Utku       |   85 | Pune
  15 | Chaittrali | 92.4 | Pune
  16 | Dnyanu     | 92.4 |
  17 | Dnywri     |      | satara
(17 rows)


advjavadb=# select city , max(per) as topper from teacher group by city order by topper desc;
   city    | topper
-----------+--------
 satara    |
 Delhi     |   98.8
 Bangalore |   98.8
 Pune      |   95.8
           |   92.4
 Chennai   |   71.8
(6 rows)


advjavadb=# select city , max(per) as topper from teacher group by city order by topper desc nulls last;
   city    | topper
-----------+--------
 Delhi     |   98.8
 Bangalore |   98.8
 Pune      |   95.8
           |   92.4
 Chennai   |   71.8
 satara    |
(6 rows)


advjavadb=# select city , max(per) as topper , count(*) top_count topper from teacher group by city order by topper desc nulls last;
ERROR:  syntax error at or near "topper"
LINE 1: ...ct city , max(per) as topper , count(*) top_count topper fro...
                                                             ^
advjavadb=# select city , max(per) as topper , count(*) top_count from teacher group by city order by topper desc nulls last;
   city    | topper | top_count
-----------+--------+-----------
 Delhi     |   98.8 |         3
 Bangalore |   98.8 |         2
 Pune      |   95.8 |         9
           |   92.4 |         1
 Chennai   |   71.8 |         1
 satara    |        |         1
(6 rows)


advjavadb=# delete from teacher where city is null;
DELETE 1
advjavadb=# select city , max(per) as topper , count(*) top_count from teacher group by city order by topper desc nulls last;
   city    | topper | top_count
-----------+--------+-----------
 Delhi     |   98.8 |         3
 Bangalore |   98.8 |         2
 Pune      |   95.8 |         9
 Chennai   |   71.8 |         1
 satara    |        |         1
(5 rows)


advjavadb=# select * from teacher;
 rno |    name    | per  |   city
-----+------------+------+-----------
   1 | Rekha      | 98.8 | Delhi
   2 | Ramesh     | 95.8 | Pune
   3 | Vidya      | 92.4 | Delhi
   4 | Balram     | 87.8 | Pune
   5 | Raul       | 76.8 | Delhi
   6 | Megha      | 79.2 | Bangalore
   7 | Nupur      |   73 | Pune
   8 | Sejal      | 98.8 | Bangalore
   9 | Varun      | 95.8 | Pune
  10 | Nahik      | 93.4 | Pune
  11 | Dnyanda    | 89.8 | Pune
  12 | Piyush     | 71.8 | Chennai
  13 | Ethiya     | 73.2 | Pune
  14 | Utku       |   85 | Pune
  15 | Chaittrali | 92.4 | Pune
  17 | Dnywri     |      | satara
(16 rows)


advjavadb=# select city , max(per) as topper , count( select * from teacher where per=(select max(per) from teacher where per!=(select max(per) from teacher where per!=(select max(per) from teacher)))) top_count topper from teacher group by city order by topper desc nulls last;
ERROR:  syntax error at or near "select"
LINE 1: select city , max(per) as topper , count( select * from teac...
                                                  ^
advjavadb=# select * from teacher;
 rno |    name    | per  |   city
-----+------------+------+-----------
   1 | Rekha      | 98.8 | Delhi
   2 | Ramesh     | 95.8 | Pune
   3 | Vidya      | 92.4 | Delhi
   4 | Balram     | 87.8 | Pune
   5 | Raul       | 76.8 | Delhi
   6 | Megha      | 79.2 | Bangalore
   7 | Nupur      |   73 | Pune
   8 | Sejal      | 98.8 | Bangalore
   9 | Varun      | 95.8 | Pune
  10 | Nahik      | 93.4 | Pune
  11 | Dnyanda    | 89.8 | Pune
  12 | Piyush     | 71.8 | Chennai
  13 | Ethiya     | 73.2 | Pune
  14 | Utku       |   85 | Pune
  15 | Chaittrali | 92.4 | Pune
  17 | Dnywri     |      | satara
(16 rows)


advjavadb=# select city , max(per) as topper_per from teacher group by city order by topper desc nulls last;
ERROR:  column "topper" does not exist
LINE 1: ...as topper_per from teacher group by city order by topper des...
                                                             ^
HINT:  Perhaps you meant to reference the column "teacher.per".
advjavadb=# select * from teacher;
 rno |    name    | per  |   city
-----+------------+------+-----------
   1 | Rekha      | 98.8 | Delhi
   2 | Ramesh     | 95.8 | Pune
   3 | Vidya      | 92.4 | Delhi
   4 | Balram     | 87.8 | Pune
   5 | Raul       | 76.8 | Delhi
   6 | Megha      | 79.2 | Bangalore
   7 | Nupur      |   73 | Pune
   8 | Sejal      | 98.8 | Bangalore
   9 | Varun      | 95.8 | Pune
  10 | Nahik      | 93.4 | Pune
  11 | Dnyanda    | 89.8 | Pune
  12 | Piyush     | 71.8 | Chennai
  13 | Ethiya     | 73.2 | Pune
  14 | Utku       |   85 | Pune
  15 | Chaittrali | 92.4 | Pune
  17 | Dnywri     |      | satara
(16 rows)


advjavadb=# select city , max(per) as topper_per from teacher group by city order by topper_per desc nulls last;
   city    | topper_per
-----------+------------
 Delhi     |       98.8
 Bangalore |       98.8
 Pune      |       95.8
 Chennai   |       71.8
 satara    |
(5 rows)


advjavadb=# insert into teacher (name,per,city) values (Madhu ,97.3,'Gondia'),(Radha ,97.3,'Gondia'),(Paresh ,97.3,'Gondia');
ERROR:  column "madhu" does not exist
LINE 1: insert into teacher (name,per,city) values (Madhu ,97.3,'Gon...
                                                    ^
advjavadb=# insert into teacher (name,per,city) values ('Madhu' ,97.3,'Gondia'),('Radha' ,97.3,'Gondia'),('Paresh' ,97.3,'Gondia');
INSERT 0 3
advjavadb=# insert into teacher (name,per,city) values ('Rama' ,98.8,'Delhi');
INSERT 0 1
advjavadb=# select * from teacher;
 rno |    name    | per  |   city
-----+------------+------+-----------
   1 | Rekha      | 98.8 | Delhi
   2 | Ramesh     | 95.8 | Pune
   3 | Vidya      | 92.4 | Delhi
   4 | Balram     | 87.8 | Pune
   5 | Raul       | 76.8 | Delhi
   6 | Megha      | 79.2 | Bangalore
   7 | Nupur      |   73 | Pune
   8 | Sejal      | 98.8 | Bangalore
   9 | Varun      | 95.8 | Pune
  10 | Nahik      | 93.4 | Pune
  11 | Dnyanda    | 89.8 | Pune
  12 | Piyush     | 71.8 | Chennai
  13 | Ethiya     | 73.2 | Pune
  14 | Utku       |   85 | Pune
  15 | Chaittrali | 92.4 | Pune
  17 | Dnywri     |      | satara
  18 | Madhu      | 97.3 | Gondia
  19 | Radha      | 97.3 | Gondia
  20 | Paresh     | 97.3 | Gondia
  21 | Rama       | 98.8 | Delhi
(20 rows)


advjavadb=# select city , max(per) as topper_per from teacher group by city order by topper_per desc nulls last;
   city    | topper_per
-----------+------------
 Delhi     |       98.8
 Bangalore |       98.8
 Gondia    |       97.3
 Pune      |       95.8
 Chennai   |       71.8
 satara    |
(6 rows)


advjavadb=# rename table teacher to studinfo;
ERROR:  syntax error at or near "rename"
LINE 1: rename table teacher to studinfo;
        ^
advjavadb=# alter table teacher rename to studinfo;
ALTER TABLE
advjavadb=# select * from studinfo;
 rno |    name    | per  |   city
-----+------------+------+-----------
   1 | Rekha      | 98.8 | Delhi
   2 | Ramesh     | 95.8 | Pune
   3 | Vidya      | 92.4 | Delhi
   4 | Balram     | 87.8 | Pune
   5 | Raul       | 76.8 | Delhi
   6 | Megha      | 79.2 | Bangalore
   7 | Nupur      |   73 | Pune
   8 | Sejal      | 98.8 | Bangalore
   9 | Varun      | 95.8 | Pune
  10 | Nahik      | 93.4 | Pune
  11 | Dnyanda    | 89.8 | Pune
  12 | Piyush     | 71.8 | Chennai
  13 | Ethiya     | 73.2 | Pune
  14 | Utku       |   85 | Pune
  15 | Chaittrali | 92.4 | Pune
  17 | Dnywri     |      | satara
  18 | Madhu      | 97.3 | Gondia
  19 | Radha      | 97.3 | Gondia
  20 | Paresh     | 97.3 | Gondia
  21 | Rama       | 98.8 | Delhi
(20 rows)


advjavadb=# select city , max(per) as topper_per from studinfo group by city order by topper_per desc nulls last;
   city    | topper_per
-----------+------------
 Delhi     |       98.8
 Bangalore |       98.8
 Gondia    |       97.3
 Pune      |       95.8
 Chennai   |       71.8
 satara    |
(6 rows)


advjavadb=# select city , max(per) as topper_per , count(*) as topper_Count from studinfo where per = (max(per) from studinfo group by city ) order by topper_per desc nulls last;
ERROR:  syntax error at or near "from"
LINE 1: ... topper_Count from studinfo where per = (max(per) from studi...
                                                             ^
advjavadb=# select city , max(per) as topper_per , count(*) as topper_Count from studinfo where per = (select max(per) from studinfo group by city ) order by topper_per desc nulls last;
ERROR:  column "studinfo.city" must appear in the GROUP BY clause or be used in an aggregate function
LINE 1: select city , max(per) as topper_per , count(*) as topper_Co...
               ^
advjavadb=# SELECT city,
advjavadb-#        per AS top_percent,
advjavadb-#        COUNT(*) AS topper_count
advjavadb-# FROM teacher
advjavadb-# WHERE per IS NOT NULL
advjavadb-# GROUP BY city, per
advjavadb-# HAVING per = MAX(per)
advjavadb-# ORDER BY city;
ERROR:  relation "teacher" does not exist
LINE 4: FROM teacher
             ^
advjavadb=# SELECT city,
advjavadb-#        per AS top_percent,
advjavadb-#        COUNT(*) AS topper_count
advjavadb-# FROM studinfo
advjavadb-# WHERE per IS NOT NULL
advjavadb-# GROUP BY city, per
advjavadb-# HAVING per = MAX(per)
advjavadb-# ORDER BY city;
   city    | top_percent | topper_count
-----------+-------------+--------------
 Bangalore |        98.8 |            1
 Bangalore |        79.2 |            1
 Chennai   |        71.8 |            1
 Delhi     |        92.4 |            1
 Delhi     |        98.8 |            2
 Delhi     |        76.8 |            1
 Gondia    |        97.3 |            3
 Pune      |          73 |            1
 Pune      |        87.8 |            1
 Pune      |          85 |            1
 Pune      |        89.8 |            1
 Pune      |        92.4 |            1
 Pune      |        95.8 |            2
 Pune      |        73.2 |            1
 Pune      |        93.4 |            1
(15 rows)