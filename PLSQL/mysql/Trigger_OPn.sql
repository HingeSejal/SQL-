DELIMITER $$
create TRIGGER check_salary()
before update on employee
for each row
begin
    IF new.salary < old.salary THEN
        signal sqlstate '45000' set message_text = concat('new salary ', new.salary, ' is lower than existing salary ', old.salary, ' for employee ', old.eid);    
    END IF;
end$$

DELIMITER ;

----------------------------------------------

DELIMITER $$
create TRIGGER trg_prevent_ceo_delete
before delete on employee
for each row
begin
    IF old.designation = 'CEO' THEN
        signal sqlstate '45000' 
        set message_text = 'Deletion of CEO record is not allowed!';  
    END IF;
end$$

DELIMITER ;