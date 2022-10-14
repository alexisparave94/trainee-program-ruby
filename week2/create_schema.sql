BEGIN;
DROP TABLE IF EXISTS customers;
CREATE TABLE customers (
  id serial PRIMARY KEY,
  first_name varchar NOT NULL,
  last_name varchar NOT NULL,
  address varchar NOT NULL,
  phone varchar NOT NULL
);

DROP TABLE IF EXISTS products;
CREATE TABLE products (
  id serial PRIMARY KEY,
  sku varchar UNIQUE NOT NULL,
  name varchar UNIQUE NOT NULL,
  description varchar NOT NULL,
  price numeric CHECK (price > 0),
  stock integer DEFAULT 0 CHECK (stock >= 0)
);

DROP TABLE IF EXISTS orders;
CREATE TABLE orders (
  id serial PRIMARY KEY,
  date date,
  total numeric DEFAULT 0,
  status varchar DEFAULT 'pending',
  customer_id INTEGER NOT NULL REFERENCES customers(id)
);

COMMIT;