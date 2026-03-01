mysql> Delimiter $$
mysql> create function message()
    -> returns varchar(20)
    -> deterministic
    -> begin
    -> return 'hello duniya';
    -> end$$
Query OK, 0 rows affected (0.03 sec)

mysql> Delimiter ;

mysql> select message();
+--------------+
| message()    |
+--------------+
| hello duniya |
+--------------+
1 row in set (0.02 sec)

mysql> delimiter $$
mysql> create function today_date()
    -> returns date
    -> not deterministic
    -> no sql
    -> begin
    -> return curdate();
    -> end$$
Query OK, 0 rows affected (0.01 sec)

mysql> delimiter ;
mysql>
mysql> select today_date();
+--------------+
| today_date() |
+--------------+
| 2026-03-01   |
+--------------+
1 row in set (0.02 sec)

mysql> delimiter $$
mysql> create function today_time()
    -> returns date
    -> not deterministic
    -> no sql
    -> begin
    -> return curtime();
    -> end$$
Query OK, 0 rows affected (0.02 sec)

mysql> delimiter ;
mysql> select today_time();
+--------------+
| today_time() |
+--------------+
| 2026-03-01   |
+--------------+
1 row in set, 1 warning (0.00 sec)

mysql> select today_time();
+--------------+
| today_time() |
+--------------+
| 2026-03-01   |
+--------------+
1 row in set, 1 warning (0.02 sec)

mysql> drop function today_time;
Query OK, 0 rows affected (0.02 sec)

mysql> delimiter $$
mysql> create function today_time()
    -> returns time
    -> not deterministic
    -> no sql
    -> begin
    -> return curtime();
    -> end$$
Query OK, 0 rows affected (0.02 sec)

mysql> delimiter ;
mysql>
mysql> select today_time();
+--------------+
| today_time() |
+--------------+
| 08:53:03     |
+--------------+
1 row in set (0.02 sec)

mysql> select today_time();
+--------------+
| today_time() |
+--------------+
| 08:53:08     |
+--------------+
1 row in set (0.00 sec)

mysql> show function where db=DATABASE();
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'where db=DATABASE()' at line 1
mysql> show function status where db=DATABASE();
+-------+------------+----------+----------------+---------------------+---------------------+---------------+---------+----------------------+----------------------+--------------------+
| Db    | Name       | Type     | Definer        | Modified            | Created             | Security_type | Comment | character_set_client | collation_connection | Database Collation |
+-------+------------+----------+----------------+---------------------+---------------------+---------------+---------+----------------------+----------------------+--------------------+
| tcadb | message    | FUNCTION | root@localhost | 2026-03-01 08:18:42 | 2026-03-01 08:18:42 | DEFINER       |         | cp850                | cp850_general_ci     | utf8mb4_0900_ai_ci |
| tcadb | msg        | FUNCTION | root@localhost | 2026-03-01 08:04:55 | 2026-03-01 08:04:55 | DEFINER       |         | cp850                | cp850_general_ci     | utf8mb4_0900_ai_ci |
| tcadb | today_date | FUNCTION | root@localhost | 2026-03-01 08:45:23 | 2026-03-01 08:45:23 | DEFINER       |         | cp850                | cp850_general_ci     | utf8mb4_0900_ai_ci |
| tcadb | today_time | FUNCTION | root@localhost | 2026-03-01 08:52:19 | 2026-03-01 08:52:19 | DEFINER       |         | cp850                | cp850_general_ci     | utf8mb4_0900_ai_ci |
+-------+------------+----------+----------------+---------------------+---------------------+---------------+---------+----------------------+----------------------+--------------------+
4 rows in set (0.06 sec)

mysql> select message();
+--------------+
| message()    |
+--------------+
| hello duniya |
+--------------+
1 row in set (0.00 sec)

mysql> select msg();
ERROR 1406 (22001): Data too long for column 'msg()' at row 1
mysql> drop function msg;;
Query OK, 0 rows affected (0.02 sec)

ERROR:
No query specified

mysql> select msg();
ERROR 1305 (42000): FUNCTION tcadb.msg does not exist
mysql> select tca_date();
ERROR 1305 (42000): FUNCTION tcadb.tca_date does not exist
mysql> select today_date();
+--------------+
| today_date() |
+--------------+
| 2026-03-01   |
+--------------+
1 row in set (0.00 sec)

mysql> select today_time();
+--------------+
| today_time() |
+--------------+
| 09:33:43     |
+--------------+
1 row in set (0.00 sec)

mysql> delimiter $$
mysql> create function maximum(a int , b int)
    -> returns int
    -> deterministic
    -> begin
    -> declare
    -> m int;
    -> if a>b then
    -> set m=a;
    -> else
    -> set m=b;
    -> end if;
    -> return m;
    -> end $$
Query OK, 0 rows affected (0.01 sec)

mysql> delimiter ;
mysql>
mysql> select maximum(10,29);
+----------------+
| maximum(10,29) |
+----------------+
|             29 |
+----------------+