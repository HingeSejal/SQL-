mysql> use tcadb;
Database changed
mysql> delimiter $$
mysql> create function sum_ofint(n int)
    -> returns int
    -> deterministic
    -> begin
    -> declare ans int  default 0;
    -> declare i int default 1;
    -> set ans=0;
    -> set i=1;
    -> while i<=n
    -> do
    -> set ans=ans+i;
    -> set i=i+1;
    -> end while;
    -> return ans;
    -> end $$
Query OK, 0 rows affected (0.23 sec)

mysql> delimiter ;
mysql>
mysql> select sum_ofint(5);
+--------------+
| sum_ofint(5) |
+--------------+
|           15 |
+--------------+
1 row in set (0.04 sec)



mysql> DELIMITER $$
mysql>
mysql> CREATE FUNCTION sum_ofint_repeat(n INT)
    -> RETURNS INT
    -> DETERMINISTIC
    -> BEGIN
    ->     DECLARE ans INT DEFAULT 0;
    ->     DECLARE i INT DEFAULT 1;
    ->
    ->     REPEAT
    ->         SET ans = ans + i;
    ->         SET i = i + 1;
    ->     UNTIL i > n
    ->     END REPEAT;
    ->
    ->     RETURN ans;
    -> END $$
Query OK, 0 rows affected (0.01 sec)

mysql>
mysql> DELIMITER ;
mysql>
mysql> select sum_ofint_repeat(5);
+---------------------+
| sum_ofint_repeat(5) |
+---------------------+
|                  15 |
+---------------------+
1 row in set (0.00 sec)