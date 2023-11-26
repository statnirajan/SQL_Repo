
/* 1. Return the customer IDs of customers who have spent at least $ 110 with the staff member who has an ID of 2 */
SELECT customer_id, SUM(amount)  
FROM payment
WHERE staff_id = 2
GROUP BY customer_id
HAVING SUM(amount) >110;

/* 2. How many films begin with the letter J ? */
