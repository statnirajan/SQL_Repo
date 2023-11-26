/* COURSE CODES AND CHALLENGE TASKS SOLVED FROM UDEMY COURSE: THE COMPLETE SQL BOOTCAMP 2021 */
/* SECTION 2: SQL Statement Fundamentals */
/* Using "dvdrental" database, answer the following */

/* CHALLENGE: SELECT */
/* Grab the first and last names of every customer and their email address (customer table) */
SELECT first_name, last_name, email FROM customer;

/* CHALLENGE: SELECT DISTINCT */
/* What distinct ratings are available (films table) */
SELECT DISTINCT rating FROM film;

/* Grab where rental rates are > 4 (film table) */
SELECT * FROM film
WHERE rental_rate > 4;

/* Grab title of movies where rental rates are > 4 and replacement cost >=19.99 (film table) */
SELECT title FROM film
WHERE rental_rate > 4 AND replacement_cost >=19.99;

/*Count how many movies satisfy that previous condition */
SELECT COUNT(title) FROM film
WHERE rental_rate > 4 AND replacement_cost >=19.99;

/* having R rating or PG-13 rating */

SELECT * FROM film
WHERE rating = 'R' or rating = 'PG-13';

/* return everything not equal to R */
SELECT * FROM film
WHERE rating != 'R';

/* CHALLENGE: SELECT WHERE */
/* 1. What is the email for the customer with the name Nancy Thomas (customer table) */ 
SELECT * FROM customer;
SELECT email FROM customer
WHERE first_name = 'Nancy' AND last_name = 'Thomas';

/* 2. Could you give a customer the description for the movie "Outlaw Hanky" (film table) */
SELECT * FROM film;
SELECT description FROM film
WHERE title = 'Outlaw Hanky';

/* 3. Can you get the phone number for the customer who lives at '259 Ipoh Drive' (address table) */
SELECT * FROM address;
SELECT phone FROM address
WHERE address = '259 Ipoh Drive';

/* ORDER BY */
SELECT * FROM customer
ORDER BY first_name ASC;

SELECT * FROM customer
ORDER BY last_name DESC;

SELECT store_id, first_name, last_name FROM customer
ORDER BY store_id DESC, first_name;

SELECT first_name, last_name FROM customer
ORDER BY store_id DESC, first_name;  /* this also works */

/* LIMIT */
/* What are the five most recent payments */
SELECT * FROM payment
ORDER BY payment_date DESC
LIMIT 5;

SELECT * FROM payment
WHERE amount > 0
ORDER BY payment_date DESC
LIMIT 5;


/* CHALLENGE: ORDER BY */

/* 1. What are the customers ids of the first 10 customers who created a payment (payment table) */
SELECT * FROM payment
  
SELECT customer_id FROM payment
ORDER BY payment_date
LIMIT 10;

/* 2. What are the titles of the 5 shortest (in length of runtime) movies (film table) */
SELECT * FROM film;

SELECT title, length FROM film
ORDER BY length
LIMIT 5;

/* 3. How many movies have run time less than or equal to 50 minutes (film table) */
SELECT COUNT (title) FROM film
WHERE length <= 50;


/* BETWEEN */

SELECT * FROM payment
WHERE amount BETWEEN 8 AND 9;

SELECT * FROM payment
WHERE amount NOT BETWEEN 8 AND 9;

SELECT * FROM payment
WHERE payment_date BETWEEN '2007-02-01' AND '2007-02-15';


/* IN */

SELECT DISTINCT (amount) FROM payment
ORDER BY amount;

SELECT * FROM payment
WHERE amount IN (0.99,1.98,1.99);

SELECT COUNT (*) FROM payment
WHERE amount IN (0.99,1.98,1.99);

SELECT COUNT (*) FROM payment
WHERE amount NOT IN (0.99,1.98,1.99);

SELECT * FROM customer
WHERE first_name IN ('John','Jake','Julie');


/* LIKE and ILIKE */

/* Note that % matches any sequence of characters and underscore _ matches any single character */
SELECT * FROM customer
WHERE first_name LIKE 'J%';

SELECT COUNT (*) FROM customer
WHERE first_name LIKE 'J%';

SELECT COUNT (*) FROM customer
WHERE first_name LIKE 'J%' AND last_name LIKE 'S%';

SELECT COUNT (*) FROM customer
WHERE first_name ILIKE 'j%';

SELECT * FROM customer
WHERE first_name LIKE '_her%';

SELECT * FROM customer
WHERE first_name NOT LIKE '_her%';

SELECT * FROM customer
WHERE first_name LIKE 'A%' AND last_name NOT LIKE 'B%'
ORDER BY last_name;

/* GENERAL CHALLENGE 1 */

/* 1. How many payment transactions were greater than $ 5 */
SELECT COUNT (*) FROM payment
WHERE amount > 5;

/* 2. How many actors have a first name that starts with the letter P */
SELECT COUNT (*) FROM actor
WHERE first_name LIKE 'P%';

/* 3. How many unique districts are our customers from */
SELECT COUNT (DISTINCT (district)) FROM address;

/* 4. Retrieve the list of name for those distinct districts from the previous question */
SELECT DISTINCT (district) FROM address;

/* 5. How many films have a rating of R and a replacement cost between $ 5 and $ 15 */
SELECT * FROM film;

SELECT COUNT (*) FROM film
WHERE rating = 'R' AND replacement_cost BETWEEN 5 and 15;

/* 6. How many films have the word Truman somewhere in the title */
SELECT COUNT (*) FROM film
WHERE title LIKE '%Truman%';






























