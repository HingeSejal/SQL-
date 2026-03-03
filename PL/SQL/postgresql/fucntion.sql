postgres=# \c tcadb;
You are now connected to database "tcadb" as user "postgres".
tcadb=# \d
              List of relations
 Schema |     Name     |   Type   |  Owner
--------+--------------+----------+----------
 public | account      | table    | postgres
 public | atab         | table    | postgres
 public | bride        | table    | postgres
 public | btab         | table    | postgres
 public | employee     | table    | postgres
 public | faculty      | table    | postgres
 public | groom        | table    | postgres
 public | stud         | table    | postgres
 public | stud_faculty | table    | postgres
 public | student      | table    | postgres
 public | tab1         | table    | postgres
 public | tab2         | table    | postgres
 public | tcaseq       | sequence | postgres
(13 rows)


tcadb=# select * from student;
 rno | fname | lname | per  |   phone    |  adm_date
-----+-------+-------+------+------------+------------
 101 | Amit  | Patil | 85.6 | 9876543210 | 2026-01-06
 102 | sejal | hinge | 98.8 | 7350058964 | 2026-01-06
(2 rows)


tcadb=# select * from stud;
 rno |   name   | per | city
-----+----------+-----+-------
   1 | Kunal    |  60 | Pune
   3 | Mrunali  |  70 | Delhi
   4 | Shreedha |  90 | Pune
(3 rows)

         
tcadb=# create or replace function get_result(perno int)
tcadb-# returns text
tcadb-# language plpgsql
tcadb-# as $$
tcadb$# declare
tcadb$# tper float;
tcadb$# status text;
tcadb$# begin
tcadb$# select per into tper
tcadb$# from stud
tcadb$# where rno = perno ;
tcadb$# if NOT FOUND THEN
tcadb$# return 'Student Does not Exist !!!';
tcadb$# end if;
tcadb$# if tper >= 40 then
tcadb$# status := 'pass';
tcadb$# else
tcadb$# status := 'fail';
tcadb$# end if;
tcadb$# return status;
tcadb$# end;
tcadb$# $$;
CREATE FUNCTION

tcadb=# select get_result(1);
 get_result
------------
 pass
(1 row)


tcadb=# select get_result(2);
         get_result
----------------------------
 Student Does not Exist !!!
(1 row)


tcadb=# select get_result(3);
 get_result
------------
 pass
(1 row)

tcadb=# create or replace function get_result(perno int)
tcadb-# returns text
tcadb-# language plpgsql
tcadb-# as $$
tcadb$# declare
tcadb$# tper float;
tcadb$# status text;
tcadb$# begin
tcadb$# select per into tper
tcadb$# from stud
tcadb$# where rno = perno ;
tcadb$# if NOT FOUND THEN
tcadb$# return 'Student Does not Exist !!!';
tcadb$# end if;
tcadb$# if tper is null then
tcadb$# return 'Absentt !!!';
tcadb$# end if;
tcadb$# if tper >= 40 then
tcadb$# status := 'pass';
tcadb$# else
tcadb$# status := 'fail';
tcadb$# end if;
tcadb$# return status;
tcadb$# end;
tcadb$# $$;
CREATE FUNCTION

tcadb=# select get_result(2);
  get_result
---------------
 Absentt!!!!!!
(1 row)

tcadb=# create or replace function get_result(perno int)
tcadb-# returns text
tcadb-# language plpgsql
tcadb-# as $$
tcadb$# declare
tcadb$# tper Stud.per%type;
tcadb$# status text;
tcadb$# begin
tcadb$# select per into tper
tcadb$# from stud
tcadb$# where rno = perno ;
tcadb$# if NOT FOUND THEN
tcadb$# return 'Student Does not Exist !!!';
tcadb$# end if;
tcadb$# if tper is null then
tcadb$# return 'Absentt !!!';
tcadb$# end if;
tcadb$# if tper >= 40 then
tcadb$# status := 'pass';
tcadb$# else
tcadb$# status := 'fail';
tcadb$# end if;
tcadb$# return status;
tcadb$# end;
tcadb$# $$;
CREATE FUNCTION


