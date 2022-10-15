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