CREATE TABLE locations(
location_id SERIAL PRIMARY KEY,
	street_address VARCHAR(25),
	postal_code varchar(12),
	city varchar(30),
	state_province varchar(12)
);

CREATE TABLE departments(
department_id serial primary key,
	department_name varchar(50) unique,
	budget integer,
	location_id integer references locations
);

CREATE TABLE employees(
employee_id serial primary key,
	first_name varchar(50),
	last_name varchar(50),
	email varchar(50),
	phone_number varchar(20),
	department_id integer references departments
);

--3 task
SELECT first_name, last_name, employees.department_id, department_name
FROM employees
JOIN departments ON employees.department_id = departments.department_id;

--4 task
SELECT first_name, last_name, employees.department_id, department_name
FROM employees
JOIN departments ON employees.department_id = departments.department_id
WHERE employees.department_id IN (40, 80);

--5 task
SELECT first_name, last_name, department_name, city, state_province
FROM employees
JOIN departments ON employees.department_id = departments.department_id;

--6 task
SELECT department_id, department_name
FROM departments
LEFT JOIN employees ON departments.department_id = employees.department_id;

--7 task
SELECT first_name, last_name, employees.department_id, department_name
FROM employees
LEFT JOIN departments ON employees.department_id = departments.department_id;

