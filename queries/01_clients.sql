-- Клиенты с email на Gmail
SELECT *
FROM client c 
WHERE c.email LIKE '%@gmail.com';

-- Клиенты VIP
SELECT *
FROM client 
WHERE is_vip = true;

-- Клиенты с суммой покупок (через VIEW)
SELECT * FROM client_totals;

-- Клиенты у которых больше одного заказа
SELECT *
FROM client c 
WHERE (SELECT count(*) FROM client_order co WHERE co.client_id = c.id) > 1;

-- Клиенты без заказов
SELECT *
FROM client c 
WHERE NOT EXISTS (SELECT 1 FROM client_order co WHERE co.client_id = c.id);
