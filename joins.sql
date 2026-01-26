-- 1.NO-JOIN:
SELECT * FROM user_join;
SELECT * FROM country_join;

-- 2.INNER-JOIN:
SELECT * FROM user_join A
INNER JOIN country_join B
ON A.id=B.id;

SELECT c.first_name,o.product_name
FROM customer_table c
INNER JOIN orders_table o
ON
c.customer_id = o.customer_id;

-- 3.LEFT-JOIN:
SELECT c.first_name,o.product_name,o.amount,o.order_date
FROM customer_table c
LEFT JOIN orders_table o
ON c.customer_id = o.customer_id;

-- 4.RIGHT-JOIN:
SELECT c.first_name,o.product_name,o.amount,o.order_date
FROM customer_table c
RIGHT JOIN orders_table o
ON c.customer_id = o.customer_id;

SELECT c.first_name,o.product_name,o.amount,o.order_date
FROM orders_table o
LEFT JOIN customer_table c
ON c.customer_id = o.customer_id; -- alternative way

-- 5.FULL-JOIN:
SELECT c.first_name,o.product_name,o.amount,o.order_date
FROM customer_table c
FULL JOIN orders_table O
ON c.customer_id=O.customer_id;

-- 6.LEFT-ANTI-JOIN:
SELECT c.first_name,o.product_name,o.amount,o.order_date
FROM customer_table c
LEFT JOIN orders_table o
ON c.customer_id=o.customer_id
WHERE o.customer_id is null;











