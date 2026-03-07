create Table Candidate (
    rno int primary key,
    name varchar(30),
    per float,
    grade varchar(30)
);

DELIMITER $$
CREATE PROCEDURE insert_grade(prno int, prname varchar(30), pper float)
TCA:BEGIN
    DECLARE tgrade varchar(30);
    DECLARE cnt int;    
    
    SELECT COUNT(*) INTO cnt FROM Candidate WHERE rno = prno;
    
    IF cnt > 0 THEN
        SELECT CONCAT('Candidate', prno, ' Record Already Exists') AS message;
        LEAVE TCA; -- Exit the procedure
    END IF;
    
    IF pper > 90 THEN
        SET tgrade = 'Distinction';
    ELSEIF pper >= 60 THEN      
        SET tgrade = 'First Class';
    ELSEIF pper >= 40 THEN
        SET tgrade = 'Pass';
    ELSE
        SET tgrade = 'Fail';
    END IF;
    
    INSERT INTO Candidate (rno, name, per, grade) VALUES (prno, prname, pper, tgrade);
    
    SELECT CONCAT('Candidate ', prname, ' Record Inserted Successfully') AS message;
END $$
DELIMITER ;

call  insert_grade(1, 'Rohit', 95);
call  insert_grade(2, 'Rahul', 85);    
call  insert_grade(3, 'Ramesh', 55);

mysql> call  insert_grade(1, 'Rohit', 95);
+----------------------------------------------+
| message                                      |
+----------------------------------------------+
| Candidate Rohit Record Inserted Successfully |
+----------------------------------------------+
1 row in set (0.03 sec)

Query OK, 0 rows affected (0.03 sec)

mysql> call  insert_grade(2, 'Rahul', 85);
+----------------------------------------------+
| message                                      |
+----------------------------------------------+
| Candidate Rahul Record Inserted Successfully |
+----------------------------------------------+
1 row in set (0.00 sec)

Query OK, 0 rows affected (0.01 sec)

mysql> call  insert_grade(3, 'Ramesh', 55);
+-----------------------------------------------+
| message                                       |
+-----------------------------------------------+
| Candidate Ramesh Record Inserted Successfully |
+-----------------------------------------------+
1 row in set (0.02 sec)

Query OK, 0 rows affected (0.03 sec)

select * from candidate;
+-----+--------+------+-------------+
| rno | name   | per  | grade       |
+-----+--------+------+-------------+
|   1 | Rohit  |   95 | Distinction |
|   2 | Rahul  |   85 | First Class |
|   3 | Ramesh |   55 | Pass        |
+-----+--------+------+-------------+

-------------------------------------------------------

