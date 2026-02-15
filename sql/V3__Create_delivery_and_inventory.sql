CREATE TABLE fitting_or_delivery (
id SERIAL PRIMARY KEY,
order_id INTEGER REFERENCES client_order(id),
create_date TIMESTAMPTZ DEFAULT NOW(),
delivery_day DATE,
delivery_address VARCHAR(100),
warehouse_id INTEGER REFERENCES warehouses(id),
shop_id INTEGER REFERENCES shops(id),
courier_id INTEGER REFERENCES employee(id),
status VARCHAR(20)
);
CREATE TABLE warehouses_products (
product_id INTEGER REFERENCES product(id),
warehouse_id INTEGER REFERENCES warehouses(id),
total INTEGER,
PRIMARY KEY (product_id, warehouse_id)
);
CREATE TABLE shops_product (
product_id INTEGER REFERENCES product(id),
shop_id INTEGER REFERENCES shops(id),
total INTEGER,
PRIMARY KEY (product_id, shop_id)
);
