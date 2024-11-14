-- time and math functions: 
SELECT NOW();
SELECT SYSDATE(6);
SELECT CURRENT_TIME;
SELECT CURRENT_DATE;
SELECT EXTRACT(YEAR from payment_date) AS year_of_payment FROM payment;
SELECT AGE(payment_date) from payment;
SELECT TIMESTAMPDIFF(YEAR, payment_date, CURDATE()) AS age_in_years FROM payment;
SELECT DATEDIFF(CURDATE(), payment_date) AS age_in_days FROM payment;
SELECT TO_CHAR(payment_date,'Month YYYY') FROM PAYMENT;
SELECT DATE_FORMAT(payment_date, '%M %Y') AS formatted_date FROM payment;
SELECT DISTINCT(DATE_FORMAT(payment_date, '%M')) AS payment_month FROM payment;
SELECT COUNT(*) AS payments_done_on_Monday FROM payment WHERE DAYOFWEEK(payment_date) = 2;
SELECT ROUND(rental_rate/replacement_cost,2)*100 AS percent_cost FROM film;
SELECT 0.1*replacement_cost AS deposit FROM film;

-- string functions: 
SELECT first_name || last_name FROM customer; -- works in Postgresql
SELECT CONCAT(first_name, ' ', last_name) AS full_name FROM customer; -- works in Mysql
SELECT lower(CONCAT(left(first_name,1), last_name, '@gmail.com')) AS custom_email FROM customer;

-- SubQuery - perform query on results of another query: 
SELECT title,length FROM film WHERE length > (SELECT AVG(length) FROM film) ORDER BY length DESC;
SELECT rental_rate FROM film WHERE rental_rate > (SELECT AVG(rental_rate) FROM film);

SELECT film_id, title
FROM film
WHERE film_id IN
(SELECT inventory.film_id 
FROM rental 
INNER JOIN inventory ON inventory.inventory_id = rental.inventory_id
WHERE return_date BETWEEN '2005-05-29' AND '2005-05-30');

SELECT first_name, last_name FROM customer AS c
WHERE EXISTS
(SELECT * FROM payment as p 
WHERE p.customer_id = c.customer_id
AND amount > 11);

SELECT * FROM film;

SELECT fi1.title, fi2.title, fi1.length
FROM film AS fi1
JOIN film AS fi2 ON
fi1.length = fi2.length 
AND fi1.film_id != fi2.film_id
ORDER BY fi1.title;

