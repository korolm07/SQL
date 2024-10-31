SELECT first_name, last_name, email FROM customer;
SELECT * FROM film;
SELECT DISTINCT rating FROM film;
SELECT COUNT(title) FROM film;
SELECT COUNT(DISTINCT rating) FROM film;
SELECT * FROM payment;
SELECT COUNT(*) FROM payment;
SELECT COUNT(*) FROM film WHERE rating = 'R' OR rating = 'PG-13';
SELECT * FROM film WHERE rating != 'R' OR rating = 'PG-13';
SELECT COUNT(*) FROM customer WHERE first_name = 'Jared';
SELECT * FROM customer;
SELECT email FROM customer WHERE first_name = 'Nancy' AND last_name = 'Thomas';
SELECT * FROM film;
SELECT description FROM film WHERE title = 'Outlaw Hanky';
SELECT phone FROM address WHERE address = '259 Ipoh Drive' OR address2 =  '259 Ipoh Drive';

SELECT store_id, first_name, last_name FROM customer
ORDER BY store_id DESC, first_name ASC;

SELECT * FROM payment
WHERE amount != 0.00
ORDER BY payment_date DESC
LIMIT 5;

SELECT * FROM payment
LIMIT 8; -- nice way to see table's structure

SELECT customer_id,payment_date FROM payment 
WHERE amount != 0.00
ORDER BY payment_date DESC
LIMIT 10;

SELECT * FROM film LIMIT 1;

SELECT title, length FROM film
ORDER BY length ASC
LIMIT 15;

SELECT COUNT(*) FROM film 
WHERE length <=50;

SELECT * FROM payment
WHERE amount BETWEEN 8 and 9;

SELECT COUNT(*) FROM payment
WHERE amount BETWEEN 8 and 9;

SELECT * FROM payment 
WHERE payment_date BETWEEN '2005-07-01' AND '2005-07-15';

SELECT DISTINCT(amount) FROM payment
ORDER BY amount;

SELECT * FROM payment
WHERE amount IN (0.99,1.98,1.99);
 
SELECT * FROM payment
WHERE amount NOT IN (0.99,1.98,1.99); -- same as I want to do multiple times OR OR OR

SELECT * FROM customer
WHERE first_name IN ('John', 'Jake', 'Julie');

SELECT first_name,last_name
FROM customer
WHERE first_name LIKE 'J%' AND last_name LIKE 'S%' AND last_name NOT LIKE '%r';

SELECT COUNT(*) from payment
WHERE amount > 5;

SELECT COUNT(*) from actor
WHERE first_name LIKE 'P%';

SELECT COUNT(DISTINCT (district)) FROM address;
SELECT DISTINCT (district) FROM address;

SELECT * FROM film WHERE rating = 'R' AND replacement_cost BETWEEN 5 and 15 
ORDER by replacement_cost; 

SELECT COUNT(*) FROM film WHERE title LIKE '%Truman%';




 




 
