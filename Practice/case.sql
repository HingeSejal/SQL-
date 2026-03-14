-- impact multiple records

update student
set grade = CASE 
                WHEN per>=70 THEN  'Distinction'
                WHEN per>=60 THEN 'First Class'
                WHEN per>=40 THEN 'Pass'
                ELSE 'Fail'
            END;

--------------------------------------------------

-- if u have data with entries of Mumbai and Bombay and u want to update all the entries of Bombay to Mumbai
--- use case statement

update student
set city = CASE 
                WHEN city='Bombay' THEN 'Mumbai'
                WHEN city='Banglore' THEN 'Bengaluru'
                ELSE city
            END;