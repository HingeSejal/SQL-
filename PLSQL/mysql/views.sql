create view stud_per as 
select rno , name , per from stud;

CREATE view top_students as
select rno, name, per from stud where per >= 90;    


create view stude_status as
select rno, name, per
CASE 
    WHEN per >= 90 THEN 'A'
    WHEN per >= 80 THEN 'B'
    WHEN per >= 70 THEN 'C'
    WHEN per >= 60 THEN 'D'
    ELSE 'Fail'
END as grade
from stud;


DROP View top_students;