
mydb=# \c tcadb;
You are now connected to database "tcadb" as user "postgres".
tcadb=# \d
              List of relations
 Schema |     Name     |   Type   |  Owner
--------+--------------+----------+----------
 public | bride        | table    | postgres
 public | faculty      | table    | postgres
 public | groom        | table    | postgres
 public | stud         | table    | postgres
 public | stud_faculty | table    | postgres
 public | student      | table    | postgres
 public | tcaseq       | sequence | postgres
(7 rows)


tcadb=# create table atab(ano int primary key , city varchar(10));
CREATE TABLE
tcadb=# create table btab(bno int primary key , city varchar(10));
CREATE TABLE
tcadb=# insert into atab values(1,'PUNE');
INSERT 0 1
tcadb=# insert into atab values(2,'Bombay');
INSERT 0 1
tcadb=# insert into atab values(2,'Delhi');
ERROR:  duplicate key value violates unique constraint "atab_pkey"
DETAIL:  Key (ano)=(2) already exists.
tcadb=# insert into atab values(3,'Delhi');
INSERT 0 1
tcadb=# insert into atab values(4,'Gondia');
INSERT 0 1
tcadb=# insert into btab values(101,'Gondia');
INSERT 0 1
tcadb=# insert into btab values(102,'Mumbai');
INSERT 0 1
tcadb=# insert into btab values(103,'SATARA');
INSERT 0 1
tcadb=# insert into btab values(104,'Solapur');
INSERT 0 1
tcadb=# select * from btab;
 bno |  city
-----+---------
 101 | Gondia
 102 | Mumbai
 103 | SATARA
 104 | Solapur
(4 rows)


tcadb=# select * from atab;
 ano |  city
-----+--------
   1 | PUNE
   2 | Bombay
   3 | Delhi
   4 | Gondia
(4 rows)


tcadb=#  select * from atab join btab on atab.city=btab.city;
 ano |  city  | bno |  city
-----+--------+-----+--------
   4 | Gondia | 101 | Gondia
(1 row)


tcadb=#  select * from atab inner join btab on atab.city=btab.city;
 ano |  city  | bno |  city
-----+--------+-----+--------
   4 | Gondia | 101 | Gondia
(1 row)


tcadb=#  select * from atab left join btab on atab.city=btab.city;
 ano |  city  | bno |  city
-----+--------+-----+--------
   2 | Bombay |     |
   3 | Delhi  |     |
   4 | Gondia | 101 | Gondia
   1 | PUNE   |     |
(4 rows)


tcadb=#  select * from btab left join btab on atab.city=btab.city;
ERROR:  table name "btab" specified more than once
tcadb=#  select * from btab left join atab on atab.city=btab.city;
 bno |  city   | ano |  city
-----+---------+-----+--------
 101 | Gondia  |   4 | Gondia
 102 | Mumbai  |     |
 103 | SATARA  |     |
 104 | Solapur |     |
(4 rows)


tcadb=# insert into atab values(5,'GONDIA');
INSERT 0 1
tcadb=#  select * from btab left join atab on atab.city=btab.city;
 bno |  city   | ano |  city
-----+---------+-----+--------
 101 | Gondia  |   4 | Gondia
 102 | Mumbai  |     |
 103 | SATARA  |     |
 104 | Solapur |     |
(4 rows)


tcadb=# insert into atab values(6,'Gondia');
INSERT 0 1
tcadb=#  select * from btab left join atab on atab.city=btab.city;
 bno |  city   | ano |  city
-----+---------+-----+--------
 101 | Gondia  |   4 | Gondia
 101 | Gondia  |   6 | Gondia
 102 | Mumbai  |     |
 103 | SATARA  |     |
 104 | Solapur |     |
(5 rows)


tcadb=#  select * from btab left outer join atab on atab.city=btab.city;
 bno |  city   | ano |  city
-----+---------+-----+--------
 101 | Gondia  |   4 | Gondia
 101 | Gondia  |   6 | Gondia
 102 | Mumbai  |     |
 103 | SATARA  |     |
 104 | Solapur |     |
(5 rows)


tcadb=#  select * from atab left outer join btab on atab.city=btab.city;
 ano |  city  | bno |  city
-----+--------+-----+--------
   2 | Bombay |     |
   3 | Delhi  |     |
   4 | Gondia | 101 | Gondia
   6 | Gondia | 101 | Gondia
   5 | GONDIA |     |
   1 | PUNE   |     |
(6 rows)


tcadb=#  select * from atab left outer join btab on atab.city=btab.city where btab.city=null;
 ano | city | bno | city
-----+------+-----+------
(0 rows)


tcadb=#  select * from atab left outer join btab on atab.city=btab.city where btab.city is null;
 ano |  city  | bno | city
-----+--------+-----+------
   1 | PUNE   |     |
   2 | Bombay |     |
   3 | Delhi  |     |
   5 | GONDIA |     |
(4 rows)


tcadb=#  select * from atab inner join btab on atab.city=btab.city;
 ano |  city  | bno |  city
-----+--------+-----+--------
   4 | Gondia | 101 | Gondia
   6 | Gondia | 101 | Gondia
(2 rows)


tcadb=# insert into btab values(105,'Mumbai');
INSERT 0 1
tcadb=#  select * from atab inner join btab on atab.city=btab.city;
 ano |  city  | bno |  city
-----+--------+-----+--------
   4 | Gondia | 101 | Gondia
   6 | Gondia | 101 | Gondia
(2 rows)


tcadb=# insert into btab values(106,'Pune');
INSERT 0 1
tcadb=#  select * from atab inner join btab on atab.city=btab.city;
 ano |  city  | bno |  city
-----+--------+-----+--------
   4 | Gondia | 101 | Gondia
   6 | Gondia | 101 | Gondia
(2 rows)


tcadb=# insert into btab values(107,'PUNE');
INSERT 0 1
tcadb=#  select * from atab inner join btab on atab.city=btab.city;
 ano |  city  | bno |  city
-----+--------+-----+--------
   4 | Gondia | 101 | Gondia
   6 | Gondia | 101 | Gondia
   1 | PUNE   | 107 | PUNE
(3 rows)


tcadb=#  select * from atab left outer join btab on atab.city=btab.city where btab.city is null;
 ano |  city  | bno | city
-----+--------+-----+------
   2 | Bombay |     |
   3 | Delhi  |     |
   5 | GONDIA |     |
(3 rows)


tcadb=# select * from atab;
 ano |  city
-----+--------
   1 | PUNE
   2 | Bombay
   3 | Delhi
   4 | Gondia
   5 | GONDIA
   6 | Gondia
(6 rows)


tcadb=# select * from btab;
 bno |  city
-----+---------
 101 | Gondia
 102 | Mumbai
 103 | SATARA
 104 | Solapur
 105 | Mumbai
 106 | Pune
 107 | PUNE
(7 rows)


tcadb=#  select * from atab right join btab on atab.city=btab.city;
 ano |  city  | bno |  city
-----+--------+-----+---------
   4 | Gondia | 101 | Gondia
   6 | Gondia | 101 | Gondia
     |        | 102 | Mumbai
     |        | 105 | Mumbai
     |        | 106 | Pune
   1 | PUNE   | 107 | PUNE
     |        | 103 | SATARA
     |        | 104 | Solapur
(8 rows)


tcadb=#  select * from atab right outer join btab on atab.city=btab.city where atab.city=null;
 ano | city | bno | city
-----+------+-----+------
(0 rows)


tcadb=#  select * from atab right outer join btab on atab.city=btab.city where atab.city is null;
 ano | city | bno |  city
-----+------+-----+---------
     |      | 102 | Mumbai
     |      | 103 | SATARA
     |      | 104 | Solapur
     |      | 105 | Mumbai
     |      | 106 | Pune
(5 rows)


tcadb=#  select * from atab full join btab on atab.city=btab.city;
 ano |  city  | bno |  city
-----+--------+-----+---------
   2 | Bombay |     |
   3 | Delhi  |     |
   4 | Gondia | 101 | Gondia
   6 | Gondia | 101 | Gondia
   5 | GONDIA |     |
     |        | 102 | Mumbai
     |        | 105 | Mumbai
     |        | 106 | Pune
   1 | PUNE   | 107 | PUNE
     |        | 103 | SATARA
     |        | 104 | Solapur
(11 rows)


tcadb=#  select * from atab full outer join btab on atab.city=btab.city where atab.city is null or btab.city is null;
 ano |  city  | bno |  city
-----+--------+-----+---------
   2 | Bombay |     |
   3 | Delhi  |     |
   5 | GONDIA |     |
     |        | 102 | Mumbai
     |        | 105 | Mumbai
     |        | 106 | Pune
     |        | 103 | SATARA
     |        | 104 | Solapur
(8 rows)


tcadb=#  select * from atab natural join btab ;
  city  | ano | bno
--------+-----+-----
 Gondia |   4 | 101
 Gondia |   6 | 101
 PUNE   |   1 | 107
(3 rows)


tcadb=#  select * from atab natural left join btab ;
  city  | ano | bno
--------+-----+-----
 Bombay |   2 |
 Delhi  |   3 |
 Gondia |   4 | 101
 Gondia |   6 | 101
 GONDIA |   5 |
 PUNE   |   1 | 107
(6 rows)


tcadb=#  select * from atab natural right join btab ;
  city   | ano | bno
---------+-----+-----
 Gondia  |   4 | 101
 Gondia  |   6 | 101
 Mumbai  |     | 102
 Mumbai  |     | 105
 Pune    |     | 106
 PUNE    |   1 | 107
 SATARA  |     | 103
 Solapur |     | 104
(8 rows)


tcadb=#  select * from atab natural inner join btab ;
  city  | ano | bno
--------+-----+-----
 Gondia |   4 | 101
 Gondia |   6 | 101
 PUNE   |   1 | 107
(3 rows)


tcadb=#  select * from atab  join btab ;
ERROR:  syntax error at or near ";"
LINE 1: select * from atab  join btab ;
                                      ^
tcadb=#  select * from atab cross join btab ;
 ano |  city  | bno |  city
-----+--------+-----+---------
   1 | PUNE   | 101 | Gondia
   1 | PUNE   | 102 | Mumbai
   1 | PUNE   | 103 | SATARA
   1 | PUNE   | 104 | Solapur
   1 | PUNE   | 105 | Mumbai
   1 | PUNE   | 106 | Pune
   1 | PUNE   | 107 | PUNE
   2 | Bombay | 101 | Gondia
   2 | Bombay | 102 | Mumbai
   2 | Bombay | 103 | SATARA
   2 | Bombay | 104 | Solapur
   2 | Bombay | 105 | Mumbai
   2 | Bombay | 106 | Pune
   2 | Bombay | 107 | PUNE
   3 | Delhi  | 101 | Gondia
   3 | Delhi  | 102 | Mumbai
   3 | Delhi  | 103 | SATARA
   3 | Delhi  | 104 | Solapur
   3 | Delhi  | 105 | Mumbai
   3 | Delhi  | 106 | Pune
   3 | Delhi  | 107 | PUNE
   4 | Gondia | 101 | Gondia
   4 | Gondia | 102 | Mumbai
   4 | Gondia | 103 | SATARA
   4 | Gondia | 104 | Solapur
   4 | Gondia | 105 | Mumbai
   4 | Gondia | 106 | Pune
   4 | Gondia | 107 | PUNE
   5 | GONDIA | 101 | Gondia
   5 | GONDIA | 102 | Mumbai
   5 | GONDIA | 103 | SATARA
   5 | GONDIA | 104 | Solapur
   5 | GONDIA | 105 | Mumbai
   5 | GONDIA | 106 | Pune
   5 | GONDIA | 107 | PUNE
   6 | Gondia | 101 | Gondia
   6 | Gondia | 102 | Mumbai
   6 | Gondia | 103 | SATARA
   6 | Gondia | 104 | Solapur
   6 | Gondia | 105 | Mumbai
   6 | Gondia | 106 | Pune
   6 | Gondia | 107 | PUNE
(42 rows)


tcadb=#  select * from atab ,btab ;
 ano |  city  | bno |  city
-----+--------+-----+---------
   1 | PUNE   | 101 | Gondia
   1 | PUNE   | 102 | Mumbai
   1 | PUNE   | 103 | SATARA
   1 | PUNE   | 104 | Solapur
   1 | PUNE   | 105 | Mumbai
   1 | PUNE   | 106 | Pune
   1 | PUNE   | 107 | PUNE
   2 | Bombay | 101 | Gondia
   2 | Bombay | 102 | Mumbai
   2 | Bombay | 103 | SATARA
   2 | Bombay | 104 | Solapur
   2 | Bombay | 105 | Mumbai
   2 | Bombay | 106 | Pune
   2 | Bombay | 107 | PUNE
   3 | Delhi  | 101 | Gondia
   3 | Delhi  | 102 | Mumbai
   3 | Delhi  | 103 | SATARA
   3 | Delhi  | 104 | Solapur
   3 | Delhi  | 105 | Mumbai
   3 | Delhi  | 106 | Pune
   3 | Delhi  | 107 | PUNE
   4 | Gondia | 101 | Gondia
   4 | Gondia | 102 | Mumbai
   4 | Gondia | 103 | SATARAs
   4 | Gondia | 104 | Solapur
   4 | Gondia | 105 | Mumbai
   4 | Gondia | 106 | Pune
   4 | Gondia | 107 | PUNE
   5 | GONDIA | 101 | Gondia
   5 | GONDIA | 102 | Mumbai
   5 | GONDIA | 103 | SATARA
   5 | GONDIA | 104 | Solapur
   5 | GONDIA | 105 | Mumbai
   5 | GONDIA | 106 | Pune
   5 | GONDIA | 107 | PUNE
   6 | Gondia | 101 | Gondia
   6 | Gondia | 102 | Mumbai
   6 | Gondia | 103 | SATARA
   6 | Gondia | 104 | Solapur
   6 | Gondia | 105 | Mumbai
   6 | Gondia | 106 | Pune
   6 | Gondia | 107 | PUNE
(42 rows)

-- More  --