 -- it is database obj
 -- temporary wokrarea in memory
 -- it is created when sql is executed inside procedure or functions
 -- Resultset rs = "select * from candidate"
 -- Cursor rs = "select * from candidate"

 --result stored in by cursor is called active_set
 --CURSOR is used to fetch data one by one from active_set

 --Select Query That we write to fetch the data is cursor query

 --Two types of cursor 
    --1. implicit cursor - automatically created by mysql when we execute any sql query inside procedure or function
    --2. explicit cursor - we have to create explicitly by using cursor statement

 
DELIMITER $$

CREATE procedure show_student()

BEGIN
    declare tid int ;
    declare tname varchar(20);
    declare tmarks int; 
    
    declare is_done int default false;

    DECLARE stud_cursor CURSOR for 
        select id , name , marks from stud;

    declare continue handler for not found 
        set is_done =true;

    open stud_cursor;
    TCA:LOOP

        fetch stud_cursor into tid , tname , tmarks;

        if is_done then
            leave TCA;
        end if;

        select concat(' ID :',tid , ' Name:',tname , ' Marks:',tmarks) as msg;

    END LOOP;
    CLOSE stud_cursor;
End $$

delimiter ;

CALL show_student();

+------------------------+
| msg                    |
+------------------------+
| ID :1 Name:John Marks:85 |
+------------------------+
1 row in set (0.00 sec)

+-------------------------+
| msg                     |
+-------------------------+
| ID :2 Name:Alice Marks:90 |
+-------------------------+
1 row in set (0.01 sec)

+------+
| msg  |
+------+
| NULL |
+------+
1 row in set (0.01 sec)

+------------------------+
| msg                    |
+------------------------+
| ID :4 Name:Emma Marks:88 |
+------------------------+
1 row in set (0.01 sec)

Query OK, 0 rows affected (0.01 sec)