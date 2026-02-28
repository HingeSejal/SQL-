
tcadb=# create table account(
tcadb(# ano int primary key ,
tcadb(# name varchar(10),
tcadb(# balance float check(balance>500)
tcadb(# );
CREATE TABLE
tcadb=# insert into account values(101,'SEJAL',10000);
INSERT 0 1
tcadb=# insert into account values(102,'Madhav',2000);
INSERT 0 1
tcadb=# insert into account values(103,'Varsha',50000);
INSERT 0 1
tcadb=# begin Transaction;
BEGIN
tcadb=*# update account set balance = balance -400 where ano=101;
UPDATE 1
tcadb=*# update account set balance = balance +400 where ano=103;
UPDATE 1
tcadb=*# end transaction;
COMMIT
tcadb=# select * from account;
 ano |  name  | balance
-----+--------+---------
 102 | Madhav |    2000
 101 | SEJAL  |    9600
 103 | Varsha |   50400
(3 rows)


tcadb=# begin Transaction;
BEGIN
tcadb=*# update account set balance = balance -2000 where ano=101;
UPDATE 1
tcadb=*# update account set balance = balance -2000 where ano=102;
ERROR:  new row for relation "account" violates check constraint "account_balance_check"
DETAIL:  Failing row contains (102, Madhav, 0).
tcadb=!# rollback transaction;
ROLLBACK
tcadb=# select * from account;
 ano |  name  | balance
-----+--------+---------
 102 | Madhav |    2000
 101 | SEJAL  |    9600
 103 | Varsha |   50400
(3 rows)
