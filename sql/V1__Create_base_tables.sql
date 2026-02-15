CREATE SCHEMA IF NOT EXISTS kovry_company;
SET search_path TO kovry_company;
CREATE TABLE client (
id SERIAL PRIMARY KEY,
phone_number VARCHAR(20) NOT NULL UNIQUE,
first_name VARCHAR(20) NOT NULL,
last_name VARCHAR(20),
patronymic VARCHAR(20),
email VARCHAR(40),
birthday_date DATE,
is_vip BOOLEAN DEFAULT false,
password VARCHAR(255) NOT NULL,
registration_day TIMESTAMPTZ DEFAULT NOW(),
sum_purchases NUMERIC(10,2) DEFAULT 0
);
CREATE TABLE employee (
id SERIAL PRIMARY KEY,
phone_number VARCHAR(20) NOT NULL UNIQUE,
first_name VARCHAR(20) NOT NULL,
last_name VARCHAR(20),
patronymic VARCHAR(20),
email VARCHAR(40),
password VARCHAR(255) NOT NULL,
registration_day TIMESTAMPTZ DEFAULT NOW(),
dismissal_date TIMESTAMPTZ,
place_of_work VARCHAR(100)
);
CREATE TABLE product (
id SERIAL PRIMARY KEY,
product_name VARCHAR(55),
product_size VARCHAR(20),
price NUMERIC(10,2) NOT NULL,
pile_height INTEGER,
country_of_manufacture VARCHAR(50)
);
CREATE TABLE shops (
id SERIAL PRIMARY KEY,
phone_number VARCHAR(20) NOT NULL,
email VARCHAR(40),
address VARCHAR(100)
);
CREATE TABLE warehouses (
id SERIAL PRIMARY KEY,
phone_number VARCHAR(20) NOT NULL,
email VARCHAR(40),
address VARCHAR(100)
);
CREATE TABLE discount_rules (
percentage INTEGER PRIMARY KEY,
min_amount_customers_purchase NUMERIC(10,2),
discount_percentage INTEGER,
rule_name VARCHAR(100)
);
CREATE TABLE holiday_discount (
id SERIAL PRIMARY KEY,
holiday_name TEXT,
discount_percentage INTEGER
); 
