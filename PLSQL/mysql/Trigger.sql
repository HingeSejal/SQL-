DELIMITER $$
CREATE TRIGGER before_insert_students
BEFORE INSERT 
ON Candidate
FOR EACH ROW
BEGIN
    SET NEW.grade = CASE
        WHEN NEW.per >= 95 THEN 'Distinction'
        WHEN NEW.per >= 90 THEN 'A'
        WHEN NEW.per >= 80 THEN 'B'
        WHEN NEW.per >= 70 THEN 'C'
        WHEN NEW.per >= 60 THEN 'D'
        ELSE 'Fail'
    END;
END$$
DELIMITER ;

INSERT INTO Candidate (rno, name, per) VALUES (101, 'Sejal', 79);

mysql> select * from candidate;
+-----+-------+------+-------+
| rno | name  | per  | grade |
+-----+-------+------+-------+
| 101 | Sejal |   79 | C     |
+-----+-------+------+-------+
1 row in set (0.00 sec)

-----------------------------------------------------------

DELIMITER $$
CREATE TRIGGER before_update_students
BEFORE UPDATE
ON Candidate
FOR EACH ROW
BEGIN
    SET NEW.grade = CASE
        WHEN NEW.per >= 95 THEN 'Distinction'
        WHEN NEW.per >= 90 THEN 'A'
        WHEN NEW.per >= 80 THEN 'B'
        WHEN NEW.per >= 70 THEN 'C'
        WHEN NEW.per >= 60 THEN 'D'
        ELSE 'Fail'
    END;
END$$
DELIMITER ;

mysql> UPDATE Candidate SET per = 98 WHERE rno = 101;
Query OK, 1 row affected (0.02 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> select * from candidate;
+-----+-------+------+-------------+
| rno | name  | per  | grade       |
+-----+-------+------+-------------+
| 101 | Sejal |   98 | Distinction |
+-----+-------+------+-------------+
1 row in set (0.00 sec)


--------------------------------------------

mysql> INSERT INTO Candidate (rno, name, per) VALUES (102, 'Rama', 89);
Query OK, 1 row affected (0.02 sec)

mysql> select * from candidate;
+-----+-------+------+-------------+
| rno | name  | per  | grade       |
+-----+-------+------+-------------+
| 101 | Sejal |   98 | Distinction |
| 102 | Rama  |   89 | B           |
+-----+-------+------+-------------+
2 rows in set (0.00 sec)

mysql> UPDATE Candidate SET per = 45 WHERE rno = 102;
Query OK, 1 row affected (0.02 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> select * from candidate;
+-----+-------+------+-------------+
| rno | name  | per  | grade       |
+-----+-------+------+-------------+
| 101 | Sejal |   98 | Distinction |
| 102 | Rama  |   45 | Fail        |
+-----+-------+------+-------------+
2 rows in set (0.00 sec)


--------------------------------------------

-- u can also use can also use insert and update both at a time

DELIMITER $$

CREATE TRIGGER before_insert_students
BEFORE INSERT 
ON Candidate
FOR EACH ROW
BEGIN
    SET NEW.grade = CASE
        WHEN NEW.per >= 95 THEN 'Distinction'
        WHEN NEW.per >= 90 THEN 'A'
        WHEN NEW.per >= 80 THEN 'B'
        WHEN NEW.per >= 70 THEN 'C'
        WHEN NEW.per >= 60 THEN 'D'
        ELSE 'Fail'
    END;
END$$

CREATE TRIGGER before_update_students
BEFORE UPDATE
ON Candidate
FOR EACH ROW
BEGIN
    SET NEW.grade = CASE
        WHEN NEW.per >= 95 THEN 'Distinction'
        WHEN NEW.per >= 90 THEN 'A'
        WHEN NEW.per >= 80 THEN 'B'
        WHEN NEW.per >= 70 THEN 'C'
        WHEN NEW.per >= 60 THEN 'D'
        ELSE 'Fail'
    END;
END$$
DELIMITER ;

---------------------------------------------

-- Q. is it good to use trigger in database for million insertion?
-- => No, because trigger will be executed for each row inserted and 
--    it will cause performance issues, takes longer time for data transmission. 
--    In such cases u can dissable trigger and perform bulk insert

-- To disable trigger

set @disable_trigger = 'before_insert_students';

