DELIMITER $$
CREATE PROCEDURE mult_by_two(in pnum int,out ans int)
begin
    set ans = pnum * 2;
end $$
DELIMITER ;

call mult_by_two(5, @result);

select @result;
+---------+
| @result |
+---------+
|      10 |
+---------+
1 row in set (0.00 sec)

------------------------------------------------

DELIMITER $$
CREATE PROCEDURE  demo_inout(inout num int)
begin
    set num = num * 2;
end $$
DELIMITER ;

set @num = 5;
call demo_inout(@num);

+--------+
| @value |
+--------+
|     10 |
+--------+
1 row in set (0.00 sec)

------------------------------------------------