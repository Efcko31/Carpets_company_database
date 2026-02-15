-- Полный список ковров в заказах
CREATE OR REPLACE VIEW full_list_carpets_in_order AS
SELECT 
    oi.id,
    oi.order_id,
    p.product_name,
    p.product_size,
    oi.unit_price as price,
    oi.quantity,
    oi.discount_percent,
    ROUND(oi.unit_price * oi.quantity * (1 - COALESCE(oi.discount_percent,0)/100), 2) AS final_price
FROM order_items oi
JOIN product p ON p.id = oi.product_id
ORDER BY oi.order_id, oi.id;

--Итоги по заказам (вместо total_amount)
CREATE OR REPLACE VIEW order_totals AS
SELECT 
    o.id AS order_id,
    o.client_id,
    o.create_date,
    o.status,
    COUNT(oi.id) AS items_count,
    SUM(oi.quantity) AS total_quantity,
    ROUND(SUM(oi.unit_price * oi.quantity * (1 - COALESCE(oi.discount_percent,0)/100)), 2) AS total_amount
FROM client_order o
LEFT JOIN order_items oi ON o.id = oi.order_id
GROUP BY o.id;

-- Итоги по клиентам (вместо sum_purchases)
CREATE OR REPLACE VIEW client_totals AS
SELECT 
    c.id,
    c.first_name,
    c.last_name,
    c.email,
    c.phone_number,
    c.is_vip,
    COUNT(DISTINCT o.id) AS total_orders,
    ROUND(COALESCE(SUM(oi.unit_price * oi.quantity * (1 - COALESCE(oi.discount_percent,0)/100)), 0), 2) AS total_spent,
    MAX(o.create_date) AS last_order_date
FROM client c
LEFT JOIN client_order o ON c.id = o.client_id
LEFT JOIN order_items oi ON o.id = oi.order_id
GROUP BY c.id;
