/* SECTION 10: Conditionals Expressions and Procedures */
/* CASE */
/* We can use the CASE statement to only execute SQL code when certain conditions are met */

SELECT * FROM customer
/* Assume if customer id is 1, that is the first ever customer to make a purchase and so on. */
/* Customer 1 to 100 are assigned 'Premium', 101 to 199 are assigned 'Plus' and rest as "NORMAL" */
SELECT customer_id,
CASE
	WHEN (customer_id <= 100) THEN 'Premium'
	WHEN (customer_id BETWEEN 100 and 200) THEN 'Plus'
	ELSE 'Normal'
END AS customer_class
FROM customer

/* Label customer_id 2 as "winner", 5 as "Second place"  */
SELECT customer_id,
CASE customer_id
	WHEN 2 THEN 'Winner'
	WHEN 5 THEN 'Second place'
	ELSE 'Normal'
END AS raffle_results
FROM customer

/* You can perform operations based on the results of the CASE statement */
SELECT * FROM film
SELECT rental_rate FROM film
SELECT rental_rate,
CASE rental_rate
	WHEN 0.99 THEN 1
	ELSE 0
END
FROM film

/* How many .99 cents movies */
SELECT
SUM (CASE rental_rate
	WHEN 0.99 THEN 1
	ELSE 0
END) AS number_of_bargains
FROM film

SELECT
SUM (CASE rental_rate
	WHEN 0.99 THEN 1
	ELSE 0
END) AS bargains,
SUM (CASE rental_rate
	WHEN 2.99 THEN 1
	ELSE 0
END) AS regular
FROM film  /* You can keep continue doing this for other groups */

/* Challenge: Case */
/* We want to know and compare the various amounts of films we have per movie rating */
SELECT * FROM film
SELECT
SUM (CASE rating
	WHEN 'R' THEN 1
	ELSE 0
END) AS r,
SUM (CASE rating
	WHEN 'PG' THEN 1
	ELSE 0
END) AS pg,
SUM (CASE rating
	WHEN 'PG-13' THEN 1
	ELSE 0
END) AS pg13
FROM film

/* COALESCE */
/* The COALESCE function accepts an unlimited number of arguments. It returns the first argument if that is not null.
If all arguments are null, the COALESCE function will return null. */
/* This function becomes useful when querying a table that contains null values and substituitng it with another value. */

/* CAST */
/* The CAST operator lets you convert from one data type into another (should be reasonable to convert) */

SELECT CAST('5' AS INTEGER)
SELECT CAST('5' AS INTEGER) AS new_int

SELECT CAST('five' AS INTEGER)   /* Produces error */

SELECT '10'::INTEGER

/* How many digits (character length) are within each inventory id */
/* Change the data type to string and find the length */
SELECT * FROM rental
SELECT CAST(inventory_id AS VARCHAR) FROM rental
SELECT CHAR_LENGTH(CAST(inventory_id AS VARCHAR)) FROM rental


/* VIEWS */

SELECT first_name, last_name, address FROM customer
INNER JOIN address
ON customer.address_id = address.address_id

CREATE VIEW customer_info AS 
SELECT first_name, last_name, address FROM customer
INNER JOIN address
ON customer.address_id = address.address_id

SELECT * FROM customer_info

CREATE OR REPLACE VIEW customer_info AS
SELECT first_name, last_name, address, district FROM customer
INNER JOIN address
ON customer.address_id = address.address_id

SELECT * FROM customer_info

DROP VIEW IF EXISTS customer_info
SELECT * FROM customer_info  /* Produces error */

CREATE VIEW customer_info AS 
SELECT first_name, last_name, address FROM customer
INNER JOIN address
ON customer.address_id = address.address_id

SELECT * FROM customer_info
ALTER VIEW customer_info RENAME TO c_info
SELECT * FROM customer_info
SELECT * FROM c_info
















