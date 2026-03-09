 -- it is database obj
 -- temporary wokrarea in memory
 -- it is created when sql is executed inside procedure or functions
 
CREATE or replace procedure add_student(prno int, prname varchar, pper float)
LANGUAGE plpgsql    
AS $$
DECLARE
    tgrade varchar;
    cnt int;
BEGIN
    SELECT COUNT(*) INTO cnt FROM Candidate WHERE rno = prno;
    IF cnt > 0 THEN
        RAISE NOTICE 'Candidate % Record Already Exists', prno;
        RETURN; -- Exit the procedure
    END IF;

    IF pper > 90 THEN
        tgrade := 'Distinction';
    ELSIF pper >= 60 THEN      
        tgrade := 'First Class';
    ELSIF pper >= 40 THEN
        tgrade := 'Pass';
    ELSE
        tgrade := 'Fail';
    END IF;

    INSERT INTO Candidate (rno, name, per, grade) VALUES (prno, prname, pper, tgrade);

    RAISE NOTICE 'Candidate % Record Inserted Successfully', prname;
END
$$;

DELIMITER ;

