
/* SECTION 3: GROUP BY statements */

/* Aggregation Functions */

SELECT MIN (replacement_cost) FROM film;

SELECT AVG (replacement_cost) FROM film;

SELECT ROUND (AVG (replacement_cost),3) FROM film;

SELECT MIN (replacement_cost), MAX (replacement_cost) FROM film;

SELECT COUNT (*) FROM film;

SELECT SUM (replacement_cost) FROM film;

/* GROUP BY */ 
/* The GROUP BY clause must appear right after a FROM or WHERE statement */

SELECT * FROM payment;

SELECT SUM (amount) FROM payment
GROUP BY customer_id;

SELECT customer_id, SUM (amount) FROM payment
GROUP BY customer_id;

SELECT customer_id, SUM (amount) FROM payment
GROUP BY customer_id
ORDER BY SUM (amount);

SELECT customer_id, staff_id, SUM (amount) FROM payment
GROUP BY staff_id, customer_id
ORDER BY customer_id;

SELECT customer_id, staff_id, SUM (amount) FROM payment
GROUP BY staff_id, customer_id
ORDER BY customer_id, staff_id;

/*Group By a date column */

SELECT DATE (payment_date), SUM (amount) FROM payment
GROUP BY DATE (payment_date);

SELECT DATE (payment_date), SUM (amount) FROM payment
GROUP BY DATE (payment_date)
ORDER BY SUM (amount) DESC;

/* Challenge: GROUP BY */
/* 1. We have two staff id 1 and 2. We want to give a bonus to the staff member that handled the most payments. How many payments did each staff member handle and who gets the bonus */

SELECT * FROM payment;

SELECT staff_id, COUNT (*) FROM payment
GROUP BY staff_id;

/* 2. What is the average replacement cost per MPAA rating */
SELECT * FROM film;

SELECT rating, AVG (replacement_cost) FROM film
GROUP BY rating;

/* 3. What are the customer ids of the top 5 customers by total spend */
SELECT * FROM payment;

SELECT customer_id, SUM (amount) FROM payment
GROUP BY customer_id
ORDER BY SUM (amount) DESC
LIMIT 5;

/* HAVING */
/*Always appears after GROUP BY */
/* We cannot use WHERE to filter based off of aggregate results, because those happen after a WHERE is executed */

SELECT * FROM payment;

SELECT customer_id, SUM (amount) FROM payment
GROUP BY customer_id
HAVING SUM (amount) > 100;

SELECT * FROM customer;

SELECT store_id, COUNT (*) FROM customer
GROUP BY store_id
HAVING COUNT (*) > 300;


/* Challenge: HAVING */
/* 1. We will assign platinum status to customers that have had 40 or more transaction payments. What customers_id are eligible */

SELECT * FROM payment;

SELECT customer_id, COUNT (*) FROM payment
GROUP BY customer_id
HAVING COUNT (*) >= 40;

/* 2. What are the customer ids of customers who have spent more than $100 in payment transactions with staff _id member 2 */

SELECT customer_id, SUM (amount) FROM payment
WHERE staff_id = 2
GROUP BY customer_id
HAVING SUM (amount) > 100;














