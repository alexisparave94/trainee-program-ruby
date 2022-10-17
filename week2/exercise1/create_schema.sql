BEGIN;
-- Clean database
DROP TABLE IF EXISTS order_lines;
DROP TABLE IF EXISTS orders;
DROP TABLE IF EXISTS products;
DROP TABLE IF EXISTS customers;

-- Create customers table
CREATE TABLE customers (
  id serial PRIMARY KEY,
  first_name varchar NOT NULL,
  last_name varchar NOT NULL,
  address varchar NOT NULL,
  phone varchar NOT NULL
);

-- Create products table
CREATE TABLE products (
  id serial PRIMARY KEY,
  sku varchar UNIQUE NOT NULL,
  name varchar UNIQUE NOT NULL,
  description varchar NOT NULL,
  price numeric CHECK (price > 0),
  stock integer DEFAULT 0 CHECK (stock >= 0)
);

-- Create orders table
CREATE TABLE orders (
  id serial PRIMARY KEY,
  date date,
  total numeric DEFAULT 0,
  status varchar DEFAULT 'pending',
  customer_id INTEGER NOT NULL REFERENCES customers(id)
);

-- Create order_lines table
CREATE TABLE order_lines (
  order_id integer NOT NULL REFERENCES orders(id) ON DELETE CASCADE,
  product_id integer NOT NULL REFERENCES products(id),
  quantity integer CHECK (quantity > 0),
  price numeric CHECK (price > 0),
  total numeric GENERATED ALWAYS AS (price*quantity) STORED,
  UNIQUE (order_id, product_id)
);

COMMIT;

BEGIN;
--Create function to update the total of an order
CREATE OR REPLACE function SP_Update_total() returns Trigger
AS
$$
  BEGIN
    UPDATE orders SET total = total + new.total WHERE id = new.order_id;
    return new;
  END
$$
LANGUAGE plpgsql;

--Create the trigger to execute the storage procedure SP_Update_total each time a row is inserted in order_lines table
CREATE Trigger TR_Insert_order_line AFTER INSERT ON order_lines
for each row
EXECUTE PROCEDURE SP_Update_total();
COMMIT;
