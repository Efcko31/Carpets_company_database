CREATE INDEX idx_client_order_client_id ON client_order(client_id);
CREATE INDEX idx_client_order_author_order ON client_order(author_order);
CREATE INDEX idx_client_order_order_manager ON client_order(order_manager);
CREATE INDEX idx_client_order_status ON client_order(status);
CREATE INDEX idx_client_order_create_date ON client_order(create_date);

CREATE INDEX idx_order_items_order_id ON order_items(order_id);
CREATE INDEX idx_order_items_product_id ON order_items(product_id);

CREATE INDEX idx_fitting_or_delivery_order_id ON fitting_or_delivery(order_id);
CREATE INDEX idx_fitting_or_delivery_location_id ON fitting_or_delivery(location_id);
CREATE INDEX idx_fitting_or_delivery_courier_id ON fitting_or_delivery(courier_id);
CREATE INDEX idx_fitting_or_delivery_status ON fitting_or_delivery(status);

CREATE INDEX idx_location_products_location_id ON location_products(location_id);
CREATE INDEX idx_location_products_product_id ON location_products(product_id);

CREATE INDEX idx_returns_client_id ON returns_of_customers(client_id);
CREATE INDEX idx_returns_realisation_id ON returns_of_customers(realisation_id);
CREATE INDEX idx_returns_location_id ON returns_of_customers(location_id);
CREATE INDEX idx_returns_employee_id ON returns_of_customers(employee_id);

CREATE INDEX idx_client_order_history_client_id ON client_order_history(client_id);
CREATE INDEX idx_client_order_history_order_id ON client_order_history(order_id);
