tcadb=# select * from bride ;
 bno | bname  | gno |   madate
-----+--------+-----+------------
   1 | Gadhi  |   1 | 2026-02-14
   2 | Mor    |   2 | 2026-02-12
   3 | Anjali |   4 | 2026-02-15
   4 | Nisha  |   3 | 2026-02-11
(4 rows)


tcadb=# select * from groom ;
 gno | name
-----+-------
   1 | Gadha
   2 | Mor
   3 | Rahul
   4 | Prem
(4 rows)


tcadb=# select groom.name Groom , bride.name Bride from groom join bride on groom.gno = bride.gno;
ERROR:  column bride.name does not exist
LINE 1: select groom.name Groom , bride.name Bride from groom join b...
                                  ^
HINT:  Perhaps you meant to reference the column "bride.bname".
tcadb=# select groom.name Groom , bride.bname Bride from groom join bride on groom.gno = bride.gno;
 groom | bride
-------+--------
 Gadha | Gadhi
 Mor   | Mor
 Rahul | Nisha
 Prem  | Anjali
(4 rows)


tcadb=# select groom.name Groom , bride.bname Bride , bride.madate Marriage_Date from groom join bride on groom.gno = bride.gno;
 groom | bride  | marriage_date
-------+--------+---------------
 Gadha | Gadhi  | 2026-02-14
 Mor   | Mor    | 2026-02-12
 Rahul | Nisha  | 2026-02-11
 Prem  | Anjali | 2026-02-15
(4 rows)


tcadb=# update bride  set bname='Morani' where bn0=2;
ERROR:  column "bn0" does not exist
LINE 1: update bride  set bname='Morani' where bn0=2;
                                               ^
HINT:  Perhaps you meant to reference the column "bride.bno".
tcadb=# update bride  set bride.bname='Morani' where bride.bn0=2;
ERROR:  column bride.bn0 does not exist
LINE 1: update bride  set bride.bname='Morani' where bride.bn0=2;
                                                     ^
HINT:  Perhaps you meant to reference the column "bride.bno".
tcadb=# update table bride  set bride.bname='Morani' where bride.bn0=2;
ERROR:  syntax error at or near "table"
LINE 1: update table bride  set bride.bname='Morani' where bride.bn0...
               ^
tcadb=# update bride  set bname='Morani' where bno=2;
UPDATE 1
tcadb=# select groom.name Groom , bride.bname Bride , bride.madate Marriage_Date from groom join bride on groom.gno = bride.gno;
 groom | bride  | marriage_date
-------+--------+---------------
 Gadha | Gadhi  | 2026-02-14
 Mor   | Morani | 2026-02-12
 Rahul | Nisha  | 2026-02-11
 Prem  | Anjali | 2026-02-15
(4 rows)


tcadb=# select * from groom join bride on groom.gno = bride.gno;
 gno | name  | bno | bname  | gno |   madate
-----+-------+-----+--------+-----+------------
   1 | Gadha |   1 | Gadhi  |   1 | 2026-02-14
   2 | Mor   |   2 | Morani |   2 | 2026-02-12
   3 | Rahul |   4 | Nisha  |   3 | 2026-02-11
   4 | Prem  |   3 | Anjali |   4 | 2026-02-15
(4 rows)


tcadb=# select groom.name Groom , bride.bname Bride , bride.madate Marriage_Date from groom ,bride where groom.gno = bride.gno and mdate between '2026-02-02' and '2026-02-14';
ERROR:  column "mdate" does not exist
LINE 1: ...from groom ,bride where groom.gno = bride.gno and mdate betw...
                                                             ^
HINT:  Perhaps you meant to reference the column "bride.madate".
tcadb=# select groom.name Groom , bride.bname Bride , bride.madate Marriage_Date from groom ,bride where groom.gno = bride.gno and madate between '2026-02-02' and '2026-02-14';
 groom | bride  | marriage_date
-------+--------+---------------
 Gadha | Gadhi  | 2026-02-14
 Rahul | Nisha  | 2026-02-11
 Mor   | Morani | 2026-02-12
(3 rows)


tcadb=# select count(*) from groom ,bride where groom.gno = bride.gno and mdate between '2026-02-02' and '2026-02-14';
ERROR:  column "mdate" does not exist
LINE 1: ...from groom ,bride where groom.gno = bride.gno and mdate betw...
                                                             ^
HINT:  Perhaps you meant to reference the column "bride.madate".
tcadb=# select count(*) from groom ,bride where groom.gno = bride.gno and madate between '2026-02-02' and '2026-02-14';
 count
-------
     3
(1 row)