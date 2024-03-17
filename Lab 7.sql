
CREATE TABLE country (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    population INT
);

INSERT INTO country (name, population)
VALUES
    ('Tajikistan', 20788100),
    ('Kazakhstan', 19692940),
    ('Kenya', 55528250),
    ('Tanzania', 68203061);

CREATE TABLE departments (
  code INTEGER PRIMARY KEY,
  name VARCHAR(255) NOT NULL ,
  budget DECIMAL NOT NULL
);

CREATE TABLE employees (
  department_id INTEGER PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  lastname VARCHAR(255) NOT NULL,
  department INTEGER NOT NULL,
  city VARCHAR(255),
  salary DECIMAL(10, 2), -- Assuming salary is a decimal value
  FOREIGN KEY (department) REFERENCES departments(code)
);

INSERT INTO departments(code,name,budget)
VALUES
    (14,'IT',65000),
    (37,'Accounting',15000),
    (59,'Human Resources',240000),
    (77,'Research',55000),
    (45,'Management',155000),
    (11,'Sales',85000);

INSERT INTO employees(department_id,name,lastname,department, city, salary)
VALUES
    ('185545122','Raul','Moris',14, 'Dushanbe', 50000.00),
    ('212215424','Brandon','Mikey',14, 'Astana', 64000.00),
    ('878451254','Sam','Smith',37, 'Murghob', 75000.00),
    ('454152154','Joe','Biden',37, 'Hisor', 79000.00),
    ('515115484','Anna','Foster',14, 'Shahr', 30000.00),
    ('845442425','George','Bush',77, 'Mumbai', 60000.00),
    ('455154554','John','Kenedy',59, 'Kisumu', 45000.00),
    ('454545412','David','Guetta',77, 'Dar es Salaam', 48000.00),
    ('878454254','Zacary','Efron',59, 'Dodoma', 65000.00),
    ('745685214','Eric','Deymon',59, 'Zanzibar', 25000.00),
    ('845657245','Elizabeth','Walsen',14, 'Almaty', 15000.00),
    ('845657246','Bruse','Willias',14, 'Kitwe', 66000.00);


CREATE INDEX idx_country_name ON country (name);

CREATE INDEX idx_employees_name_surname ON employees (name, lastname);

CREATE UNIQUE INDEX idx_employees_salary_range ON employees (salary);

CREATE INDEX idx_employees_name_prefix ON employees (substring(name from 1 for 4));

CREATE INDEX idx_employees_department_budget_salary ON employees (department_id, salary);