DROP TABLE IF EXISTS bookings;
DROP TABLE IF EXISTS covers;
DROP TABLE IF EXISTS restaurants;
DROP TABLE IF EXISTS customers;

CREATE TABLE customers(
  id SERIAL8 PRIMARY KEY,
  first_name VARCHAR(255),
  last_name VARCHAR(255),
  email VARCHAR(255),
  phone_number VARCHAR(255),
  party_size INT2
);

CREATE TABLE restaurants(
  id SERIAL8 PRIMARY KEY,
  name VARCHAR(255),
  open VARCHAR(255),
  close VARCHAR(255)
);

CREATE TABLE covers(
  id SERIAL8 PRIMARY KEY,
  time_available VARCHAR(255),
  customers_id INT8 REFERENCES customers(id),
  restaurants_id INT8 REFERENCES restaurants(id),
  size INT2
);

CREATE TABLE bookings(
  id SERIAL8 PRIMARY KEY,
  customers_id INT8 REFERENCES customers(id),
  restaurants_id INT8 REFERENCES restaurants(id)
);
