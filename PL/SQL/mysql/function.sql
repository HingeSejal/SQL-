mysql>  show tables;
+-----------------+
| Tables_in_tcadb |
+-----------------+
| student         |
+-----------------+
1 row in set (0.14 sec)

mysql> select * from student;
+-----+-------+---------+------+------------+---------------------+
| rno | fname | lname   | per  | phone      | Adm_Date            |
+-----+-------+---------+------+------------+---------------------+
| 101 | Sejal | Hinge   | 98.6 | 9876543210 | 2026-01-06 13:34:27 |
| 102 | Shree | Khamkar | 99.6 | 9876543210 | 2026-01-06 15:16:40 |
+-----+-------+---------+------+------------+---------------------+
2 rows in set (0.04 sec)


mysql> Delimiter $$
mysql> create function get_result(prno int)
    -> returns varchar(30)
    -> deterministic
    -> begin
    -> declare tper float;
    -> declare status varchar(30);
    -> select per into tper
    -> from student
    -> where rno = prno;
    -> if tper>= 40 then
    -> set status = 'Pass';
    -> else
    -> set status = 'FAIL';
    -> end if;
    -> return status;
    -> end$$
Query OK, 0 rows affected (0.07 sec)

mysql> delimiter ;
mysql>
mysql> select get_result(101);
+-----------------+
| get_result(101) |
+-----------------+
| Pass            |
+-----------------+
1 row in set (0.03 sec)

mysql> select get_result(102);
+-----------------+
| get_result(102) |
+-----------------+
| Pass            |
+-----------------+
1 row in set (0.00 sec)

mysql> CREATE FUNCTION get_result(prno INT)
    -> RETURNS VARCHAR(30)
    -> DETERMINISTIC
    -> BEGIN
    ->     DECLARE trno INT;
    ->     DECLARE tper FLOAT;
    ->     DECLARE grade VARCHAR(30);
    ->
    ->     SELECT id, marks
    ->     INTO trno, tper
    ->     FROM stud
    ->     WHERE id = prno;
    ->
    ->     IF trno IS NULL THEN
    ->         RETURN 'Student not found';
    ->     END IF;
    ->
    ->     IF tper IS NULL THEN
    ->         SET grade = 'Absent';
    ->     ELSEIF tper >= 75 THEN
    ->         SET grade = 'Distinction';
    ->     ELSEIF tper >= 60 THEN
    ->         SET grade = 'First Class';
    ->     ELSEIF tper >= 50 THEN
    ->         SET grade = 'Second Class';
    ->     ELSE
    ->         SET grade = 'Fail';
    ->     END IF;
    ->
    ->     RETURN grade;
    -> END$$
Query OK, 0 rows affected (0.01 sec)

mysql>
mysql> DELIMITER ;
mysql>
mysql> SELECT id, name, get_result(id) AS result
    -> FROM stud;
+----+-------+-------------+
| id | name  | result      |
+----+-------+-------------+
|  1 | John  | Distinction |
|  2 | Alice | Distinction |
|  3 | Bob   | Absent      |
|  4 | Emma  | Distinction |
+----+-------+-------------+
4 rows in set (0.01 sec)
