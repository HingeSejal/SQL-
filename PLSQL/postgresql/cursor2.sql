-- A cursor is used when sql query returns multiple rows and 
-- we need to process them one row at a time.

create or replace PROCEDURE update_student_grade()
language plpgsql 
as $$   
DECLARE
    stud_cursor CURSOR FOR SELECT rno , name , per , grade FROM stud;
    stud_rec record;
    tgrade varchar(20);
    
BEGIN
    OPEN stud_cursor;
    LOOP

    fetch stud_cursor into stud_rec;
    exit when not found;

    if stud_rec.per >= 70 then
        tgrade := 'Distinction' ;
    elseif stud_rec.per >= 60 then
        tgrade := 'First Class' ;
    elseif stud_rec.per >= 40 then
        tgrade := 'Pass' ;
    ELSE
        tgrade := 'Fail' ;
    END IF;

    update stud
    set grade=tgrade
    where rno = stud_rec.rno;
    END LOOP;

    close stud_cursor;
end;
$$ ;

mydb=# select * from stud;
 rno |  name  | per | grade
-----+--------+-----+-------
   1 | Rohit  |  95 |
   2 | Rahul  |  85 |
   3 | Ramesh |  55 |
   4 | Ramesh |  55 |
(4 rows)


mydb=# call update_student_grade();
CALL
mydb=# select * from stud;
 rno |  name  | per |    grade
-----+--------+-----+-------------
   1 | Rohit  |  95 | Distinction
   2 | Rahul  |  85 | Distinction
   3 | Ramesh |  55 | Pass
   4 | Ramesh |  55 | Pass
(4 rows)