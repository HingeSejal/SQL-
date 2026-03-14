DELIMITER $$

CREATE procedure update_student()

BEGIN
    declare tid int ;
    declare tname varchar(20);
    declare tmarks int; 
    declare tgrade varchar(20);
    
    declare is_done int default false;

    DECLARE stud_cursor CURSOR for 
        select id , name , marks , grade from stud;

    declare continue handler for not found 
        set is_done =true;

    open stud_cursor;
    TCA:LOOP

        fetch stud_cursor into tid , tname , tmarks , tgrade;

        if is_done then
            leave TCA;
        end if;

        if tmarks >= 70 then
            set tgrade = 'Distinction' ;
        elseif tmarks >= 60 then
            set tgrade = 'First Class' ;
        elseif tmarks >= 40 then
            set tgrade = 'Pass' ;
        else
            set tgrade = 'Fail' ;
        end if;

        update stud
        set grade=tgrade
        where id = tid;

    END LOOP;
    CLOSE stud_cursor;
End $$

delimiter ;

mysql> CALL update_student();
Query OK, 0 rows affected (0.02 sec)

mysql> select * from stud;
+----+-------+------+------------------+-------+-------------+
| id | name  | age  | email            | marks | grade       |
+----+-------+------+------------------+-------+-------------+
|  1 | John  |   20 | john@example.com |    85 | Distinction |
|  2 | Alice |   22 | NULL             |    90 | Distinction |
|  3 | Bob   | NULL | bob@example.com  |  NULL | Fail        |
|  4 | Emma  |   21 | NULL             |    88 | Distinction |
+----+-------+------+------------------+-------+-------------+
4 rows in set (0.00 sec)
