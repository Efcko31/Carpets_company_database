CREATE TABLE locations (
id SERIAL PRIMARY KEY,
phone_number VARCHAR(20) NOT NULL,
email VARCHAR(40),
address VARCHAR(100),
location_type VARCHAR(10) NOT NULL CHECK (location_type IN ('shop', 'warehouse')),
is_retail BOOLEAN DEFAULT FALSE
);
INSERT INTO locations (phone_number, email, address, location_type, is_retail)
SELECT phone_number, email, address, 'shop', TRUE FROM shops;
INSERT INTO locations (phone_number, email, address, location_type, is_retail)
SELECT phone_number, email, address, 'warehouse', FALSE FROM warehouses;
ALTER TABLE client_order ADD COLUMN order_manager_new INTEGER REFERENCES locations(id);
UPDATE client_order SET order_manager_new = order_manager;
ALTER TABLE client_order DROP COLUMN order_manager;
ALTER TABLE client_order RENAME COLUMN order_manager_new TO order_manager;
ALTER TABLE fitting_or_delivery ADD COLUMN location_id INTEGER REFERENCES locations(id);
UPDATE fitting_or_delivery SET location_id = COALESCE(shop_id, warehouse_id);
ALTER TABLE fitting_or_delivery DROP COLUMN shop_id, DROP COLUMN warehouse_id;
CREATE TABLE location_products (
location_id INTEGER REFERENCES locations(id),
product_id INTEGER REFERENCES product(id),
total INTEGER,
PRIMARY KEY (location_id, product_id)
);
ALTER TABLE returns_of_customers ADD COLUMN location_id INTEGER REFERENCES locations(id);
UPDATE returns_of_customers SET location_id = shop_id;
ALTER TABLE returns_of_customers DROP COLUMN shop_id;
INSERT INTO location_products (location_id, product_id, total) 
SELECT shop_id, product_id, total FROM shops_product;
INSERT INTO location_products (location_id, product_id, total) 
SELECT warehouse_id, product_id, total FROM warehouses_products;
DROP TABLE shops_product CASCADE;
DROP TABLE warehouses_products CASCADE;
DROP TABLE shops CASCADE;
DROP TABLE warehouses CASCADE;
