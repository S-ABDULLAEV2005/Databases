create table salesman(
salesman_id int primary key,
name varchar(255),
city varchar(255),
commission float
);


create table customers(
customer_id int primary key,
cust_name varchar(255),
city varchar(255),
grade int,
salesman_id int,
FOREIGN KEY (salesman_id) REFERENCES salesman(salesman_id)
);


create table orders(
ord_no int primary key,
purch_amt float,
ord_date date,
customer_id int,
salesman_id int,
FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
FOREIGN KEY (salesman_id) REFERENCES salesman(salesman_id)
);



insert into salesman(salesman_id, name, city, commission)
values
(5001, 'James Hoog', 'New York', 0.15),
(5002, 'Nail Knite', 'Paris', 0.13),
(5005, 'Pit Alex', 'London', 0.11),
(5006, 'Mc Lyon', 'Paris', 0.14),
(5003, 'Lauson Hen', NULL, 0.12),
(5007, 'Paul Adam', 'Rome', 0.13);


insert into customers(customer_id, cust_name, city, grade, salesman_id)
values
(3002, 'Nick Rimando', 'New York', 100, 5001),
(3005, 'Graham Zusi', 'California', 200, 5002),
(3001, 'Brad Guzan', 'London', NULL, 5005),
(3004, 'Fabian Johns', 'Paris', 300, 5006),
(3007, 'Brad Davis', 'New York', 200, 5001),
(3009, 'Geoff Camero', 'Berlin', 100, 5003),
(3008, 'Julian Green', 'London', 300, 5002);

insert into orders(ord_no, purch_amt, ord_date, customer_id, salesman_id)
values
(70001, 150.5, '2012-10-05', 3005, 5002),
(70009, 270.65, '2012-09-10', 3001, 5005),
(70002, 65.26, '2012-10-05', 3002, 5001),
(70004, 110.5, '2012-08-17', 3009, 5003),
(70007, 948.5, '2012-09-10', 3005, 5002),
(70005, 2400.6, '2012-07-27', 3007, 5001),
(70008, 5760, '2012-09-10', 3002, 5001);


create role junior_dev login;


create view ny_salesman_view as
select* from salesman where city = 'New York';


create view order_details as
select o.ord_no, o.purch_amt, o.ord_date, s.name as salesman_name, c.cust_name as customer_id
from orders o
join salesman s on o.salesman_id = s.salesman_id
join customers c on o.customer_id = c.customer_id;

grant all on order_details to junior_dev;



create view highest_grade_customers as
select *
from customers
where grade = (select max(grade) from customers);

grant select on highest_grade_customers to junior_dev;


create view salesman_count_by_city as
select city, count(salesman_id) as num_salesman
from salesman
group by city;


create view salesman_with_some_customers as
select s.salesman_id, s.name as salesman_name, count(c.customer_id) as customer_count
from salesman s
join customers c on s.salesman_id = c.salesman_id
group by s.salesman_id, s.name
having count(c.customer_id) > 1;


create role intern;

grant junior_dev to intern;

-- SELECT rolname FROM pg_roles;
-- SELECT table_name FROM information_schema.views WHERE table_schema = 'public';
-- SELECT view_definition FROM information_schema.views WHERE table_name = 'your_view_name';

-- SELECT grantee, privilege_type
-- FROM information_schema.table_privileges
-- WHERE table_name = 'your_table_or_view_name';
