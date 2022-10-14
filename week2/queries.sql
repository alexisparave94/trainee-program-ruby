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