create Table Student (
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
begin
    select per into tper from student where rno = 101;
    if tper >= 40 then
        set tgrade = 'Pass';
    else
        set tgrade = 'Fail';
    end if;
    update student set grade = tgrade where rno = 101;
end;

select * from students;


