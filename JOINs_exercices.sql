SELECT COUNT(amount) AS num_transactions FROM payment;

SELECT customer_id,SUM(amount) AS total_spent 
FROM payment GROUP BY customer_id
HAVING SUM(amount) > 100;

SELECT * FROM payment
INNER JOIN customer
ON payment.customer_id = customer.customer_id;

SELECT * FROM customer
LEFT JOIN payment ON customer.customer_id = payment.customer_id
UNION
SELECT * FROM customer
RIGHT JOIN payment ON customer.customer_id = payment.customer_id;

SELECT film.film_id, film.title, inventory_id, store_id
FROM film
LEFT JOIN inventory ON 
inventory.film_id = film.film_id
WHERE inventory.film_id IS NULL;

SELECT district,email FROM customer
INNER JOIN address
ON address.address_id = customer.address_id
WHERE address.district = 'California'
ORDER BY customer.address_id;

SELECT film.title, actor.first_name, actor.last_name
FROM film_actor
INNER JOIN actor ON film_actor.actor_id = actor.actor_id
INNER JOIN film ON film_actor.film_id = film.film_id
WHERE actor.first_name = 'Nick' AND actor.last_name = 'Wahlberg';
 


