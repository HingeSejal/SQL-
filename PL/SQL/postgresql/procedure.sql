-- use void functions to perform actions without returning a value

CREATE or REPLACE FUNCTION msg()
returns void 
language plpgsql
as $$
begin
    raise notice 'Hello, this is a void function!';
    raise notice 'Techno Comp Academy';
    raise notice 'Pune';
end;
$$;

select msg();

NOTICE:  Hello, this is a void function!
NOTICE:  Techno Comp Academy
NOTICE:  Pune
 msg
-----

(1 row)

--also can write procedure in postgresql

CREATE or REPLACE PROCEDURE print_msg()
language plpgsql    
as $$
begin
    raise notice 'Hello, this is a procedure!';
    raise notice 'Techno Comp Academy';
    raise notice 'Pune';
end;
$$;

CALL print_msg();

NOTICE:  Hello, this is a procedure!
NOTICE:  Techno Comp Academy
NOTICE:  Pune
CALL

-------------------------------------------------
CREATE OR REPLACE PROCEDURE print_msg()
language plpgsql    
as $$
DECLARE
msg1 text := 'Hello, this is a procedure!';
msg2 text := 'Techno Comp Academy';
x int :=10;
begin
    raise notice '%s', msg1;
    raise notice '%s', msg2;
    raise notice 'Value of x: %', x;
end;
$$;

CALL print_msg();

NOTICE:  Hello, this is a procedure!s
NOTICE:  Techno Comp Academys
NOTICE:  Value of x: 10
CALL