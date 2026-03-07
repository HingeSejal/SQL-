---3 types of parameters in procedure

-- 1. IN parameter : 
-- input is given to PROCEDURE
-- used to pass value to procedure or function 
-- it is default parameter

-- 2. OUT parameter : 
-- used to return value to caller
-- it is used in 

--3. IN OUT parameter :
-- used to pass value to procedure ,modify it ,caller see updated value


CREATE OR REPLACE PROCEDURE show_student(IN pname VARCHAR)
LANGUAGE plpgsql
AS $$
BEGIN
    RAISE NOTICE 'Student Name is %', pname;
END;
$$;

CALL show_student('Rohit');

-----------------------------------------------

CREATE OR REPLACE PROCEDURE find_square(
    IN num INT,
    OUT result INT
)
LANGUAGE plpgsql
AS $$
BEGIN
    result := num * num;
END;
$$;

CALL find_square(5, result);

SELECT result;

-----------------------------------------------

CREATE OR REPLACE PROCEDURE increase_marks(
    INOUT marks INT
)
LANGUAGE plpgsql
AS $$
BEGIN
    marks := marks + 10;
END;
$$;

CALL increase_marks(50);