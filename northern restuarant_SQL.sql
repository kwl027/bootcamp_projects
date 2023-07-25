--restaurant owner
--5 tables
--1 fact, 4x dimension
--search google, how to add foreign key
--white SQL 3-5 queries analyze data
--subquery/ with clause


.mode markdown
.header on 

--(Fact) Orders
CREATE TABLE orders (
  orderid INT PRIMARY KEY,
  orderdate DATE,
  customerid INT,
  branchid INT,
  menuid INT,
  payid INT,
  FOREIGN KEY (customerid) REFERENCES customer(customerid),
  FOREIGN KEY (branchid) REFERENCES branch(branchid),
  FOREIGN KEY (menuid) REFERENCES menu(menuid),
  FOREIGN KEY (payid) REFERENCES payment(payid)
);

INSERT INTO orders VALUES
  (270,"2022-12-2",1006,01,02,01),
  (271,"2022-12-2",1002,01,05,02),
  (272,"2022-12-2",1003,02,03,02),
  (273,"2022-12-3",1006,01,01,01),
  (274,"2022-12-3",1001,01,04,01),
  (275,"2022-12-3",1005,02,02,02),
  (276,"2022-12-3",1001,01,01,01),
  (277,"2022-12-4",1002,01,03,01),
  (278,"2022-12-5",1004,02,04,02),
  (279,"2022-12-5",1002,02,04,02),
  (280,"2022-12-6",1006,02,01,02),
  (281,"2022-12-6",1003,02,04,01),
  (282,"2022-12-7",1006,01,05,01),
  (283,"2022-12-7",1002,02,02,01),
  (284,"2022-12-8",1005,01,03,01),
  (285,"2022-12-9",1004,01,05,02),
  (286,"2022-12-10",1003,01,04,02),
  (287,"2022-12-12",1001,01,04,01),
  (288,"2022-12-13",1005,02,02,01),
  (289,"2022-12-14",1002,01,01,01),
  (290,"2022-12-15",1001,01,02,01);

--Dim1 customer
  CREATE TABLE customers (
    customerid INT PRIMARY KEY,
    name TEXT,
    gender TEXT,
    age INT,
    email TEXT
  );
INSERT INTO customers VALUES 
  (1001,'Ariana Grande','F',22,'ariana.g@gmail.com'),
  (1002,'Jessie Jay','F',25,'jessie.j@gmail.com'),
  (1003,'Bruno Smith','M',31,'bruno.s@gmail.com'),
  (1004,'Simon Dominic','M',31,'simon.d@gmail.com'),
  (1005,'Jay Bom','M',28,'jay.b@gmail.com'),
  (1006,'Alice denner','F',27,'alice.d@gmail.com');

--Dim2 branch
CREATE TABLE branch (
  branchid INT PRIMARY KEY,
  location INT
);

INSERT INTO branch VALUES
  (01,'Chiang Mai'),
  (02,'Phayathai');

--Dim3 menu
CREATE TABLE menu (
  menuid INT PRIMARY KEY,
  menu_list TEXT,
  price INT
);

INSERT INTO menu VALUES 
(01,'nam prik ong',79),
(02,'laab khua',89),
(03,'khao soi',89),
(04,'khanom jeen nam ngiaw',49),
(05,'leng zap',99);

--dim4 payment
CREATE TABLE payment (
  payid INT PRIMARY KEY,
  paytype TEXT
);

INSERT INTO payment VALUES 
(01,'cash'),
(02,'credit card');

--select * from menu;

--Write SQL 3-5 queries analyze data
--(1) Hits menu top 3
select
  orders.menuid,
  menu.menu_list,
  count (*) as n_menu
from orders join menu on orders.menuid = menu.menuid
group by menu_list
order by n_menu desc
limit 3;

--(2) Hits branch
select
  orders.branchid,
  branch.location,
count (*) as n_branch
from orders,branch
where orders.branchid = branch.branchid
group by location
order by n_branch desc;

--(3) who is the most ordered?
select 
  ord.customerid,
  cus.name,
  count (*) as total_ordered,
  me.menu_list as the_most_ordered
from customers as cus,orders as ord,menu as me 
where cus.customerid = ord.customerid 
and ord.menuid = me.menuid
group by name
order by total_ordered desc
limit 1;

--(4) top payment method (with clause)
with sub as
  (select *
  from orders as ord 
  join payment on ord.payid = payment.payid
  )

  select 
  paytype,
  count(*) as n_payment 
  from sub 
  group by paytype
  order by n_payment desc;

--(5) find customers's email to contact about the discount promotion 
select 
  customerid as ID,
  name as Full_Name,
  email as Email
from customers 
where email like '%@gmail.com';

--(6) total income for each menu 
with sub2 as (
  select 
    ord.menuid,
    me.menu_list,
    me.price
  from orders as ord.menu as me 
  where ord.menuid = me.menuid 
)
select
  menu_list,
  price,
  count (menuid) as total_order,
  (count(menuid) * price) as total_income
  from sub2
  group by menu_list
  order by total_income desc;

