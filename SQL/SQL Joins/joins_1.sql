----- self join

SELECT * FROM sql_cx_live.user_1 t1
JOIN sql_cx_live.user_1 t2
ON t1.emergency_contact = t2.user_id;



--- /* Joining on more than 1 column */

SELECT * FROM sql_cx_live.students t1
JOIN sql_cx_live.class t2
ON t1.class_id = t2.class_id AND t1.enrollment_year = t2.class_year;




--- /* Joining on more than 2 tables */

SELECT * FROM sql_cx_live.order_details t1
JOIN sql_cx_live.orders t2
ON t1.order_id = t2.order_id
JOIN sql_cx_live.flipkart_user t3
ON t2.user_id = t3.user_id;

SELECT t1.order_id,t1.amount,t1.profit,t3.name FROM sql_cx_live.order_details t1
JOIN sql_cx_live.orders t2
ON t1.order_id = t2.order_id
JOIN sql_cx_live.flipkart_user t3
ON t2.user_id = t3.user_id;


- ### find order_id,name and city by joining users and orders

SELECT t1.order_id,t2.name,t2.city
FROM sql_cx_live.orders t1
JOIN sql_cx_live.flipkart_user t2
ON t1.user_id = t2.user_id;

- ### find order_id,product category by joining order_details and category

SELECT t1.order_id,t2.vertical
FROM sql_cx_live.order_details t1
JOIN sql_cx_live.category t2
ON t1.category_id = t2.category_id;





/* Filtering Rows */

- ### find all the orders placed in pune

SELECT * FROM sql_cx_live.orders t1
JOIN sql_cx_live.flipkart_user t2
ON t1.user_id = t2.user_id
WHERE t2.city = 'Pune';


- ### find all the orders placed in pune from sarita

SELECT * FROM sql_cx_live.orders t1
JOIN sql_cx_live.flipkart_user t2
ON t1.user_id = t2.user_id
WHERE t2.city = 'Pune' AND t2.name = 'Sarita';


- ### find all orders under chairs category
/* join order deatil with catgory */



- ### find all profitable orders

SELECT * FROM sql_cx_live.orders t1
JOIN sql_cx_live.order_details t2
ON t1.order_id = t2.order_id;

SELECT t1.order_id,
SUM(t2.profit)
FROM sql_cx_live.orders t1
JOIN sql_cx_live.order_details t2
ON t1.order_id = t2.order_id
GROUP BY t1.order_id
HAVING SUM(profit) > 0;


- ### find the customer who has placed maximum number of orders

SELECT name,
COUNT(*)
FROM sql_cx_live.orders t1
JOIN sql_cx_live.flipkart_user t2
ON t1.user_id = t2.user_id
GROUP BY t2.name
ORDER BY COUNT(*) DESC;

SELECT name,
COUNT(*)
FROM sql_cx_live.orders t1
JOIN sql_cx_live.flipkart_user t2
ON t1.user_id = t2.user_id
GROUP BY t2.name
ORDER BY COUNT(*) DESC
LIMIT 1;

- ### which is the most profitable category

SELECT * FROM sql_cx_live.order_details t1
JOIN sql_cx_live.category t2
ON t1.category_id = t2.category_id;

SELECT t2.vertical,
SUM(profit)
FROM sql_cx_live.order_details t1
JOIN sql_cx_live.category t2
ON t1.category_id = t2.category_id
GROUP BY t2.vertical
ORDER BY SUM(profit) DESC
LIMIT 1;


- ### which is the most profitable state

/*SELECT state, SUM(profit) FROM sql_cx_live.orders t1
JOIN sql_cx_live.order_details t2
ON t1.user_id = t2.user_id
JOIN sql_cx_live.flipkart_user t3
ON t1.user_id = t3.user_id
GROUP BY state
ORDER BY SUM(profit) DESC
LIMIT 1*/

