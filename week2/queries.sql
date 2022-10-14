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