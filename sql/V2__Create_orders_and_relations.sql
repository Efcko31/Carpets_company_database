CREATE TABLE client_order (
id SERIAL PRIMARY KEY,
client_id INTEGER REFERENCES client(id),
author_order INTEGER REFERENCES employee(id),
order_manager INTEGER REFERENCES shops(id),
status VARCHAR(20),
create_date TIMESTAMPTZ DEFAULT NOW(),
comments TEXT,
total_amount NUMERIC(10,2)
);
CREATE TABLE order_items (
id SERIAL PRIMARY KEY,
order_id INTEGER REFERENCES client_order(id),
product_id INTEGER REFERENCES product(id),
quantity INTEGER,
applied_discount INTEGER,
expected_delivery_date DATE,
from_production BOOLEAN,
final_price NUMERIC(10,2)
);
