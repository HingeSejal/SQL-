tcadb=# create or replace function msg()
tcadb-# returns varchar
tcadb-# language plpgsql
tcadb-# as $$
tcadb$# Begin
tcadb$# return 'Hello JI';
tcadb$# end;
tcadb$# $$;
CREATE FUNCTION
tcadb=# select msg();
   msg
----------
 Hello JI
(1 row)


tcadb=# select msg() as messager;
 messager
----------
 Hello JI
(1 row)


tcadb=# create or replace function msg()
tcadb-# returns varchar
tcadb-# language pplpgsql
tcadb-# as $$
tcadb$# begin
tcadb$# return 'Hello yrrro';
tcadb$# end;
tcadb$# $$;
ERROR:  language "pplpgsql" does not exist
tcadb=# create or replace function msg()
tcadb-# returns varchar
tcadb-# language plpgsql
tcadb-# as $$
tcadb$# begin
tcadb$# return 'Hello yrrro';
tcadb$# end;
tcadb$# $$;
CREATE FUNCTION
tcadb=# select msg() as messager;
  messager
-------------
 Hello yrrro
(1 row)


tcadb=# \df
                       List of functions
 Schema | Name | Result data type  | Argument data types | Type
--------+------+-------------------+---------------------+------
 public | msg  | character varying |                     | func
(1 row)

                          ^
tcadb=# CREATE OR REPLACE FUNCTION maximum(a INT, b INT)
tcadb-# RETURNS INT
tcadb-# LANGUAGE plpgsql
tcadb-# AS $$
tcadb$# DECLARE
tcadb$#     m INT;
tcadb$# BEGIN
tcadb$#     IF a > b THEN
tcadb$#         m := a;
tcadb$#     ELSE
tcadb$#         m := b;
tcadb$#     END IF;
tcadb$#
tcadb$#     RETURN m;
tcadb$# END;
tcadb$# $$;
CREATE FUNCTION
tcadb=# SELECT maximum(10, 20);
 maximum
---------
      20
(1 row)


tcadb=# SELECT maximum(20, 20);
 maximum
---------
      20
(1 row)

            ^
tcadb=# CREATE OR REPLACE FUNCTION maximum(a INT, b INT)
tcadb-# RETURNS INT
tcadb-# LANGUAGE plpgsql
tcadb-# AS $$
tcadb$# BEGIN
tcadb$#     IF a > b THEN
tcadb$#         RETURN a;
tcadb$#     ELSE
tcadb$#         RETURN b;
tcadb$#     END IF;
tcadb$#
tcadb$# END;
tcadb$# $$;
CREATE FUNCTION
tcadb=# SELECT maximum(20, 20);
 maximum
---------
      20
(1 row)


tcadb=# SELECT maximum(20, 10);
 maximum
---------
      20
(1 row)


tcadb=# SELECT maximum(20, 50);
 maximum
---------
      50
(1 row)


tcadb=# CREATE OR REPLACE FUNCTION maximum(a INT, b INT)
tcadb-# RETURNS INT
tcadb-# LANGUAGE plpgsql
tcadb-# AS $$
tcadb$# DECLARE
tcadb$#     m INT := 0;
tcadb$# BEGIN
tcadb$#     IF a > b THEN
tcadb$#         m := a;
tcadb$#     ELSE
tcadb$#         m := b;
tcadb$#     END IF;
tcadb$#
tcadb$#     RETURN m;
tcadb$# END;
tcadb$# $$;
CREATE FUNCTION
tcadb=# SELECT maximum(20, 50);
 maximum
---------
      50
(1 row)


tcadb=# SELECT maximum(20, 20);
 maximum
---------
      20
(1 row)