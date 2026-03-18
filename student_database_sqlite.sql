sqlite> CREATE TABLE students(
(x1...> id INTEGER PRIMARY KEY,
(x1...> name TEXT,
(x1...> age INTEGER
(x1...> );
sqlite>
sqlite> INSERT INTO students VALUES(1,'Rahul',20);
sqlite> INSERT INTO students VALUES(2,'Amit',21);
sqlite>
sqlite> SELECT * FROM students;
1|Rahul|20
2|Amit|21
sqlite>
sqlite> .tables
students
sqlite> .schema students
CREATE TABLE students(
id INTEGER PRIMARY KEY,
name TEXT,
age INTEGER
);
sqlite> alter table students add column country varchar(20);
sqlite> select * from students;
1|Rahul|20|
2|Amit|21|
sqlite> .schema students
CREATE TABLE students(
id INTEGER PRIMARY KEY,
name TEXT,
age INTEGER
, country varchar(20));
sqlite> update table students set country='INDIA' where id in (1,2);
Parse error: near "table": syntax error
  update table students set country='INDIA' where id in (1,2);
         ^--- error here
sqlite> update students set country='INDIA' where id in (1,2);
sqlite> select * from students;
1|Rahul|20|INDIA
2|Amit|21|INDIA
sqlite> insert into students values (3,'Sejal',27,'Belgium');
sqlite> select * from students;
1|Rahul|20|INDIA
2|Amit|21|INDIA
3|Sejal|27|Belgium
sqlite> select distinct country from students;
INDIA
Belgium
sqlite> select count(distinct country) countrycount from students;
2
sqlite> select distinct country from students order by country asc;
Belgium
INDIA
sqlite> select distinct country from students order by country desc;
INDIA
Belgium
sqlite> select name from students where country like 'i%';
Rahul
Amit
sqlite> select name from students where country like '%a';
Rahul
Amit
sqlite> INSERT INTO students VALUES(4,'Sara',19,'Canada');
sqlite> INSERT INTO students VALUES(5,'Ali',23,'UAE');
sqlite> INSERT INTO students VALUES(6,'Chen',21,'China');
sqlite> INSERT INTO students VALUES(7,'Maria',22,'Spain');
sqlite> INSERT INTO students VALUES(8,'David',24,'UK');
sqlite> INSERT INTO students VALUES(9,'Anna',20,'Germany');
sqlite> INSERT INTO students VALUES(10,'Kenji',23,'Japan');
sqlite> INSERT INTO students VALUES(11,'Lucas',21,'Brazil');
sqlite> INSERT INTO students VALUES(12,'Emma',22,'Australia');
sqlite> INSERT INTO students VALUES(13,'Noah',20,'USA');
sqlite> INSERT INTO students VALUES(14,'Olivia',19,'Canada');
sqlite> INSERT INTO students VALUES(15,'Arjun',23,'India');
sqlite> INSERT INTO students VALUES(16,'Fatima',22,'UAE');
sqlite> INSERT INTO students VALUES(17,'Ivan',24,'Russia');
sqlite> INSERT INTO students VALUES(18,'Liam',21,'UK');
sqlite> INSERT INTO students VALUES(19,'Sophia',20,'Italy');
sqlite> INSERT INTO students VALUES(20,'Mateo',22,'Mexico');
sqlite> INSERT INTO students VALUES(21,'Aisha',23,'Pakistan');
sqlite> INSERT INTO students VALUES(22,'Yuki',21,'Japan');
sqlite> INSERT INTO students VALUES(23,'Carlos',24,'Spain');
sqlite> INSERT INTO students VALUES(24,'Elena',22,'Italy');
sqlite> INSERT INTO students VALUES(25,'Hassan',23,'Egypt');
sqlite> INSERT INTO students VALUES(26,'Omar',21,'Saudi Arabia');
sqlite> INSERT INTO students VALUES(27,'Nina',20,'Germany');
sqlite> INSERT INTO students VALUES(28,'Victor',25,'France');
sqlite> INSERT INTO students VALUES(29,'Julia',22,'Brazil');
sqlite> INSERT INTO students VALUES(30,'Peter',23,'USA');
sqlite> INSERT INTO students VALUES(31,'Ahmed',21,'Qatar');
sqlite> INSERT INTO students VALUES(32,'Riya',19,'India');
sqlite> INSERT INTO students VALUES(33,'Karan',24,'India');
sqlite> INSERT INTO students VALUES(34,'Sofia',22,'Spain');
sqlite> INSERT INTO students VALUES(35,'Daniel',23,'UK');
sqlite> INSERT INTO students VALUES(36,'Leo',21,'Argentina');
sqlite> INSERT INTO students VALUES(37,'Maya',20,'Nepal');
sqlite> INSERT INTO students VALUES(38,'Tenzin',22,'Bhutan');
sqlite> INSERT INTO students VALUES(39,'Kim',23,'South Korea');
sqlite> INSERT INTO students VALUES(40,'Park',21,'South Korea');
sqlite> INSERT INTO students VALUES(41,'George',24,'USA');
sqlite> INSERT INTO students VALUES(42,'Henry',22,'Canada');
sqlite> INSERT INTO students VALUES(43,'Isabella',20,'Mexico');
sqlite> INSERT INTO students VALUES(44,'Diego',23,'Mexico');
sqlite> INSERT INTO students VALUES(45,'Luis',21,'Chile');
sqlite> INSERT INTO students VALUES(46,'Pedro',22,'Peru');
sqlite> INSERT INTO students VALUES(47,'Aarav',19,'India');
sqlite> INSERT INTO students VALUES(48,'Meera',21,'India');
sqlite> INSERT INTO students VALUES(49,'Zara',22,'UAE');
sqlite> INSERT INTO students VALUES(50,'Bilal',23,'Pakistan');
sqlite> INSERT INTO students VALUES(51,'Noura',24,'Kuwait');
sqlite> INSERT INTO students VALUES(52,'Layla',20,'Jordan');
sqlite> INSERT INTO students VALUES(53,'Ethan',22,'USA');
sqlite> INSERT INTO students VALUES(54,'Mason',23,'USA');
sqlite> INSERT INTO students VALUES(55,'Logan',21,'Canada');
sqlite> INSERT INTO students VALUES(56,'Ava',20,'Australia');
sqlite> INSERT INTO students VALUES(57,'Mia',19,'Australia');
sqlite> INSERT INTO students VALUES(58,'Charlotte',22,'UK');
sqlite> INSERT INTO students VALUES(59,'Amelia',23,'UK');
sqlite> INSERT INTO students VALUES(60,'Harper',21,'USA');
sqlite> INSERT INTO students VALUES(61,'Evelyn',24,'Germany');
sqlite> INSERT INTO students VALUES(62,'Abigail',22,'France');
sqlite> INSERT INTO students VALUES(63,'Emily',21,'Italy');
sqlite> INSERT INTO students VALUES(64,'Ella',20,'Spain');
sqlite> INSERT INTO students VALUES(65,'Elizabeth',23,'Portugal');
sqlite> INSERT INTO students VALUES(66,'Camila',22,'Brazil');
sqlite> INSERT INTO students VALUES(67,'Luna',19,'Argentina');
sqlite> INSERT INTO students VALUES(68,'Aria',21,'Chile');
sqlite> INSERT INTO students VALUES(69,'Scarlett',22,'Mexico');
sqlite> INSERT INTO students VALUES(70,'Victoria',24,'Colombia');
sqlite> INSERT INTO students VALUES(71,'Madison',23,'Peru');
sqlite> INSERT INTO students VALUES(72,'Lily',20,'Bolivia');
sqlite> INSERT INTO students VALUES(73,'Grace',21,'India');
sqlite> INSERT INTO students VALUES(74,'Chloe',22,'India');
sqlite> INSERT INTO students VALUES(75,'Penelope',23,'Nepal');
sqlite> INSERT INTO students VALUES(76,'Riley',20,'Bhutan');
sqlite> INSERT INTO students VALUES(77,'Zoey',21,'Bangladesh');
sqlite> INSERT INTO students VALUES(78,'Nora',22,'Sri Lanka');
sqlite> INSERT INTO students VALUES(79,'Hazel',23,'Maldives');
sqlite> INSERT INTO students VALUES(80,'Aurora',24,'Thailand');
sqlite> INSERT INTO students VALUES(81,'Savannah',21,'Malaysia');
sqlite> INSERT INTO students VALUES(82,'Audrey',22,'Singapore');
sqlite> INSERT INTO students VALUES(83,'Brooklyn',20,'Indonesia');
sqlite> INSERT INTO students VALUES(84,'Bella',19,'Philippines');
sqlite> INSERT INTO students VALUES(85,'Claire',21,'Vietnam');
sqlite> INSERT INTO students VALUES(86,'Skylar',22,'South Korea');
sqlite> INSERT INTO students VALUES(87,'Lucy',23,'Japan');
sqlite> INSERT INTO students VALUES(88,'Paisley',20,'China');
sqlite> INSERT INTO students VALUES(89,'Everly',21,'Mongolia');
sqlite> INSERT INTO students VALUES(90,'Anna',22,'Russia');
sqlite> INSERT INTO students VALUES(91,'Caroline',23,'Ukraine');
sqlite> INSERT INTO students VALUES(92,'Genesis',24,'Poland');
sqlite> INSERT INTO students VALUES(93,'Kennedy',21,'Netherlands');
sqlite> INSERT INTO students VALUES(94,'Samantha',22,'Belgium');
sqlite> INSERT INTO students VALUES(95,'Allison',20,'Switzerland');
sqlite> INSERT INTO students VALUES(96,'Maya',21,'Austria');
sqlite> INSERT INTO students VALUES(97,'Sarah',22,'Sweden');
sqlite> INSERT INTO students VALUES(98,'Naomi',23,'Norway');
sqlite> INSERT INTO students VALUES(99,'Elena',24,'Finland');
sqlite> INSERT INTO students VALUES(100,'Ariana',20,'Denmark');
sqlite> INSERT INTO students VALUES(101,'Valentina',21,'Greece');
sqlite> INSERT INTO students VALUES(102,'Laila',22,'Turkey');
sqlite>
sqlite> SELECT COUNT(*) FROM students;
102
sqlite> SELECT * FROM students WHERE country='USA';
13|Noah|20|USA
30|Peter|23|USA
41|George|24|USA
53|Ethan|22|USA
54|Mason|23|USA
60|Harper|21|USA
sqlite> SELECT * FROM students WHERE country='INDIA';
1|Rahul|20|INDIA
2|Amit|21|INDIA
sqlite> SELECT * FROM students WHERE country='india';
sqlite> SELECT * FROM students WHERE country='India';
15|Arjun|23|India
32|Riya|19|India
33|Karan|24|India
47|Aarav|19|India
48|Meera|21|India
73|Grace|21|India
74|Chloe|22|India
sqlite> update students set country= case
   ...> when country='INDIA' then 'India'
   ...> else country
   ...> end;
sqlite> SELECT * FROM students WHERE country='India';
1|Rahul|20|India
2|Amit|21|India
15|Arjun|23|India
32|Riya|19|India
33|Karan|24|India
47|Aarav|19|India
48|Meera|21|India
73|Grace|21|India
74|Chloe|22|India
sqlite> SELECT country, COUNT(*)
   ...> FROM students
   ...> GROUP BY country;
Argentina|2
Australia|3
Austria|1
Bangladesh|1
Belgium|2
Bhutan|2
Bolivia|1
Brazil|3
Canada|4
Chile|2
China|2
Colombia|1
Denmark|1
Egypt|1
Finland|1
France|2
Germany|3
Greece|1
India|9
Indonesia|1
Italy|3
Japan|3
Jordan|1
Kuwait|1
Malaysia|1
Maldives|1
Mexico|4
Mongolia|1
Nepal|2
Netherlands|1
Norway|1
Pakistan|2
Peru|2
Philippines|1
Poland|1
Portugal|1
Qatar|1
Russia|2
Saudi Arabia|1
Singapore|1
South Korea|3
Spain|4
Sri Lanka|1
Sweden|1
Switzerland|1
Thailand|1
Turkey|1
UAE|3
UK|5
USA|6
Ukraine|1
Vietnam|1
sqlite>
sqlite> select * from students order by age desc limit 5;
3|Sejal|27|Belgium
28|Victor|25|France
8|David|24|UK
17|Ivan|24|Russia
23|Carlos|24|Spain
sqlite> select * from students order by age asc limit 5;
4|Sara|19|Canada
14|Olivia|19|Canada
32|Riya|19|India
47|Aarav|19|India
57|Mia|19|Australia
sqlite>
sqlite> update students set country = UPPER(country);
sqlite> select * from students order by age asc limit 5;
4|Sara|19|CANADA
14|Olivia|19|CANADA
32|Riya|19|INDIA
47|Aarav|19|INDIA
57|Mia|19|AUSTRALIA
sqlite> select * from students where age between 20 and 23;
1|Rahul|20|INDIA
2|Amit|21|INDIA
5|Ali|23|UAE
6|Chen|21|CHINA
7|Maria|22|SPAIN
9|Anna|20|GERMANY
10|Kenji|23|JAPAN
11|Lucas|21|BRAZIL
12|Emma|22|AUSTRALIA
13|Noah|20|USA
15|Arjun|23|INDIA
16|Fatima|22|UAE
18|Liam|21|UK
19|Sophia|20|ITALY
20|Mateo|22|MEXICO
21|Aisha|23|PAKISTAN
22|Yuki|21|JAPAN
24|Elena|22|ITALY
25|Hassan|23|EGYPT
26|Omar|21|SAUDI ARABIA
27|Nina|20|GERMANY
29|Julia|22|BRAZIL
30|Peter|23|USA
31|Ahmed|21|QATAR
34|Sofia|22|SPAIN
35|Daniel|23|UK
36|Leo|21|ARGENTINA
37|Maya|20|NEPAL
38|Tenzin|22|BHUTAN
39|Kim|23|SOUTH KOREA
40|Park|21|SOUTH KOREA
42|Henry|22|CANADA
43|Isabella|20|MEXICO
44|Diego|23|MEXICO
45|Luis|21|CHILE
46|Pedro|22|PERU
48|Meera|21|INDIA
49|Zara|22|UAE
50|Bilal|23|PAKISTAN
52|Layla|20|JORDAN
53|Ethan|22|USA
54|Mason|23|USA
55|Logan|21|CANADA
56|Ava|20|AUSTRALIA
58|Charlotte|22|UK
59|Amelia|23|UK
60|Harper|21|USA
62|Abigail|22|FRANCE
63|Emily|21|ITALY
64|Ella|20|SPAIN
65|Elizabeth|23|PORTUGAL
66|Camila|22|BRAZIL
68|Aria|21|CHILE
69|Scarlett|22|MEXICO
71|Madison|23|PERU
72|Lily|20|BOLIVIA
73|Grace|21|INDIA
74|Chloe|22|INDIA
75|Penelope|23|NEPAL
76|Riley|20|BHUTAN
77|Zoey|21|BANGLADESH
78|Nora|22|SRI LANKA
79|Hazel|23|MALDIVES
81|Savannah|21|MALAYSIA
82|Audrey|22|SINGAPORE
83|Brooklyn|20|INDONESIA
85|Claire|21|VIETNAM
86|Skylar|22|SOUTH KOREA
87|Lucy|23|JAPAN
88|Paisley|20|CHINA
89|Everly|21|MONGOLIA
90|Anna|22|RUSSIA
91|Caroline|23|UKRAINE
93|Kennedy|21|NETHERLANDS
94|Samantha|22|BELGIUM
95|Allison|20|SWITZERLAND
96|Maya|21|AUSTRIA
97|Sarah|22|SWEDEN
98|Naomi|23|NORWAY
100|Ariana|20|DENMARK
101|Valentina|21|GREECE
102|Laila|22|TURKEY
sqlite> select * from students where name like 'a%' and country='BELGIUM';
sqlite> select * from students where name like 's%' and country='BELGIUM';
3|Sejal|27|BELGIUM
94|Samantha|22|BELGIUM
sqlite> select avg(age) from students ;
21.7352941176471
sqlite> select round(avg(age),2) from students ;
21.74
sqlite> SELECT country, ROUND(AVG(age), 2) AS avg_age
   ...> FROM students
   ...> GROUP BY country;
ARGENTINA|20.0
AUSTRALIA|20.33
AUSTRIA|21.0
BANGLADESH|21.0
BELGIUM|24.5
BHUTAN|21.0
BOLIVIA|20.0
BRAZIL|21.67
CANADA|20.25
CHILE|21.0
CHINA|20.5
COLOMBIA|24.0
DENMARK|20.0
EGYPT|23.0
FINLAND|24.0
FRANCE|23.5
GERMANY|21.33
GREECE|21.0
INDIA|21.11
INDONESIA|20.0
ITALY|21.0
JAPAN|22.33
JORDAN|20.0
KUWAIT|24.0
MALAYSIA|21.0
MALDIVES|23.0
MEXICO|21.75
MONGOLIA|21.0
NEPAL|21.5
NETHERLANDS|21.0
NORWAY|23.0
PAKISTAN|23.0
PERU|22.5
PHILIPPINES|19.0
POLAND|24.0
PORTUGAL|23.0
QATAR|21.0
RUSSIA|23.0
SAUDI ARABIA|21.0
SINGAPORE|22.0
SOUTH KOREA|22.0
SPAIN|22.0
SRI LANKA|22.0
SWEDEN|22.0
SWITZERLAND|20.0
THAILAND|24.0
TURKEY|22.0
UAE|22.33
UK|22.6
UKRAINE|23.0
USA|22.17
VIETNAM|21.0
sqlite> select max(age) from students ;
27
sqlite> select min(age) from students ;
19
sqlite> select name from students where name like '%ar%';
Sara
Maria
Arjun
Carlos
Omar
Karan
Park
Aarav
Zara
Charlotte
Harper
Aria
Scarlett
Skylar
Caroline
Sarah
Ariana
sqlite> select count(distinct country) from students;
52
sqlite> select name from students where country!='INDIA';
Sejal
Sara
Ali
Chen
Maria
David
Anna
Kenji
Lucas
Emma
Noah
Olivia
Fatima
Ivan
Liam
Sophia
Mateo
Aisha
Yuki
Carlos
Elena
Hassan
Omar
Nina
Victor
Julia
Peter
Ahmed
Sofia
Daniel
Leo
Maya
Tenzin
Kim
Park
George
Henry
Isabella
Diego
Luis
Pedro
Zara
Bilal
Noura
Layla
Ethan
Mason
Logan
Ava
Mia
Charlotte
Amelia
Harper
Evelyn
Abigail
Emily
Ella
Elizabeth
Camila
Luna
Aria
Scarlett
Victoria
Madison
Lily
Penelope
Riley
Zoey
Nora
Hazel
Aurora
Savannah
Audrey
Brooklyn
Bella
Claire
Skylar
Lucy
Paisley
Everly
Anna
Caroline
Genesis
Kennedy
Samantha
Allison
Maya
Sarah
Naomi
Elena
Ariana
Valentina
Laila
sqlite> select name from students where country in ('USA','UK');
David
Noah
Liam
Peter
Daniel
George
Ethan
Mason
Charlotte
Amelia
Harper
sqlite> select name from students where length(name)>5;
Olivia
Fatima
Sophia
Carlos
Hassan
Victor
Daniel
Tenzin
George
Isabella
Charlotte
Amelia
Harper
Evelyn
Abigail
Elizabeth
Camila
Scarlett
Victoria
Madison
Penelope
Aurora
Savannah
Audrey
Brooklyn
Claire
Skylar
Paisley
Everly
Caroline
Genesis
Kennedy
Samantha
Allison
Ariana
Valentina
sqlite> select * from students order by age desc limit 1 offset 1;
28|Victor|25|FRANCE
sqlite> select * from students order by age desc limit 2;
3|Sejal|27|BELGIUM
28|Victor|25|FRANCE
28|Victor|25|FRANCE
sqlite> select country from students order by count(name) desc limit 1;
Parse error: misuse of aggregate: count()
  select country from students order by count(name) desc limit 1;
                          error here ---^
sqlite> select distint country from students group by country order by count(names) limit 1;
Parse error: no such column: distint
  select distint country from students group by country order by count(names) li
         ^--- error here
sqlite> select distint country from students group by country order by count(name) limit 1;
Parse error: no such column: distint
  select distint country from students group by country order by count(name) lim
         ^--- error here
sqlite> select distint country from students where country=max(name);
Parse error: no such column: distint
  select distint country from students where country=max(name);
         ^--- error here
sqlite> select distint country from students where max(name);
Parse error: no such column: distint
  select distint country from students where max(name);
         ^--- error here
sqlite> SELECT country, COUNT(*) AS student_count
   ...> FROM students
   ...> GROUP BY country
   ...> ORDER BY student_count DESC
   ...> LIMIT 1;
INDIA|9
sqlite> SELECT country, COUNT(*)
   ...> FROM students
   ...> GROUP BY country;
ARGENTINA|2
AUSTRALIA|3
AUSTRIA|1
BANGLADESH|1
BELGIUM|2
BHUTAN|2
BOLIVIA|1
BRAZIL|3
CANADA|4
CHILE|2
CHINA|2
COLOMBIA|1
DENMARK|1
EGYPT|1
FINLAND|1
FRANCE|2
GERMANY|3
GREECE|1
INDIA|9
INDONESIA|1
ITALY|3
JAPAN|3
JORDAN|1
KUWAIT|1
MALAYSIA|1
MALDIVES|1
MEXICO|4
MONGOLIA|1
NEPAL|2
NETHERLANDS|1
NORWAY|1
PAKISTAN|2
PERU|2
PHILIPPINES|1
POLAND|1
PORTUGAL|1
QATAR|1
RUSSIA|2
SAUDI ARABIA|1
SINGAPORE|1
SOUTH KOREA|3
SPAIN|4
SRI LANKA|1
SWEDEN|1
SWITZERLAND|1
THAILAND|1
TURKEY|1
UAE|3
UK|5
UKRAINE|1
USA|6
VIETNAM|1
sqlite> SELECT name, COUNT(*) AS count
   ...> FROM students
   ...> GROUP BY name
   ...> HAVING COUNT(*) > 1;
Anna|2
Elena|2
Maya|2
sqlite> SELECT COUNT(*)
   ...> FROM (
(x1...>     SELECT name
(x1...>     FROM students
(x1...>     GROUP BY name
(x1...>     HAVING COUNT(*) > 1
(x1...> );
3
sqlite> SELECT COUNT(*)
   ...> FROM (
(x1...>     SELECT name
(x1...>     FROM students
(x1...>     GROUP BY name
(x1...>     HAVING COUNT(*) > 1
(x1...> );
3
sqlite> select trim(country) from students;
INDIA
INDIA
BELGIUM
CANADA
UAE
CHINA
SPAIN
UK
GERMANY
JAPAN
BRAZIL
AUSTRALIA
USA
CANADA
INDIA
UAE
RUSSIA
UK
ITALY
MEXICO
PAKISTAN
JAPAN
SPAIN
ITALY
EGYPT
SAUDI ARABIA
GERMANY
FRANCE
BRAZIL
USA
QATAR
INDIA
INDIA
SPAIN
UK
ARGENTINA
NEPAL
BHUTAN
SOUTH KOREA
SOUTH KOREA
USA
CANADA
MEXICO
MEXICO
CHILE
PERU
INDIA
INDIA
UAE
PAKISTAN
KUWAIT
JORDAN
USA
USA
CANADA
AUSTRALIA
AUSTRALIA
UK
UK
USA
GERMANY
FRANCE
ITALY
SPAIN
PORTUGAL
BRAZIL
ARGENTINA
CHILE
MEXICO
COLOMBIA
PERU
BOLIVIA
INDIA
INDIA
NEPAL
BHUTAN
BANGLADESH
SRI LANKA
MALDIVES
THAILAND
MALAYSIA
SINGAPORE
INDONESIA
PHILIPPINES
VIETNAM
SOUTH KOREA
JAPAN
CHINA
MONGOLIA
RUSSIA
UKRAINE
POLAND
NETHERLANDS
BELGIUM
SWITZERLAND
AUSTRIA
SWEDEN
NORWAY
FINLAND
DENMARK
GREECE
TURKEY
sqlite> SELECT COUNT(*)
   ...> FROM (
(x1...>     SELECT name
(x1...>     FROM students
(x1...>     GROUP BY name
(x1...>     HAVING COUNT(*) > 1
(x1...> );
3
