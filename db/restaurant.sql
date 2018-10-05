DROP TABLE IF EXISTS covers;
DROP TABLE IF EXISTS customers;

CREATE TABLE customers(
  id SERIAL8 PRIMARY KEY,
  first_name VARCHAR(255),
  last_name VARCHAR(255),
  email VARCHAR(255),
  party_size INT2
);

CREATE TABLE covers(
  id SERIAL8 PRIMARY KEY,
  customer_id REFERENCES cutsomers(id)
);
