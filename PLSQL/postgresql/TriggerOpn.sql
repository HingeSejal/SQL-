create or REPLACE FUNCTION check_salary()
returns trigger
language plpgsql
as $$
begin
    IF new.salary<old.salary THEN
        RAISE EXCEPTION 'new salary % is lower than existing salary % for employee %',new.salary,old.salary,old.eid;    
    END IF;

    RETURN new; --row to be updated
end;
$$;


CREATE trigger trg_check_salary
before update on employee
for each row
execute function check_salary();

-- test trigger
mydb=# select * from employee;
 eid | ename | salary | designation
-----+-------+--------+-------------
   3 | Rama  |  90000 | co
   2 | RIna  |  70000 | cto
   1 | sejal |  80000 | ceo
(3 rows)

mydb=# update employee set salary = 75000 where eid = 1;
ERROR:  new salary 75000 is lower than existing salary 80000 for employee 1
CONTEXT:  PL/pgSQL function check_salary() line 4 at RAISE

mydb=# update employee set salary = 85000 where eid = 1;
UPDATE 1

mydb=# select * from employee;
 eid | ename | salary | designation
-----+-------+--------+-------------
   3 | Rama  |  90000 | co
   2 | RIna  |  70000 | cto
   1 | sejal |  85000 | ceo
(3 rows)

-----------------------------------------------

CREATE or REPLACE FUNCTION prevent_ceo_delete()
returns trigger
language plpgsql
as $$
begin
    IF old.designation = 'CEO' THEN
        RAISE EXCEPTION 'Deletion of CEO record is not allowed!';
    END IF;

    RETURN old; --row to be deleted
end;
$$;


CREATE trigger trg_prevent_ceo_delete
before delete on employee
for each row
execute function prevent_ceo_delete();