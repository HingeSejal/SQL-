postgres=# create database EmployeeSystem
postgres-# ;
CREATE DATABASE
postgres=# \c employeesystem;
You are now connected to database "employeesystem" as user "postgres".

employeesystem=# create table departments(
employeesystem(# dept_id serial primary key ,
employeesystem(# dept_name varchar(50) unique not null
employeesystem(# );
CREATE TABLE

employeesystem=# create table employees(
employeesystem(# emp_id serial primary key,
employeesystem(# name varchar(50),
employeesystem(# age int,
employeesystem(# salary int,
employeesystem(# dept_id int,
employeesystem(# foreign key (dept_id) references departments(dept_id)
employeesystem(# );
CREATE TABLE
                   ^
employeesystem=# create table employee_details (
employeesystem(# emp_id int primary key,
employeesystem(# address text,
employeesystem(# phone varchar(15) check(phone ~ '^[7-9]{1}[0-9]{9}$'),
employeesystem(# foreign key(emp_id) references employees(emp_id)
employeesystem(# );
CREATE TABLE

employeesystem=# create table projects (
employeesystem(# prj_id serial primary key,
employeesystem(# prj_name varchar(50)
employeesystem(# );
CREATE TABLE

employeesystem=# create table employee_prj (
employeesystem(# emp_id int ,
employeesystem(# prj_id int ,
employeesystem(# primary key(emp_id , prj_id),
employeesystem(# foreign key(emp_id) references employees(emp_id),
employeesystem(# foreign key(prj_id) references projects(prj_id)
employeesystem(# );
CREATE TABLE

employeesystem=# INSERT INTO departments (dept_name) VALUES
employeesystem-# ('HR'), ('IT'), ('Finance');
INSERT 0 3
employeesystem=# INSERT INTO employees (name, age, salary, dept_id) VALUES
employeesystem-# ('Rahul',25,50000,1),
employeesystem-# ('Sejal',28,60000,2),
employeesystem-# ('Deepa',26,55000,2),
employeesystem-# ('Girish',30,70000,3);
INSERT 0 4
employeesystem=# INSERT INTO employee_details VALUES
employeesystem-# (1,'Mumbai','9237658499'),
employeesystem-# (2,'Delhi','8068974758'),
employeesystem-# (3,'Pune','7787453527'),
employeesystem-# (4,'Gondiya','9979249623');
INSERT 0 4
employeesystem=# INSERT INTO projects (project_name) VALUES
employeesystem-# ('AI System'), ('Bank App'), ('HR Portal');
ERROR:  column "project_name" of relation "projects" does not exist
LINE 1: INSERT INTO projects (project_name) VALUES
                              ^
employeesystem=# INSERT INTO projects (prj_name) VALUES
 mployeesystem-# ('AI System'), ('Bank App'), ('Swades Portal');
INSERT 0 3
employeesystem=# INSERT INTO employee_prj VALUES
employeesystem-# (1,1),(1,2),
employeesystem-# (2,2),(3,1),
employeesystem-# (4,3);
INSERT 0 5

employeesystem=# \d
                   List of relations
 Schema |          Name           |   Type   |  Owner
--------+-------------------------+----------+----------
 public | departments             | table    | postgres
 public | departments_dept_id_seq | sequence | postgres
 public | employee_details        | table    | postgres
 public | employee_prj            | table    | postgres
 public | employees               | table    | postgres
 public | employees_emp_id_seq    | sequence | postgres
 public | projects                | table    | postgres
 public | projects_prj_id_seq     | sequence | postgres
(8 rows)


employeesystem=# select * from departments;
 dept_id | dept_name
---------+-----------
       1 | HR
       2 | IT
       3 | Finance
(3 rows)


employeesystem=# select * from employee_details;
 emp_id | address |   phone
--------+---------+------------
      1 | Mumbai  | 9237658499
      2 | Delhi   | 8068974758
      3 | Pune    | 7787453527
      4 | Gondiya | 9979249623
(4 rows)


employeesystem=# select * from employee_prj;
 emp_id | prj_id
--------+--------
      1 |      1
      1 |      2
      2 |      2
      3 |      1
      4 |      3
(5 rows)


employeesystem=# select * from employees;;
 emp_id |  name  | age | salary | dept_id
--------+--------+-----+--------+---------
      1 | Rahul  |  25 |  50000 |       1
      2 | Sejal  |  28 |  60000 |       2
      3 | Deepa  |  26 |  55000 |       2
      4 | Girish |  30 |  70000 |       3
(4 rows)


employeesystem=# select * from projects;
 prj_id |   prj_name
--------+---------------
      1 | AI System
      2 | Bank App
      3 | Swades Portal
(3 rows)

employeesystem=# CREATE INDEX idx_emp_name ON employees(name);
CREATE INDEX
employeesystem=# CREATE INDEX idx_salary ON employees(salary);
CREATE INDEX

employeesystem=# SELECT
employeesystem-#     e.emp_id,
employeesystem-#     e.name,
employeesystem-#     d.dept_name,
employeesystem-#     ep.prj_id,
employeesystem-#     p.prj_name,
employeesystem-#     ed.address,
employeesystem-#     ed.phone
employeesystem-# FROM employees e
employeesystem-# LEFT JOIN departments d
employeesystem-#     ON e.dept_id = d.dept_id
employeesystem-# LEFT JOIN employee_prj ep
employeesystem-#     ON e.emp_id = ep.emp_id
employeesystem-# LEFT JOIN projects p
employeesystem-#     ON ep.prj_id = p.prj_id
employeesystem-# LEFT JOIN employee_details ed
employeesystem-#     ON e.emp_id = ed.emp_id;
 emp_id |  name  | dept_name | prj_id |   prj_name    | address |   phone
--------+--------+-----------+--------+---------------+---------+------------
      1 | Rahul  | HR        |      1 | AI System     | Mumbai  | 9237658499
      1 | Rahul  | HR        |      2 | Bank App      | Mumbai  | 9237658499
      3 | Deepa  | IT        |      1 | AI System     | Pune    | 7787453527
      2 | Sejal  | IT        |      2 | Bank App      | Delhi   | 8068974758
      4 | Girish | Finance   |      3 | Swades Portal | Gondiya | 9979249623
(5 rows)


employeesystem=# SELECT
employeesystem-#     e.emp_id,
employeesystem-#     e.name,
employeesystem-#     d.dept_name,
employeesystem-#     STRING_AGG(p.prj_name, ', ') AS projects,
employeesystem-#     ed.address,
employeesystem-#     ed.phone
employeesystem-# FROM employees e
employeesystem-# LEFT JOIN departments d
employeesystem-#     ON e.dept_id = d.dept_id
employeesystem-# LEFT JOIN employee_prj ep
employeesystem-#     ON e.emp_id = ep.emp_id
employeesystem-# LEFT JOIN projects p
employeesystem-#     ON ep.prj_id = p.prj_id
employeesystem-# LEFT JOIN employee_details ed
employeesystem-#     ON e.emp_id = ed.emp_id
employeesystem-# WHERE e.name = 'Rahul'
employeesystem-# GROUP BY
employeesystem-#     e.emp_id,
employeesystem-#     e.name,
employeesystem-#     d.dept_name,
employeesystem-#     ed.address,
employeesystem-#     ed.phone;
 emp_id | name  | dept_name |      projects       | address |   phone
--------+-------+-----------+---------------------+---------+------------
      1 | Rahul | HR        | AI System, Bank App | Mumbai  | 9237658499
(1 row)


employeesystem=# SELECT
employeesystem-#     e.emp_id,
employeesystem-#     e.name,
employeesystem-#     d.dept_name,
employeesystem-#     STRING_AGG(p.prj_name, ', ') AS projects,
employeesystem-#     ed.address,
employeesystem-#     ed.phone
employeesystem-# FROM employees e
employeesystem-# LEFT JOIN departments d
employeesystem-#     ON e.dept_id = d.dept_id
employeesystem-# LEFT JOIN employee_prj ep
employeesystem-#     ON e.emp_id = ep.emp_id
employeesystem-# LEFT JOIN projects p
employeesystem-#     ON ep.prj_id = p.prj_id
employeesystem-# LEFT JOIN employee_details ed
employeesystem-#     ON e.emp_id = ed.emp_id
employeesystem-# GROUP BY
employeesystem-#     e.emp_id,
employeesystem-#     e.name,
employeesystem-#     d.dept_name,
employeesystem-#     ed.address,
employeesystem-#     ed.phone
employeesystem-# ORDER BY e.emp_id;
 emp_id |  name  | dept_name |      projects       | address |   phone
--------+--------+-----------+---------------------+---------+------------
      1 | Rahul  | HR        | AI System, Bank App | Mumbai  | 9237658499
      2 | Sejal  | IT        | Bank App            | Delhi   | 8068974758
      3 | Deepa  | IT        | AI System           | Pune    | 7787453527
      4 | Girish | Finance   | Swades Portal       | Gondiya | 9979249623
(4 rows)


employeesystem=# select d.dept_name ,
employeesystem-# sum(e.salary) as total_salary
employeesystem-# from employees e
employeesystem-# join departments d
employeesystem-# on e.dept_id = d.dept_id
employeesystem-# group by d.dept_name;
 dept_name | total_salary
-----------+--------------
 Finance   |        70000
 HR        |        50000
 IT        |       115000
(3 rows)

employeesystem=# SELECT
employeesystem-#     d.dept_name,
employeesystem-#     ROUND(AVG(e.salary) , 2) AS avg_salary
employeesystem-# FROM employees e
employeesystem-# JOIN departments d
employeesystem-#     ON e.dept_id = d.dept_id
employeesystem-# GROUP BY d.dept_name;
 dept_name | avg_salary
-----------+------------
 Finance   |   70000.00
 HR        |   50000.00
 IT        |   57500.00
(3 rows)

employeesystem=# SELECT
employeesystem-#     d.dept_name,
employeesystem-#     COUNT(e.emp_id) AS total_employees,
employeesystem-#     SUM(e.salary) AS total_salary,
employeesystem-#     ROUND(AVG(e.salary),2) AS avg_salary
employeesystem-# FROM employees e
employeesystem-# JOIN departments d
employeesystem-#     ON e.dept_id = d.dept_id
employeesystem-# GROUP BY d.dept_name
employeesystem-# ORDER BY d.dept_name;
 dept_name | total_employees | total_salary | avg_salary
-----------+-----------------+--------------+------------
 Finance   |               1 |        70000 |   70000.00
 HR        |               1 |        50000 |   50000.00
 IT        |               2 |       115000 |   57500.00
(3 rows)

employeesystem=# CREATE OR REPLACE FUNCTION total_salary(dept INT)
employeesystem-# RETURNS INT
employeesystem-# LANGUAGE plpgsql
employeesystem-# AS $$
employeesystem$# DECLARE total INT;
employeesystem$# BEGIN
employeesystem$#     SELECT SUM(salary) INTO total
employeesystem$#     FROM employees
employeesystem$#     WHERE dept_id = dept;
employeesystem$#
employeesystem$#     RETURN total;
employeesystem$# END;
employeesystem$# $$ ;
CREATE FUNCTION

employeesystem=# SELECT total_salary(2);
 total_salary
--------------
       115000
(1 row)


employeesystem=# CREATE TABLE salary_log (
employeesystem(#     emp_id INT,
employeesystem(#     old_salary INT,
employeesystem(#     new_salary INT,
employeesystem(#     changed_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
employeesystem(# );
CREATE TABLE

employeesystem=# \d salary_log;
                              Table "public.salary_log"
   Column   |            Type             | Collation | Nullable |      Default
------------+-----------------------------+-----------+----------+-------------------
 emp_id     | integer                     |           |          |
 old_salary | integer                     |           |          |
 new_salary | integer                     |           |          |
 changed_at | timestamp without time zone |           |          | CURRENT_TIMESTAMP


employeesystem=# CREATE OR REPLACE FUNCTION log_salary_change()
employeesystem-# RETURNS TRIGGER 
employeesystem-# LANGUAGE plpgsql
employeesystem-# AS $$
employeesystem$# BEGIN
employeesystem$#     INSERT INTO salary_log(emp_id, old_salary, new_salary)
employeesystem$#     VALUES (OLD.emp_id, OLD.salary, NEW.salary);
employeesystem$#
employeesystem$#     RETURN NEW;
employeesystem$# END;
employeesystem$# $$;
CREATE FUNCTION

employeesystem=# CREATE TRIGGER salary_update_trigger
employeesystem-# BEFORE UPDATE ON employees
employeesystem-# FOR EACH ROW
employeesystem-# WHEN (OLD.salary IS DISTINCT FROM NEW.salary)
employeesystem-# EXECUTE FUNCTION log_salary_change();
CREATE TRIGGER

employeesystem=# update employees
employeesystem-# set salary = salary +5000 ;
UPDATE 4

employeesystem=# update employees
employeesystem-# set salary = salary +5000
employeesystem-# WHERE emp_id = 1;
UPDATE 1

employeesystem=# select * from salary_log;
 emp_id | old_salary | new_salary |         changed_at
--------+------------+------------+----------------------------
      1 |      50000 |      55000 | 2026-03-20 11:10:59.125173
      2 |      60000 |      65000 | 2026-03-20 11:10:59.125173
      3 |      55000 |      60000 | 2026-03-20 11:10:59.125173
      4 |      70000 |      75000 | 2026-03-20 11:10:59.125173
      1 |      55000 |      60000 | 2026-03-20 11:11:44.426286
(5 rows)


employeesystem=# select * from employees;
 emp_id |  name  | age | salary | dept_id
--------+--------+-----+--------+---------
      2 | Sejal  |  28 |  65000 |       2
      3 | Deepa  |  26 |  60000 |       2
      4 | Girish |  30 |  75000 |       3
      1 | Rahul  |  25 |  60000 |       1
(4 rows)

employeesystem=# CREATE VIEW employee_summary AS
employeesystem-# SELECT e.name, d.dept_name, e.salary
employeesystem-# FROM employees e
employeesystem-# JOIN departments d ON e.dept_id = d.dept_id;
CREATE VIEW

employeesystem=# SELECT * FROM employee_summary;
  name  | dept_name | salary
--------+-----------+--------
 Rahul  | HR        |  60000
 Deepa  | IT        |  60000
 Sejal  | IT        |  65000
 Girish | Finance   |  75000
(4 rows)

employeesystem=# SELECT emp_id, COUNT(prj_id) projects
employeesystem-# FROM employee_prj
employeesystem-# GROUP BY emp_id
employeesystem-# HAVING COUNT(prj_id) > 1;
 emp_id | projects
--------+----------
      1 |        2
(1 row)

--working on more data ADDITIONAL DATA

employeesystem=# INSERT INTO departments (dept_name) VALUES
employeesystem-# ('Marketing'),
employeesystem-# ('Sales'),
employeesystem-# ('Operations'),
employeesystem-# ('Support');
INSERT 0 4

employeesystem=# INSERT INTO employees (name, age, salary, dept_id) VALUES
employeesystem-# ('Neha',27,52000,4),
employeesystem-# ('Rohan',29,61000,5),
employeesystem-# ('Priya',26,58000,6),
employeesystem-# ('Vikas',31,72000,7),
employeesystem-# ('Anjali',24,48000,1),
employeesystem-# ('Kunal',28,65000,2),
employeesystem-# ('Sneha',25,53000,3),
employeesystem-# ('Arjun',30,70000,2),
employeesystem-# ('Pooja',27,56000,4),
employeesystem-# ('Manish',32,75000,5);
INSERT 0 10

employeesystem=# INSERT INTO employee_details VALUES
employeesystem-# (5,'Nagpur','9876543210'),
employeesystem-# (6,'Bangalore','9123456780'),
employeesystem-# (7,'Hyderabad','9988776655'),
employeesystem-# (8,'Kolkata','9090909090'),
employeesystem-# (9,'Jaipur','9191919191'),
employeesystem-# (10,'Lucknow','9898989898'),
employeesystem-# (11,'Indore','9000000001'),
employeesystem-# (12,'Bhopal','9000000002'),
employeesystem-# (13,'Surat','9000000003'),
employeesystem-# (14,'Ahmedabad','9000000004');
INSERT 0 10

employeesystem=# INSERT INTO projects (prj_name) VALUES
employeesystem-# ('E-commerce Platform'),
employeesystem-# ('CRM System'),
employeesystem-# ('Mobile App'),
employeesystem-# ('Data Analytics'),
employeesystem-# ('Cloud Migration');
INSERT 0 5

employeesystem=# INSERT INTO employee_prj VALUES
employeesystem-# (5,4),(5,5),
employeesystem-# (6,1),(6,3),
employeesystem-# (7,2),(7,4),
employeesystem-# (8,3),(8,5),
employeesystem-# (9,1),(9,2),
employeesystem-# (10,4),(10,5),
employeesystem-# (11,2),(11,3),
employeesystem-# (12,1),(12,4),
employeesystem-# (13,3),(13,5),
employeesystem-# (14,2),(14,4);
INSERT 0 20

employeesystem=# SELECT
employeesystem-#     e.emp_id,
employeesystem-#     e.name,
employeesystem-#     d.dept_name,
employeesystem-#     STRING_AGG(p.prj_name, ', ') AS projects,
employeesystem-#     e.salary,
employeesystem-#     ed.address,
employeesystem-#     ed.phone
employeesystem-# FROM employees e
employeesystem-# LEFT JOIN departments d
employeesystem-#     ON e.dept_id = d.dept_id
employeesystem-# LEFT JOIN employee_prj ep
employeesystem-#     ON e.emp_id = ep.emp_id
employeesystem-# LEFT JOIN projects p
employeesystem-#     ON ep.prj_id = p.prj_id
employeesystem-# LEFT JOIN employee_details ed
employeesystem-#     ON e.emp_id = ed.emp_id
employeesystem-# GROUP BY
employeesystem-#     e.emp_id,
employeesystem-#     e.name,
employeesystem-#     d.dept_name,
employeesystem-#     ed.address,
employeesystem-#     ed.phone
employeesystem-# ORDER BY e.emp_id;
 emp_id |  name  | dept_name  |            projects             | salary |  address  |   phone
--------+--------+------------+---------------------------------+--------+-----------+------------
      1 | Rahul  | HR         | AI System, Bank App             |  60000 | Mumbai    | 9237658499
      2 | Sejal  | IT         | Bank App                        |  65000 | Delhi     | 8068974758
      3 | Deepa  | IT         | AI System                       |  60000 | Pune      | 7787453527
      4 | Girish | Finance    | Swades Portal                   |  75000 | Gondiya   | 9979249623
      5 | Neha   | Marketing  | E-commerce Platform, CRM System |  52000 | Nagpur    | 9876543210
      6 | Rohan  | Sales      | AI System, Swades Portal        |  61000 | Bangalore | 9123456780
      7 | Priya  | Operations | Bank App, E-commerce Platform   |  58000 | Hyderabad | 9988776655
      8 | Vikas  | Support    | Swades Portal, CRM System       |  72000 | Kolkata   | 9090909090
      9 | Anjali | HR         | AI System, Bank App             |  48000 | Jaipur    | 9191919191
     10 | Kunal  | IT         | E-commerce Platform, CRM System |  65000 | Lucknow   | 9898989898
     11 | Sneha  | Finance    | Bank App, Swades Portal         |  53000 | Indore    | 9000000001
     12 | Arjun  | IT         | AI System, E-commerce Platform  |  70000 | Bhopal    | 9000000002
     13 | Pooja  | Marketing  | Swades Portal, CRM System       |  56000 | Surat     | 9000000003
     14 | Manish | Sales      | Bank App, E-commerce Platform   |  75000 | Ahmedabad | 9000000004
(14 rows)

employeesystem=# SELECT e.dept_id, d.dept_name, COUNT(*) AS deptvise_emp_count
employeesystem-# FROM employees e
employeesystem-# JOIN departments d ON e.dept_id = d.dept_id
employeesystem-# GROUP BY e.dept_id, d.dept_name;
 dept_id | dept_name  | deptvise_emp_count
---------+------------+--------------------
       1 | HR         |                  2
       2 | IT         |                  4
       3 | Finance    |                  2
       4 | Marketing  |                  2
       5 | Sales      |                  2
       6 | Operations |                  1
       7 | Support    |                  1
(7 rows)

employeesystem=# SELECT e.dept_id, d.dept_name, SUM(e.salary) AS deptvise_salary
employeesystem-# FROM employees e
employeesystem-# JOIN departments d ON e.dept_id = d.dept_id
employeesystem-# GROUP BY e.dept_id, d.dept_name
employeesystem-# ORDER BY deptvise_salary DESC;
 dept_id | dept_name  | deptvise_salary
---------+------------+-----------------
       2 | IT         |          260000
       5 | Sales      |          136000
       3 | Finance    |          128000
       4 | Marketing  |          108000
       1 | HR         |          108000
       7 | Support    |           72000
       6 | Operations |           58000
(7 rows)

employeesystem=# SELECT e.dept_id, d.dept_name, SUM(e.salary) AS deptvise_salary
employeesystem-# FROM employees e
employeesystem-# JOIN departments d ON e.dept_id = d.dept_id
employeesystem-# GROUP BY e.dept_id, d.dept_name
employeesystem-# ORDER BY deptvise_salary DESC
employeesystem-# LIMIT 1;
 dept_id | dept_name | deptvise_salary
---------+-----------+-----------------
       2 | IT        |          260000
(1 row)

employeesystem=# SELECT *
employeesystem-# FROM employees e
employeesystem-# JOIN departments d ON e.dept_id = d.dept_id
employeesystem-# ORDER BY e.emp_id;
 emp_id |  name  | age | salary | dept_id | dept_id | dept_name 
--------+--------+-----+--------+---------+---------+------------
      1 | Rahul  |  25 |  60000 |       1 |       1 | HR
      2 | Sejal  |  28 |  65000 |       2 |       2 | IT
      3 | Deepa  |  26 |  60000 |       2 |       2 | IT
      4 | Girish |  30 |  75000 |       3 |       3 | Finance
      5 | Neha   |  27 |  52000 |       4 |       4 | Marketing
      6 | Rohan  |  29 |  61000 |       5 |       5 | Sales
      7 | Priya  |  26 |  58000 |       6 |       6 | Operations      8 | Vikas  |  31 |  72000 |       7 |       7 | Support
      9 | Anjali |  24 |  48000 |       1 |       1 | HR
     10 | Kunal  |  28 |  65000 |       2 |       2 | IT
     11 | Sneha  |  25 |  53000 |       3 |       3 | Finance
     12 | Arjun  |  30 |  70000 |       2 |       2 | IT
     13 | Pooja  |  27 |  56000 |       4 |       4 | Marketing
     14 | Manish |  32 |  75000 |       5 |       5 | Sales
(14 rows)

employeesystem=# SELECT e.*
employeesystem-# FROM employees e
employeesystem-# JOIN departments d ON e.dept_id = d.dept_id
employeesystem-# WHERE d.dept_name = 'IT';
 emp_id | name  | age | salary | dept_id
--------+-------+-----+--------+---------
      2 | Sejal |  28 |  65000 |       2
      3 | Deepa |  26 |  60000 |       2
     10 | Kunal |  28 |  65000 |       2
     12 | Arjun |  30 |  70000 |       2
(4 rows)

employeesystem=# SELECT COUNT(*) FROM employees;
 count
-------
    14
(1 row)

employeesystem=# SELECT *
employeesystem-# FROM (
employeesystem(#     SELECT *, ROW_NUMBER() OVER (PARTITION BY dept_id ORDER BY salary DESC) rn
employeesystem(#     FROM employees
employeesystem(# ) t
employeesystem-# WHERE rn <= 2;
 emp_id |  name  | age | salary | dept_id | rn
--------+--------+-----+--------+---------+----
      1 | Rahul  |  25 |  60000 |       1 |  1
      9 | Anjali |  24 |  48000 |       1 |  2
     12 | Arjun  |  30 |  70000 |       2 |  1
     10 | Kunal  |  28 |  65000 |       2 |  2
      4 | Girish |  30 |  75000 |       3 |  1
     11 | Sneha  |  25 |  53000 |       3 |  2
     13 | Pooja  |  27 |  56000 |       4 |  1
      5 | Neha   |  27 |  52000 |       4 |  2
     14 | Manish |  32 |  75000 |       5 |  1
      6 | Rohan  |  29 |  61000 |       5 |  2
      7 | Priya  |  26 |  58000 |       6 |  1
      8 | Vikas  |  31 |  72000 |       7 |  1
(12 rows)
