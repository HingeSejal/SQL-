-- Trigger is a action which is automatically performed when an event occurs in the database.
-- even can be
-- 1. Insert
-- 2. Update    
-- 3. Delete

-- Why use Trigger?
-- 1.Enforce Business Rules (e.g. prevent deletion of important records)
-- 2. Maintain Audit Trails (e.g. log changes to a table)
-- 3. Synchronize Data (e.g. update related tables automatically)
-- 4. Calculation of fields (e.g. calculate total price after inserting order details)

create or replace FUNCTION calc_grade()
returns trigger
language plpgsql
as $$
begin   
    IF new.per >= 90 THEN
        new.grade := 'A';
    ELSIF new.per >= 80 THEN
        new.grade := 'B';
    ELSIF new.per >= 70 THEN
        new.grade := 'C';
    ELSIF new.per >= 60 THEN
        new.grade := 'D';
    ELSE
        new.grade := 'Fail';
    END IF;

    RETURN new; --row modifed by trigger 
end;
$$;

CREATE Trigger trg_student_grade
before INSERT or UPDATE  --both at a time possible in postgresql
on stud
for each row
execute function calc_grade();

mydb=# insert into stud(rno,name,per) values(101,'Sejal',79);
INSERT 0 1
mydb=# select * from stud;
 rno | name  | per | grade
-----+-------+-----+-------
 101 | Sejal |  79 | C
(1 row)

mydb=# update stud set per = 85 where rno = 101;
UPDATE 1
mydb=# select * from stud;
 rno | name  | per | grade
-----+-------+-----+-------
 101 | Sejal |  85 | B
(1 row)

drop Trigger trg_student_grade on stud; 

----------------------------------------------

-- disable trigger incase of bulk insertion or updation to improve performance

ALTER TABLE stud DISABLE TRIGGER trg_student_grade;

-- enable trigger after bulk insertion or updation

ALTER TABLE stud ENABLE TRIGGER trg_student_grade;

