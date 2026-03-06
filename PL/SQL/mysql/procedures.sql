
-- does not support void function
-- use procedures to perform actions without returning a value

DELIMITER $$
CREATE PROCEDURE print_msg()
deterministic
begin
    select 'Hello, this is a procedure!' as message;
    select 'Techno Comp Academy' as academy;
    select 'Pune' as location;
end $$

DELIMITER ;

CALL print_msg();

+-----------------------------+
| message                     |
+-----------------------------+
| Hello, this is a procedure! |
+-----------------------------+
1 row in set (0.02 sec)

+---------------------+
| academy             |
+---------------------+
| Techno Comp Academy |
+---------------------+
1 row in set (0.02 sec)

+----------+
| location |
+----------+
| Pune     |
+----------+
1 row in set (0.03 sec)

Query OK, 0 rows affected (0.03 sec)

------------------------------------------------

DELIMITER $$
CREATE PROCEDURE print_dt()
deterministic
begin
    DECLARE x int;
    SET x = 10;
    select 'Hello, this is a procedure!' as message;
    select x as value_of_x;
    select concat('Value of x: ', x) as message_with_value;
end $$

DELIMITER ;

CALL print_dt();

+-----------------------------+
| message                     |
+-----------------------------+
| Hello, this is a procedure! |
+-----------------------------+
1 row in set (0.00 sec)

+------------+
| value_of_x |
+------------+
|         10 |
+------------+
1 row in set (0.02 sec)

+--------------------+
| message_with_value |
+--------------------+
| Value of x: 10     |
+--------------------+
1 row in set (0.02 sec)

Query OK, 0 rows affected (0.03 sec)