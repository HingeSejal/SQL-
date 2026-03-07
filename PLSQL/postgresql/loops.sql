tcadb=# create or replace function sum_ofnums(n int)
tcadb-# returns int
tcadb-# language plpgsql
tcadb-# as $$
tcadb$# declare
tcadb$# ans int;
tcadb$# i int;
tcadb$# begin
tcadb$# ans:=0;
tcadb$# i:=1;
tcadb$#
tcadb$# while i<=n
tcadb$# loop
tcadb$# ans:= ans+i;
tcadb$# i:= i+1;
tcadb$# end loop;
tcadb$# return ans;
tcadb$# end;
tcadb$# $$;
CREATE FUNCTION
tcadb=#
tcadb=# select sum_ofnums(5);
 sum_ofnums
------------

         15
(1 row)


tcadb=# create or replace function sum_ofn_nums(n int)
tcadb-# returns int
tcadb-# language plpgsql
tcadb-# as $$
tcadb$# declare
tcadb$# ans int;
tcadb$# i int;
tcadb$# begin
tcadb$# ans:=0;
tcadb$# for i in 1..n
tcadb$# loop
tcadb$# ans:= ans+i;
tcadb$# end loop;
tcadb$# return ans;
tcadb$# end;
tcadb$# $$;
CREATE FUNCTION
tcadb=#
tcadb=# select sum_ofn_nums(10);
 sum_ofn_nums
--------------
           55
(1 row)


