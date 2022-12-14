-- SELECT ALL PRODUCTS
SELECT * FROM products;

-- SELECT ALL CLIENTS
SELECT * FROM customers;

-- SELECT ALL ORDER LINES FROM AN ORDER
SELECT * FROM order_lines WHERE order_id = X;

-- SELECT ALL THE PRODUCTS WITH THE PROFITS
SELECT sku, name, SUM(order_lines.total) AS "Total profits" FROM orders
INNER JOIN order_lines ON orders.id = order_lines.order_id
INNER JOIN products ON products.id = order_lines.product_id
WHERE status = 'completed'
GROUP BY sku, name;

-- SELECT ALL ORDERS A PRODUCT HAS
SELECT order_id, date, status, product_id FROM orders 
INNER JOIN order_lines ON orders.id = order_lines.order_id
WHERE product_id = X;

-- SELECT THE TOTAL OF SALES OF X PRODUCT
SELECT SUM(order_lines.total) AS "Total of sales" FROM orders
INNER JOIN order_lines ON orders.id = order_lines.order_id
WHERE product_id = X AND status = 'completed';

-- UPDATE A PRODUCT PRICE BY 1.5 TIMES ITS VALUE
UPDATE products SET price = price * 1.5 WHERE id = X;

-- SELECT ALL THE CUSTOMERS WHO BOUGHT AN X PRODUCT
SELECT first_name, last_name, product_id, products.name FROM customers
INNER JOIN orders ON customers.id = orders.customer_id
INNER JOIN order_lines ON orders.id = order_lines.order_id
INNER JOIN products ON products.id = order_lines.product_id
WHERE product_id = X AND status = 'completed'
GROUP BY first_name, last_name, product_id, products.name;

-- SELECT ALL ORDERS BETWEEN DATES X AND Y (DATE = 'YYYY-MM-DD')
SELECT * FROM orders WHERE date BETWEEN 'FIRST_DATE' AND 'SECOND_DATE';

-- SELECT ALL PRODUCTS WITH PRICE GREATER THAN 4.5
SELECT * FROM products WHERE price > 4.5;

-- SELECT ALL THE PRODUCTS WITH THE QUANTITY A CUSTOMER HAS BOUGHT
SELECT product_id, products.name, SUM(quantity) AS "Total quantity" FROM customers
INNER JOIN orders ON customers.id = orders.customer_id
INNER JOIN order_lines ON orders.id = order_lines.order_id
INNER JOIN products ON products.id = order_lines.product_id
WHERE customer_id = X AND status = 'completed'
GROUP BY product_id, name;

-- SELECT THE TOTAL AMOUNT OF PRODUCTS A X CUSTOMER BOUGHT BETWEEN 2 DATES
SELECT SUM(quantity) AS "Total amount of products" FROM customers
INNER JOIN orders ON customers.id = orders.customer_id
INNER JOIN order_lines ON orders.id = order_lines.order_id
INNER JOIN products ON products.id = order_lines.product_id
WHERE customer_id = 1 AND status = 'completed' 
AND date BETWEEN '2022-01-26' AND '2022-10-11';
-- GROUP BY name;

-- SELECT WHAT IS THE MOST PURCHASED PRODUCT
SELECT name, SUM(quantity) AS total_quantity FROM orders 
INNER JOIN order_lines ON orders.id = order_lines.order_id
INNER JOIN products ON products.id = order_lines.product_id
WHERE status = 'completed'
GROUP BY name ORDER BY total_quantity DESC LIMIT 1;

-- DELETE A SPECIFIC ORDER
DELETE FROM orders WHERE id = X;