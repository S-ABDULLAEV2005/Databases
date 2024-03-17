

-- Create the 'customers' table
CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(255),
    customer_location VARCHAR(255),
    customer_grade INT,
    customer_order_id INT
);

-- Insert data into the 'customers' table
INSERT INTO customers (customer_id, customer_name, customer_location, customer_grade, customer_order_id) VALUES
(3002, 'Nick Rimando', 'New York', 100, 5001),
(3005, 'Graham Zusi', 'California', 200, 5002),
(3001, 'Brad Guzan', 'London', NULL, 5005),
(3004, 'Fabian Johns', 'Paris', 300, 5006),
(3007, 'Brad Davis', 'New York', 200, 5001),
(3009, 'Geoff Camero', 'Berlin', 100, 5003),
(3008, 'Julian Green', 'London', 300, 5002);

-- Create the 'orders' table
CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    order_amount DECIMAL(10, 2),
    order_date DATE,
    customer_id INT,
    product_id INT
);

-- Insert data into the 'orders' table
INSERT INTO orders (order_id, order_amount, order_date, customer_id, product_id) VALUES
(70001, 150.5, '2012-10-05', 3005, 5002),
(70009, 270.65, '2012-09-10', 3001, 5005),
(70002, 65.26, '2012-10-05', 3002, 5001),
(70004, 110.5, '2012-08-17', 3009, 5003),
(70007, 948.5, '2012-09-10', 3005, 5002),
(70005, 2400.6, '2012-07-27', 3007, 5001),
(70008, 5760, '2012-09-10', 3002, 5001);

CREATE TABLE Sales (
  salesman_id INT PRIMARY KEY,
  name VARCHAR(50) NOT NULL,
  city VARCHAR(50) NOT NULL,
  commission DECIMAL(2,2) NOT NULL
);

INSERT INTO Sales (salesman_id, name, city, commission)
VALUES
  (1, 'John Smith', 'New York', 10.50),
  (2, 'Jane Doe', 'Chicago', 12.75),
  (3, 'Peter Jones', 'Los Angeles', 15.25),
  (4, 'Mary Brown', 'Houston', 11.00),
  (5, 'David Williams', 'Philadelphia', 13.50);

-- Task 3: Select the total purchase amount of all orders
SELECT SUM(order_amount) AS total_purchase_amount FROM orders;

-- Task 4: Select the average purchase amount of all orders
SELECT AVG(order_amount) AS average_purchase_amount FROM orders;

-- Task 5: Select how many customers have listed their names
SELECT COUNT(customer_id) AS total_customers FROM customers;

-- Task 6: Select the minimum purchase amount of all the orders
SELECT MIN(order_amount) AS minimum_purchase_amount FROM orders;

-- Task 7: Select customers with all information whose name ends with the letter 'b'
SELECT * FROM customers WHERE customer_name LIKE '%b';

-- Task 8: Select orders made by customers from 'New York'
SELECT * FROM orders
WHERE customer_id IN (SELECT customer_id FROM customers WHERE customer_location = 'New York');

-- Task 9: Select customers with all information who have orders with a purchase amount more than 10
SELECT * FROM customers WHERE customer_id IN (SELECT DISTINCT customer_id FROM orders WHERE order_amount > 10);

-- Task 10: Select the total grade of all customers
SELECT SUM(customer_grade) AS total_grade FROM customers;

-- Task 11: Select all customers who have listed their names
SELECT * FROM customers WHERE customer_name IS NOT NULL;

-- Task 12: Select the maximum grade of all customers
SELECT MAX(customer_grade) AS max_grade FROM customers;