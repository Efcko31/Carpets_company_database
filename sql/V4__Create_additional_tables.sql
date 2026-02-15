CREATE TABLE client_order_history (
id SERIAL PRIMARY KEY,
client_id INTEGER REFERENCES client(id),
order_id INTEGER REFERENCES client_order(id),
created_at TIMESTAMPTZ DEFAULT NOW()
);
CREATE TABLE returns_of_customers (
id SERIAL PRIMARY KEY,
date_of_creation TIMESTAMPTZ DEFAULT NOW(),
client_id INTEGER REFERENCES client(id),
realisation_id INTEGER REFERENCES fitting_or_delivery(id),
sum_of_return NUMERIC(10,2),
shop_id INTEGER REFERENCES shops(id),
employee_id INTEGER REFERENCES employee(id)
);
