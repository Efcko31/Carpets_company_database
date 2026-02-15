-- 1. Заказы со статусом processing
SELECT * FROM client_order 
WHERE status = 'processing';

-- 2. Заказы со статусом completed
SELECT * FROM client_order 
WHERE status = 'completed';

-- 3. Клиенты с количеством заказов (без GROUP BY)
SELECT 
    c.id, 
    c.first_name, 
    c.last_name, 
    c.phone_number,
    (SELECT COUNT(*) FROM client_order co WHERE co.client_id = c.id) as total_orders
FROM client c 
ORDER BY total_orders DESC;

-- 4. Клиенты с 3+ заказами
SELECT 
    client_id, 
    COUNT(*) as total_orders 
FROM client_order_history
GROUP BY client_id
HAVING COUNT(*) >= 3
ORDER BY total_orders DESC;

-- 5. Клиенты с заказами дороже 100 000
SELECT *
FROM client c 
WHERE EXISTS (SELECT 1 FROM client_order co WHERE co.client_id = c.id AND co.total_amount > 100000);

-- 6. Клиенты с completed-заказами
SELECT *
FROM client c 
WHERE EXISTS (SELECT 1 FROM client_order co WHERE co.status = 'completed' AND co.client_id = c.id);

-- 7. Клиенты без cancelled-заказов
SELECT *
FROM client c 
WHERE NOT EXISTS (SELECT 1 FROM client_order co WHERE co.status = 'cancelled' AND co.client_id = c.id);
