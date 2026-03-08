 -- it is database obj
 -- temporary wokrarea in memory
 -- it is created when sql is executed inside procedure or functions

 DELIMITER $$
 create procedure add_student(in prno int, in prname varchar(30), in pper float)
 tca:BEGIN
        DECLARE tgrade varchar(30);
        DECLARE cnt int;    
        
        SELECT COUNT(*) INTO cnt FROM Candidate WHERE rno = prno;
        
        IF cnt > 0 THEN
            SELECT CONCAT('Candidate', prno, ' Record Already Exists') AS message;
            LEAVE TCA; -- Exit the procedure
        END IF;
        
        IF pper > 90 THEN
            SET tgrade = 'Distinction';
        ELSEIF pper >= 60 THEN      
            SET tgrade = 'First Class';
        ELSEIF pper >= 40 THEN
            SET tgrade = 'Pass';
        ELSE
            SET tgrade = 'Fail';
        END IF;
        
        INSERT INTO Candidate (rno, name, per, grade) VALUES (prno, prname, pper, tgrade);
        
        SELECT CONCAT('Candidate ', prname, ' Record Inserted Successfully') AS message;
    END $$