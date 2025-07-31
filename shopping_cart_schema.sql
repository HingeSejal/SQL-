sudo mysql -u root -p
[sudo] password for prl: 
Enter password: 
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 8
Server version: 8.0.42-0ubuntu0.20.04.1 (Ubuntu)

Copyright (c) 2000, 2025, Oracle and/or its affiliates.

Oracle is a registered trademark of Oracle Corporation and/or its
affiliates. Other names may be trademarks of their respective
owners.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

mysql> create table shopping_cart(cust_id int primary key auto_increment,cust_name varchar(50) not null,product varchar(100) not null );
ERROR 1046 (3D000): No database selected
mysql> create database shopping_cart
    -> ;
Query OK, 1 row affected (0.17 sec)

mysql> use shopping_cart;
Database changed
mysql> create table Shopsy(cust_id int primary key auto_increment,cust_name varchar(50) not null,product varchar(100) not null );
Query OK, 0 rows affected (0.85 sec)

mysql> desc Shopsy;
+-----------+--------------+------+-----+---------+----------------+
| Field     | Type         | Null | Key | Default | Extra          |
+-----------+--------------+------+-----+---------+----------------+
| cust_id   | int          | NO   | PRI | NULL    | auto_increment |
| cust_name | varchar(50)  | NO   |     | NULL    |                |
| product   | varchar(100) | NO   |     | NULL    |                |
+-----------+--------------+------+-----+---------+----------------+
3 rows in set (0.01 sec)

mysql> alter table Shopsy add cust_add varchar(100);
Query OK, 0 rows affected (2.12 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> alter table Shopsy add product_cost int(20);
Query OK, 0 rows affected, 1 warning (2.06 sec)
Records: 0  Duplicates: 0  Warnings: 1

mysql> alter table Shopsy add product_details varchar(20);
Query OK, 0 rows affected (1.64 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> desc Shopsy;
+-----------------+--------------+------+-----+---------+----------------+
| Field           | Type         | Null | Key | Default | Extra          |
+-----------------+--------------+------+-----+---------+----------------+
| cust_id         | int          | NO   | PRI | NULL    | auto_increment |
| cust_name       | varchar(50)  | NO   |     | NULL    |                |
| product         | varchar(100) | NO   |     | NULL    |                |
| cust_add        | varchar(100) | YES  |     | NULL    |                |
| product_cost    | int          | YES  |     | NULL    |                |
| product_details | varchar(20)  | YES  |     | NULL    |                |
+-----------------+--------------+------+-----+---------+----------------+
6 rows in set (0.00 sec)

mysql> alter table Shopsy rename product to order;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'to order' at line 1
mysql> rename table product to order;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'order' at line 1
mysql> rename table Shopsy to Platform;
Query OK, 0 rows affected (0.83 sec)

mysql> desc Platform
    -> ;
+-----------------+--------------+------+-----+---------+----------------+
| Field           | Type         | Null | Key | Default | Extra          |
+-----------------+--------------+------+-----+---------+----------------+
| cust_id         | int          | NO   | PRI | NULL    | auto_increment |
| cust_name       | varchar(50)  | NO   |     | NULL    |                |
| product         | varchar(100) | NO   |     | NULL    |                |
| cust_add        | varchar(100) | YES  |     | NULL    |                |
| product_cost    | int          | YES  |     | NULL    |                |
| product_details | varchar(20)  | YES  |     | NULL    |                |
+-----------------+--------------+------+-----+---------+----------------+
6 rows in set (0.00 sec)

mysql> rename table Platform to Order_Details;
Query OK, 0 rows affected (1.21 sec)

mysql> desc Order_Details;
+-----------------+--------------+------+-----+---------+----------------+
| Field           | Type         | Null | Key | Default | Extra          |
+-----------------+--------------+------+-----+---------+----------------+
| cust_id         | int          | NO   | PRI | NULL    | auto_increment |
| cust_name       | varchar(50)  | NO   |     | NULL    |                |
| product         | varchar(100) | NO   |     | NULL    |                |
| cust_add        | varchar(100) | YES  |     | NULL    |                |
| product_cost    | int          | YES  |     | NULL    |                |
| product_details | varchar(20)  | YES  |     | NULL    |                |
+-----------------+--------------+------+-----+---------+----------------+
6 rows in set (0.00 sec)

mysql> alter table Order_Details add quantity int;
Query OK, 0 rows affected (2.11 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> desc Order_Details;
+-----------------+--------------+------+-----+---------+----------------+
| Field           | Type         | Null | Key | Default | Extra          |
+-----------------+--------------+------+-----+---------+----------------+
| cust_id         | int          | NO   | PRI | NULL    | auto_increment |
| cust_name       | varchar(50)  | NO   |     | NULL    |                |
| product         | varchar(100) | NO   |     | NULL    |                |
| cust_add        | varchar(100) | YES  |     | NULL    |                |
| product_cost    | int          | YES  |     | NULL    |                |
| product_details | varchar(20)  | YES  |     | NULL    |                |
| quantity        | int          | YES  |     | NULL    |                |
+-----------------+--------------+------+-----+---------+----------------+
7 rows in set (0.01 sec)

mysql> alter table Order_Details rename column quantity to prod_quantity;
Query OK, 0 rows affected (1.03 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> desc Order_Details;
+-----------------+--------------+------+-----+---------+----------------+
| Field           | Type         | Null | Key | Default | Extra          |
+-----------------+--------------+------+-----+---------+----------------+
| cust_id         | int          | NO   | PRI | NULL    | auto_increment |
| cust_name       | varchar(50)  | NO   |     | NULL    |                |
| product         | varchar(100) | NO   |     | NULL    |                |
| cust_add        | varchar(100) | YES  |     | NULL    |                |
| product_cost    | int          | YES  |     | NULL    |                |
| product_details | varchar(20)  | YES  |     | NULL    |                |
| prod_quantity   | int          | YES  |     | NULL    |                |
+-----------------+--------------+------+-----+---------+----------------+
7 rows in set (0.00 sec)

mysql> alter table Order_Details add payment_type varchar(20);
Query OK, 0 rows affected (1.74 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> alter table Order_Details add acc_no int(20) primary key;
ERROR 1068 (42000): Multiple primary key defined
mysql> alter table Order_Details add acc_no int(20) ;
Query OK, 0 rows affected, 1 warning (2.17 sec)
Records: 0  Duplicates: 0  Warnings: 1

mysql> alter table Order_Details add primary key (acc_no) ;
ERROR 1068 (42000): Multiple primary key defined
mysql> desc Order_Details;
+-----------------+--------------+------+-----+---------+----------------+
| Field           | Type         | Null | Key | Default | Extra          |
+-----------------+--------------+------+-----+---------+----------------+
| cust_id         | int          | NO   | PRI | NULL    | auto_increment |
| cust_name       | varchar(50)  | NO   |     | NULL    |                |
| product         | varchar(100) | NO   |     | NULL    |                |
| cust_add        | varchar(100) | YES  |     | NULL    |                |
| product_cost    | int          | YES  |     | NULL    |                |
| product_details | varchar(20)  | YES  |     | NULL    |                |
| prod_quantity   | int          | YES  |     | NULL    |                |
| payment_type    | varchar(20)  | YES  |     | NULL    |                |
| acc_no          | int          | YES  |     | NULL    |                |
+-----------------+--------------+------+-----+---------+----------------+
9 rows in set (0.00 sec)

mysql> alter table Order_Details add prod_cost not null  ;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'not null' at line 1
mysql> alter table Order_Details add prod_cost not null;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'not null' at line 1
mysql> ALTER TABLE Order_Details ADD prod_cost INT NOT NULL;
Query OK, 0 rows affected (1.85 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> desc Order_Details;
+-----------------+--------------+------+-----+---------+----------------+
| Field           | Type         | Null | Key | Default | Extra          |
+-----------------+--------------+------+-----+---------+----------------+
| cust_id         | int          | NO   | PRI | NULL    | auto_increment |
| cust_name       | varchar(50)  | NO   |     | NULL    |                |
| product         | varchar(100) | NO   |     | NULL    |                |
| cust_add        | varchar(100) | YES  |     | NULL    |                |
| product_cost    | int          | YES  |     | NULL    |                |
| product_details | varchar(20)  | YES  |     | NULL    |                |
| prod_quantity   | int          | YES  |     | NULL    |                |
| payment_type    | varchar(20)  | YES  |     | NULL    |                |
| acc_no          | int          | YES  |     | NULL    |                |
| prod_cost       | int          | NO   |     | NULL    |                |
+-----------------+--------------+------+-----+---------+----------------+
10 rows in set (0.00 sec)

mysql> ALTER TABLE Order_Details ADD acc_no INT NOT NULL;
ERROR 1060 (42S21): Duplicate column name 'acc_no'
mysql> create table customers( customer_id int auto increment primary key,
    -> name varchar(100) not null,
    -> email varchar(100) unique not null,
    -> phone varchar(11),
    -> address test);
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'auto increment primary key,
name varchar(100) not null,
email varchar(100) uniqu' at line 1
mysql> create table customers( customer_id int(100), name varchar(100) not null,
 email varchar(100) unique not null, phone varchar(11), address test);
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'test)' at line 1
mysql> create table customers( customer_id int(100), name varchar(100) not null, email varchar(100) unique not null, phone varchar(11), address text);
Query OK, 0 rows affected, 1 warning (0.65 sec)

mysql> show tables;
+-------------------------+
| Tables_in_shopping_cart |
+-------------------------+
| Order_Details           |
| customers               |
+-------------------------+
2 rows in set (0.00 sec)

mysql> create table categories(
    -> cat_id int auto increament primary key,
    -> cat_name varchar(50) not null);
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'auto increament primary key,
cat_name varchar(50) not null)' at line 2
mysql> create table categories( cat_id int auto increment primary key, cat_name
varchar(50) not null);
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'auto increment primary key, cat_name varchar(50) not null)' at line 1
mysql> create table categories( cat_id int(10), cat_name varchar(50) not null);
Query OK, 0 rows affected, 1 warning (0.86 sec)

mysql> create table products(
    -> product_id int(100),
    -> name varchar(100) not null,
    -> price decimal(10,2)not null,
    -> stock int default 0,);
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near ')' at line 5
mysql> create table products( product_id int(100), name varchar(100) not null, price decimal(10,2)not null, stock int default 0);
Query OK, 0 rows affected, 1 warning (0.52 sec)

mysql> create table cart_items(
    -> cart_item id(10),
    -> prod_id int not null,
    -> quantity int default 1);
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'id(10),
prod_id int not null,
quantity int default 1)' at line 2
mysql> create table cart_items( cart_item int(10), prod_id int not null, quantit
y int default 1);
Query OK, 0 rows affected, 1 warning (1.23 sec)

mysql> create table orders(
    -> order_id int auto_increment primary key,
    -> cust_id int not null,
    -> order_date timestamp default current_timestamp,
    -> total_amount decimal(10,2));
Query OK, 0 rows affected (0.75 sec)

mysql> show tables;
+-------------------------+
| Tables_in_shopping_cart |
+-------------------------+
| Order_Details           |
| cart_items              |
| categories              |
| customers               |
| orders                  |
| products                |
+-------------------------+
6 rows in set (0.00 sec)

mysql> describe customers;
+-------------+--------------+------+-----+---------+-------+
| Field       | Type         | Null | Key | Default | Extra |
+-------------+--------------+------+-----+---------+-------+
| customer_id | int          | YES  |     | NULL    |       |
| name        | varchar(100) | NO   |     | NULL    |       |
| email       | varchar(100) | NO   | PRI | NULL    |       |
| phone       | varchar(11)  | YES  |     | NULL    |       |
| address     | text         | YES  |     | NULL    |       |
+-------------+--------------+------+-----+---------+-------+
5 rows in set (0.00 sec)

mysql> describe products;
+------------+---------------+------+-----+---------+-------+
| Field      | Type          | Null | Key | Default | Extra |
+------------+---------------+------+-----+---------+-------+
| product_id | int           | YES  |     | NULL    |       |
| name       | varchar(100)  | NO   |     | NULL    |       |
| price      | decimal(10,2) | NO   |     | NULL    |       |
| stock      | int           | YES  |     | 0       |       |
+------------+---------------+------+-----+---------+-------+
4 rows in set (0.00 sec)

mysql> describe categories;
+----------+-------------+------+-----+---------+-------+
| Field    | Type        | Null | Key | Default | Extra |
+----------+-------------+------+-----+---------+-------+
| cat_id   | int         | YES  |     | NULL    |       |
| cat_name | varchar(50) | NO   |     | NULL    |       |
+----------+-------------+------+-----+---------+-------+
2 rows in set (0.00 sec)

mysql> describe cart_items;
+-----------+------+------+-----+---------+-------+
| Field     | Type | Null | Key | Default | Extra |
+-----------+------+------+-----+---------+-------+
| cart_item | int  | YES  |     | NULL    |       |
| prod_id   | int  | NO   |     | NULL    |       |
| quantity  | int  | YES  |     | 1       |       |
+-----------+------+------+-----+---------+-------+
3 rows in set (0.00 sec)

mysql> describe Order_Details;
+-----------------+--------------+------+-----+---------+----------------+
| Field           | Type         | Null | Key | Default | Extra          |
+-----------------+--------------+------+-----+---------+----------------+
| cust_id         | int          | NO   | PRI | NULL    | auto_increment |
| cust_name       | varchar(50)  | NO   |     | NULL    |                |
| product         | varchar(100) | NO   |     | NULL    |                |
| cust_add        | varchar(100) | YES  |     | NULL    |                |
| product_cost    | int          | YES  |     | NULL    |                |
| product_details | varchar(20)  | YES  |     | NULL    |                |
| prod_quantity   | int          | YES  |     | NULL    |                |
| payment_type    | varchar(20)  | YES  |     | NULL    |                |
| acc_no          | int          | YES  |     | NULL    |                |
| prod_cost       | int          | NO   |     | NULL    |                |
+-----------------+--------------+------+-----+---------+----------------+
10 rows in set (0.00 sec)

mysql> 

