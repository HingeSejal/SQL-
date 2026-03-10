 -- it is database obj
 -- temporary wokrarea in memory
 -- it is created when sql is executed inside procedure or functions
 
create or replace PROCEDURE show_student()
language plpgsql 
as $$
DECLARE
    stud_cursor CURSOR FOR SELECT rno , name , grade FROM stud;
    stud_rec record;
BEGIN
    OPEN stud_cursor;
    LOOP
    fetch stud_cursor into stud_rec;
    exit when not found;
    RAISE NOTICE 'Rno: %, Name: %, Grade: %', stud_rec.rno, stud_rec.name, stud_rec.grade;
    END LOOP;

    close stud_cursor;
end;
$$ ;

call show_student();
NOTICE:  Rno: 1, Name: Rohit, Grade: Distinction
NOTICE:  Rno: 2, Name: Rahul, Grade: First Class
NOTICE:  Rno: 3, Name: Ramesh, Grade: Pass
NOTICE:  Rno: 4, Name: Ramesh, Grade: Pass
CALL
