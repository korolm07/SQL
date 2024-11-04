SELECT MAX(replacement_cost) FROM film; -- returns single value, so we cannot call another collumn;
SELECT MAX(replacement_cost), MIN(replacement_cost) FROM film;
SELECT ROUND(AVG(replacement_cost),2) FROM film;
SELECT SUM(replacement_cost) FROM film;

SELECT customer_id FROM payment GROUP BY customer_id; -- same as select distinct;

SELECT customer_id,SUM(amount),COUNT(amount) FROM payment 
GROUP BY customer_id
ORDER BY SUM(amount) DESC;

SELECT staff_id,customer_id,SUM(amount) FROM payment
GROUP BY staff_id,customer_id
ORDER BY staff_id;

SELECT DATE(payment_date), SUM(amount) FROM payment
GROUP BY DATE(payment_date)
ORDER BY SUM(amount) DESC;

SELECT COUNT(*),staff_id FROM payment
GROUP BY staff_id;

SELECT * FROM film;

SELECT rating, ROUND(AVG(replacement_cost),2) FROM film
GROUP BY rating
ORDER BY AVG(replacement_cost) DESC;

SELECT customer_id, SUM(amount) FROM payment
GROUP BY customer_id
ORDER BY SUM(amount) DESC 
LIMIT 5;

SELECT customer_id, SUM(amount) FROM payment 
WHERE customer_id NOT IN (9184,87,477)
GROUP BY customer_id; -- if I want to filter on SUM(amount) - I can do it only after group by with the help HAVING

SELECT customer_id, SUM(amount) FROM payment 
GROUP BY customer_id
HAVING SUM(amount) > 100;

SELECT store_id, COUNT(customer_id) FROM customer 
GROUP BY store_id
HAVING COUNT(customer_id) > 300;

SELECT customer_id, COUNT(payment_id) FROM payment
GROUP BY customer_id
HAVING COUNT(payment_id) >= 40
ORDER BY COUNT(payment_id);

SELECT customer_id,SUM(amount),staff_id FROM payment
WHERE staff_id = 2
GROUP BY customer_id
HAVING SUM(amount) > 100  
ORDER BY SUM(amount) DESC;

SELECT customer_id, SUM(amount) FROM payment
WHERE staff_id = 2
GROUP BY customer_id
HAVING SUM(amount) > 110
ORDER BY SUM(amount) DESC;

SELECT COUNT(*) FROM film
WHERE title LIKE 'J%';

SELECT first_name,last_name FROM customer
WHERE first_name LIKE 'E%' AND address_id < 500
ORDER BY customer_id DESC
LIMIT 1;
 
 












