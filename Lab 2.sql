    

-- CREATE TABLE countries (
--     country_id SERIAL PRIMARY KEY,
--     country_name VARCHAR(255),
--     region_id INT,
--     population INT
-- );
 
 
--  INSERT INTO countries (country_id, country_name, region_id, population)
-- VALUES ('0505', 'Tajikistan', '23', '800000');

-- INSERT INTO countries( country_id, country_name)
-- VALUES ('734000', 'Kazakhstan');

-- INSERT INTO countries(region_id)
-- VALUES (NULL);

-- INSERT INTO countries (country_id, country_name, region_id, population)
-- VALUES 
--     (3, 'United Kingdom', 4, 66440000),
--     (4, 'Australia', 2, 25000000),
--     (5, 'France', 4, 66990000);


-- ALTER TABLE countries
-- ALTER COLUMN country_name SET DEFAULT 'Kazakhstan';

-- INSERT INTO countries (country_name)
-- VALUES ('Russia');

-- INSERT INTO countries DEFAULT VALUES;

--  CREATE TABLE countries_new(LIKE countries);

-- INSERT INTO countries_new
-- SELECT * FROM countries;

-- UPDATE countries
-- SET region_id = 1
-- WHERE region_id IS NULL;

-- SELECT
--     country_name,
--     population * 1.1 AS "New Population"
-- FROM
--     countries;

-- DELETE FROM countries
-- WHERE population < 10000000;

-- DELETE FROM countries_new
-- WHERE country_id IN (SELECT country_id FROM countries)
-- RETURNING *;
 
--  DELETE FROM countries
--  RETURNING *;


