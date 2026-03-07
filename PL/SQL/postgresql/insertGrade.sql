create Table Stud (
    rno int primary key,
    name varchar(30),
    per float,
    grade varchar(30)
);

create or replace procedure insert_grade(prno int , pname varchar(30) , pper float)
language plpgsql
as $$   
declare 
tper float;
tgrade varchar(30);
cnt int;
begin   
    SELECT count(*) into cnt from Stud where rno = prno;
    if cnt > 0 then
        raise notice 'student % Record Already Exists', prno;
        return; --out of procedure
    end if;
    
    if pper>90 then
        tgrade := 'Distiction';
    elsif pper>=60 then
        tgrade := 'First Class';        
    elsif pper>=40 then
        tgrade := 'Pass';
    else
        tgrade := 'Fail';
    end if; 
    insert into Stud values (prno , pname , pper , tgrade);
    raise notice 'student % Record Inserted Successfully', pname;
end;
$$;         

call insert_grade(1 , 'Rohit' , 95);
call insert_grade(2 , 'Rahul' , 85);
call insert_grade(3 , 'Ramesh' , 55);

select * from Stud;

 rno |  name  | per |    grade
-----+--------+-----+-------------
   1 | Rohit  |  95 | Distiction
   2 | Rahul  |  85 | First Class
   3 | Ramesh |  55 | Pass
(3 rows)

----------------------------------------------

--insert grade on existing record

ALTER TABLE stud
ADD COLUMN grade VARCHAR(30);

CREATE OR REPLACE PROCEDURE update_grade()
LANGUAGE plpgsql
AS $$
BEGIN
    UPDATE stud
    SET grade =
        CASE
            WHEN per > 90 THEN 'Distinction'
            WHEN per >= 60 THEN 'First Class'
            WHEN per >= 40 THEN 'Pass'
            ELSE 'Fail'
        END;

    RAISE NOTICE 'Grades updated successfully';
END;
$$;

CALL update_grade();

select * from stud;

 rno |  name  | per |    grade
-----+--------+-----+-------------
   1 | Rohit  |  95 | Distinction
   2 | Rahul  |  85 | First Class
   3 | Ramesh |  55 | Pass
   4 | Ramesh |  55 | Pass
(4 rows)

-----------------------------------------------

