BEGIN;
-- Customers
INSERT INTO customers(first_name, last_name, address, phone) VALUES ('Alexis', 'Parave', 'Av San Martin 243', '+51 959873639');
INSERT INTO customers(first_name, last_name, address, phone) VALUES ('Lazaro', 'Parave', 'Av Simon Boliva Mz7 Lt4', '+51 944445533');
INSERT INTO customers(first_name, last_name, address, phone) VALUES ('Fatima', 'Vargas', 'Av Lima 345', '+51 94435554');
INSERT INTO customers(first_name, last_name, address, phone) VALUES ('Daniel', 'Salazar', 'Av Proceres 3456', '+51 94345540');
INSERT INTO customers(first_name, last_name, address, phone) VALUES ('Gisela', 'Larriega', 'Av 28 de julio 2345', '+51 943400533');

-- Products
INSERT INTO products(sku, name, description, price, stock) VALUES ('SKU-001', 'Laptop Dell Inspiron 15 3511', 'HD 15.6", Intel Core i5-1135G7, 256GB ssd +1TB Hdd, 8GB ram, Win11H, teclado español', 2900.00, 12);
INSERT INTO products(sku, name, description, price, stock) VALUES ('SKU-002', 'Silla gamer Raven RGB', 'Cojín masajeador, control de luces, tapiz cuero PU, máx. 120 kg, inclinación 135°, negro', 540.00, 10);
INSERT INTO products(sku, name, description, price, stock) VALUES ('SKU-003', 'Impresora Epson L3560', 'Multifuncional, inalámbrica con tanques de tinta', 980.00, 15);
INSERT INTO products(sku, name, description, price, stock) VALUES ('SKU-004', 'Monitor plano LG', '31.5", Panel IPS, FHD, 5ms, 75 Hz, FreeSync', 1100.00, 15);
INSERT INTO products(sku, name, description, price, stock) VALUES ('SKU-005', 'Audifonos Decibel', 'Con cancelación de ruido Decibel Beloose micrófono incorporado, máx. 36 horas, asistente de voz, negro', 150.00, 9);
INSERT INTO products(sku, name, description, price, stock) VALUES ('SKU-006', 'Parlante Philips TAW6205 ', 'Bluetooth Philips TAW6205 40W, Wifi', 500.00, 13);
INSERT INTO products(sku, name, description, price, stock) VALUES ('SKU-007', 'Cámara web Jetion PJT-DCM141', 'Conexión usb 2.0, 720p, incluye clip, cable 1.2 metros', 50.00, 18);
INSERT INTO products(sku, name, description, price, stock) VALUES ('SKU-008', 'Cooler para laptop Teraware', 'Máx. 17", 2 puertos usb, 1 ventilador, 5 niveles de altura', 50.00, 15);
INSERT INTO products(sku, name, description, price, stock) VALUES ('SKU-009', 'Audífonos Teraware', 'Con micrófono, conexión 3.5 mm, control de volumen, cable 2 metros, rojo y negro', 60.00, 20);
INSERT INTO products(sku, name, description, price, stock) VALUES ('SKU-010', 'Mouse inalámbrico Teraware', 'resolución 800/1200/1600 DPI, 6 botones, usa pilas, color negro', 30.00, 50);
INSERT INTO products(sku, name, description, price, stock) VALUES ('SKU-011', 'Memoria USB 3.2 Kingston', '64GB de capacidad, negro', 25.00, 60);
INSERT INTO products(sku, name, description, price, stock) VALUES ('SKU-012', 'Audífonos bluetooth Izuum Earbuds', 'Resistente al agua IPX5, duración máx. 3 horas, negro', 70.00, 50);
INSERT INTO products(sku, name, description, price, stock) VALUES ('SKU-013', 'Audífonos in ear Skullcandy JIB', 'Con micrófono ,almohadillas de silicona, conector 3.5 mm, control de música y llamadas, negro', 120.00, 25);
INSERT INTO products(sku, name, description, price, stock) VALUES ('SKU-014', 'Laptop Apple MacBook Air 13.3"', 'Pantalla retina IPS, M1 8-core, 256GB ssd, 8GB ram, macOS, teclado inglés, gris', 4900.00, 40);
INSERT INTO products(sku, name, description, price, stock) VALUES ('SKU-015', 'Laptop HP 15-EF1009LA 15.6"', 'MD Ryzen 3 4300U, 256GB ssd, 4GB ram, Radeon, Win10 Home, teclado español, plateado', 1600.00, 70);
INSERT INTO products(sku, name, description, price, stock) VALUES ('SKU-016', 'Laptop Lenovo IdeaPad 81XA008XLM 13.3"', 'Intel Core i5, 512GB ssd, 8GB ram, Uhd, teclado español', 2500.00, 60);
INSERT INTO products(sku, name, description, price, stock) VALUES ('SKU-017', 'Laptop Lenovo 81X80055US 15.6"', 'Intel Core i3 11va Gen-1115G4, 128GB ssd, 4GB ram, Uhd, Win10 Home, teclado inglés, azul (reempacada)', 1500.00, 30);
INSERT INTO products(sku, name, description, price, stock) VALUES ('SKU-018', 'Mouse inalámbrico Logitech M220', 'Silencioso, receptor usb, 1000 dpi, 3 botones, usa pila, negro', 60.00, 60);
INSERT INTO products(sku, name, description, price, stock) VALUES ('SKU-019', 'Altavoz inteligente Xiaomi', 'Control con reloj, con asistente de voz Google, negro', 200.00, 30);
INSERT INTO products(sku, name, description, price, stock) VALUES ('SKU-020', 'Parlante Bluetooth JBL', '30w, IP67, máx. 20 horas, 7500 mAh, Función TWS, USB-C, negro', 800.00, 15);

-- Orders
INSERT INTO orders(date, customer_id, status) VALUES ('10-10-2022', 1, 'pending');
INSERT INTO orders(date, customer_id, status) VALUES ('08-10-2022', 2, 'pending');
INSERT INTO orders(date, customer_id, status) VALUES ('07-15-2022', 2, 'billed');
INSERT INTO orders(date, customer_id, status) VALUES ('05-25-2022', 1, 'completed');
INSERT INTO orders(date, customer_id, status) VALUES ('03-02-2022', 3, 'billed');
INSERT INTO orders(date, customer_id, status) VALUES ('01-22-2022', 3, 'completed');
INSERT INTO orders(date, customer_id, status) VALUES ('12-14-2021', 4, 'completed');
INSERT INTO orders(date, customer_id, status) VALUES ('12-01-2021', 5, 'refused');
INSERT INTO orders(date, customer_id, status) VALUES ('11-15-2021', 4, 'completed');
INSERT INTO orders(date, customer_id, status) VALUES ('10-09-2021', 2, 'completed');
INSERT INTO orders(date, customer_id, status) VALUES ('09-07-2021', 1, 'completed');

-- Order lines
INSERT INTO order_lines(order_id, product_id, quantity, price) VALUES (1, 2, 2, 2900.00);
INSERT INTO order_lines(order_id, product_id, quantity, price) VALUES (1, 3, 3, 980.00);
INSERT INTO order_lines(order_id, product_id, quantity, price) VALUES (1, 4, 1, 1100.00);
INSERT INTO order_lines(order_id, product_id, quantity, price) VALUES (2, 5, 2, 150.00);
INSERT INTO order_lines(order_id, product_id, quantity, price) VALUES (2, 6, 2, 500.00);
INSERT INTO order_lines(order_id, product_id, quantity, price) VALUES (3, 8, 5, 50.00);
INSERT INTO order_lines(order_id, product_id, quantity, price) VALUES (4, 9, 2, 60.00);
INSERT INTO order_lines(order_id, product_id, quantity, price) VALUES (4, 10, 4, 30.00);
INSERT INTO order_lines(order_id, product_id, quantity, price) VALUES (4, 11, 3, 25.00);
INSERT INTO order_lines(order_id, product_id, quantity, price) VALUES (5, 12, 5, 70.00);
INSERT INTO order_lines(order_id, product_id, quantity, price) VALUES (5, 14, 2, 4900.00);
INSERT INTO order_lines(order_id, product_id, quantity, price) VALUES (6, 15, 2, 1600.00);
INSERT INTO order_lines(order_id, product_id, quantity, price) VALUES (6, 16, 3, 2500.00);
INSERT INTO order_lines(order_id, product_id, quantity, price) VALUES (6, 17, 2, 1500.00);
INSERT INTO order_lines(order_id, product_id, quantity, price) VALUES (7, 1, 1, 2900.00);
INSERT INTO order_lines(order_id, product_id, quantity, price) VALUES (7, 18, 1, 60.00);
INSERT INTO order_lines(order_id, product_id, quantity, price) VALUES (7, 7, 1, 50.00);
INSERT INTO order_lines(order_id, product_id, quantity, price) VALUES (7, 20, 1, 800.00);
INSERT INTO order_lines(order_id, product_id, quantity, price) VALUES (8, 19, 3, 200.00);
INSERT INTO order_lines(order_id, product_id, quantity, price) VALUES (8, 10, 4, 30.00);
INSERT INTO order_lines(order_id, product_id, quantity, price) VALUES (9, 13, 5, 120.00);
INSERT INTO order_lines(order_id, product_id, quantity, price) VALUES (9, 11, 6, 25.00);
INSERT INTO order_lines(order_id, product_id, quantity, price) VALUES (10, 1, 1, 2900.00);
INSERT INTO order_lines(order_id, product_id, quantity, price) VALUES (10, 14, 2, 4900.00);
INSERT INTO order_lines(order_id, product_id, quantity, price) VALUES (10, 15, 3, 1600.00);
INSERT INTO order_lines(order_id, product_id, quantity, price) VALUES (10, 16, 2, 2500.00);
INSERT INTO order_lines(order_id, product_id, quantity, price) VALUES (10, 17, 1, 1500.00);
INSERT INTO order_lines(order_id, product_id, quantity, price) VALUES (11, 9, 3, 60.00);
COMMIT;