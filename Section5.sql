/* SECTION 5: Joins */

/* AS Statement */

SELECT * FROM payment;
SELECT amount AS rental_price 
FROM payment;
SELECT SUM (amount) AS net_revenue 
FROM payment;
SELECT COUNT (amount) AS num_transactions  /* Can use asterick as well */
FROM payment;
SELECT customer_id, SUM (amount) AS total_spent
FROM payment
GROUP BY customer_id;
SELECT customer_id, SUM (amount) AS total_spent
FROM payment
GROUP BY customer_id
HAVING SUM (amount) > 100;  /* YOU did not use Aliases in WHERE CLAUSE OR HAVING CLAUSE */
SELECT customer_id, amount AS new_name
FROM payment
WHERE amount > 3   

/*INNER JOINS */

SELECT * FROM payment
INNER JOIN customer
ON payment.customer_id = customer.customer_id

SELECT payment_id, payment.customer_id, first_name  /* Do not have to specify table names if columns are unique to only one table */
FROM payment
INNER JOIN customer  /* order of payment and customer table in FROM and INNER JOIN can be changed */
ON payment.customer_id = customer.customer_id

/* OUTER JOIN */
/* FULL OUTER JOIN */
/* Rows either unique only to customer table or to payment table */

SELECT * FROM customer
FULL OUTER JOIN payment
ON customer.customer_id = payment.customer_id
WHERE customer.customer_id IS null
OR payment.payment_id IS null
/* Result is null. There is no customer who is not in payment table or vice-versa */

/*LEFT OUTER JOIN OR JUST LEFT JOIN */

SELECT film.film_id, title, inventory_id
FROM film
LEFT OUTER JOIN inventory
ON inventory.film_id = film.film_id /*Returns rows either in film table or in both film and inventory table */

SELECT film.film_id, title, inventory_id
FROM film
LEFT OUTER JOIN inventory
ON inventory.film_id = film.film_id
WHERE inventory.film_id IS null /* Returns unique rows only found in film table not in inventory */

/* RIGHT JOIN */

SELECT film.film_id, title, inventory_id
FROM film
RIGHT OUTER JOIN inventory
ON inventory.film_id = film.film_id /*Returns rows either in inventory table or in both film and inventory table */

SELECT film.film_id, title, inventory_id
FROM film
RIGHT OUTER JOIN inventory
ON inventory.film_id = film.film_id
WHERE film.film_id IS null     /* Returns unique rows only found in inventory table not in film*/

/* UNIONS */
/* The UNION operator is used to combine the result-set of two or more SELECT statements */



/* Challenge: Join */
/* 1. What are the emails of the customers who live in California */

SELECT address.address_id, district, customer.email FROM address
INNER JOIN customer
ON address.address_id = customer.address_id
WHERE district = 'California'


/* 2. Get a list of all movies "Nick Wahlberg" has been in */
SELECT title, first_name, last_name FROM film_actor
INNER JOIN actor
ON film_actor.actor_id = actor.actor_id
INNER JOIN film
ON film_actor.film_id = film.film_id
WHERE first_name = 'Nick' 
AND last_name = 'Wahlberg'
























