BEGIN;
DROP TABLE IF EXISTS customers;
CREATE TABLE customers (
  id serial PRIMARY KEY,
  first_name varchar NOT NULL,
  last_name varchar NOT NULL,
  address varchar NOT NULL,
  phone varchar NOT NULL
);

COMMIT;