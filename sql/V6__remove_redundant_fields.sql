ALTER TABLE client DROP COLUMN sum_purchases;
ALTER TABLE client_order DROP COLUMN total_amount;
ALTER TABLE order_items DROP COLUMN final_price;
ALTER TABLE order_items ADD COLUMN unit_price NUMERIC(10,2);
ALTER TABLE order_items ADD COLUMN discount_percent DECIMAL(5,2); 
UPDATE order_items oi SET unit_price = p.price FROM product p WHERE oi.product_id = p.id AND oi.unit_price IS NULL;
