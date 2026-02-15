-- 1. Полный список ковров в заказах
SELECT * FROM full_list_carpets_in_order;

-- 2. Итоги по заказам
SELECT * FROM order_totals;

-- 3. Итоги по клиентам
SELECT * FROM client_totals;

-- 4. Магазины с товарами > 10
SELECT 
    l.id,
    l.address,
    SUM(lp.total) as total_products
FROM locations l
JOIN location_products lp ON l.id = lp.location_id
WHERE l.location_type = 'shop'
GROUP BY l.id
HAVING SUM(lp.total) > 10;

-- 5. Склады с товарами
SELECT 
    l.id,
    l.address,
    SUM(lp.total) as total_products
FROM locations l
JOIN location_products lp ON l.id = lp.location_id
WHERE l.location_type = 'warehouse'
GROUP BY l.id;
