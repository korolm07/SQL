USE flower;
-- CASE general: 
SELECT job_id,
	CASE 
		WHEN job_id = 1 THEN "one"
		WHEN job_id = 2 THEN "two"
		ELSE "other" 
	END AS label
FROM job;
SELECT * FROM job;

-- CASE expression: 
SELECT job_id,
	CASE job_id
		WHEN 1 THEN "one"
		WHEN 2 THEN "two"
		ELSE "other" 
	END AS label
FROM job;
SELECT * FROM job;

USE sakila;
SELECT * FROM customer;
-- first 100 customers premium , 100 - 200 plus status; others - normal

SELECT customer_id,
	CASE 
		WHEN customer_id <= 100 THEN "premium"
		WHEN customer_id BETWEEN 100 AND 200 THEN "plus"
		ELSE "normal" 
	END AS status
FROM customer
ORDER BY customer_id;
SELECT * FROM job;

SELECT customer_id,
CASE customer_id
	WHEN 2 THEN 'Winner'
    WHEN 5 THEN 'Second Place'
    ELSE 'Normal'
END AS raffle_results
FROM customer;

SELECT rental_rate,
CASE rental_rate
	WHEN 0.99 THEN 1
    ELSE 0
END AS rate
FROM film;

SELECT 
SUM(CASE rental_rate
	WHEN 0.99 THEN 1
    ELSE 0
END) AS number_of_bargains
FROM film;


SELECT 
SUM(CASE rental_rate
	WHEN 0.99 THEN 1
    ELSE 0
END) AS bargains,
SUM(CASE rental_rate
	WHEN 2.99 THEN 1
    ELSE 0
END) AS regular,
SUM(CASE rental_rate
	WHEN 4.99 THEN 1
    ELSE 0
END) AS premium
FROM film;

SELECT 
SUM(CASE rating
	WHEN 'R' THEN 1
	ELSE 0
END) AS sum_rating_R,
SUM(CASE rating
	WHEN 'PG' THEN 1
	ELSE 0
END) AS sum_rating_PG,
SUM(CASE rating
	WHEN 'PG-13' THEN 1
	ELSE 0
END) AS sum_rating_PG13
FROM film;

SELECT CAST('5' AS SIGNED);
SELECT inventory_id, length(CAST(inventory_id AS CHAR)) FROM rental;
USE flower;
CREATE TABLE depts(
first_name VARCHAR(50),
department VARCHAR(50)
);
INSERT INTO depts(
first_name,
department)
VALUES
('Vinton','A'),
('Lauren','B'),
('Claire','B');

SELECT * FROM depts;
SELECT (
SUM(CASE WHEN department = 'A' THEN 1 ELSE 0 END)/
SUM(CASE WHEN department = 'B' THEN 1 ELSE 0 END)
) AS departments_ratio 
FROM depts;

DELETE FROM depts
WHERE department = 'B';

SELECT * FROM depts;
SELECT (
SUM(CASE WHEN department = 'A' THEN 1 ELSE 0 END)/
NULLIF(
SUM(CASE WHEN department = 'B' THEN 1 ELSE 0 END),0
)) AS departments_ratio 
FROM depts;

CREATE VIEW customer_info AS
SELECT first_name, last_name, address FROM customer 
INNER JOIN address 
ON customer.address_id = address.address_id;

SELECT * FROM customer_info;

CREATE OR REPLACE VIEW customer_info AS 
SELECT first_name, last_name, address, district FROM customer 
INNER JOIN address 
ON customer.address_id = address.address_id;

DROP VIEW customer_info; -- to delete view

ALTER VIEW customer_info RENAME TO c_info; -- works in postgresql
-- works in MySQL: 
CREATE VIEW c_info AS SELECT * FROM customer_info;
DROP VIEW customer_info;

SELECT * FROM c_info;
DROP VIEW c_info;


