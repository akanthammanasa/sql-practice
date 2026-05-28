--Day 4 SQL Practice-May 28
--Topics: JOINs


-- INNER JOIN: Show all orders with customer names
SELECT orders.order_id, customers.customer_name, orders.sales
FROM orders
INNER JOIN customers ON orders.customer_id = customers.customer_id;

-- LEFT JOIN: Show all customers and their orders (if any)
SELECT customers.customer_name, orders.order_id, orders.sales
FROM customers
LEFT JOIN orders ON customers.customer_id = orders.customer_id;

-- RIGHT JOIN: Show all orders and their customers (if any)
SELECT customers.customer_name, orders.order_id, orders.sales
FROM customers
RIGHT JOIN orders ON customers.customer_id = orders.customer_id;

-- FULL OUTER JOIN: Show all customers and orders, matching where possible
SELECT customers.customer_name, orders.order_id, orders.sales
FROM customers
FULL OUTER JOIN orders ON customers.customer_id = orders.customer_id;

--Without Aliases
SELECT customers.customer_name, orders.order_id, orders.sales
FROM customers
INNER JOIN orders ON customers.customer_id = orders.customer_id;

--With Aliases - shorter and cleaner
SELECT c.customer_name, o.order_id, o.sales
FROM customers AS c
INNER JOIN orders AS o ON c.customer_id = o.customer_id;

--JOIN with WHERE and GROUP BY: Total sales per customer
SELECT c.customer_name, SUM(o.sales) AS total_sales
FROM customers AS c
INNER JOIN orders AS o ON c.customer_id = o.customer_id
GROUP BY c.customer_name
ORDER BY total_sales DESC;
