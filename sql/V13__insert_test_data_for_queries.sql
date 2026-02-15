-- Клиенты с явным указанием ID
INSERT INTO client (id, phone_number, first_name, last_name, email, is_vip, password) VALUES
(3, '+79160001122', 'Дмитрий', 'Смирнов', 'dmitry@gmail.com', true, 'hash3'),
(4, '+79160003344', 'Елена', 'Козлова', 'elena@mail.ru', false, 'hash4'),
(5, '+79160005566', 'Алексей', 'Морозов', 'alexey@gmail.com', false, 'hash5');
SELECT setval('client_id_seq', 5);

-- Новые товары (31-34)
INSERT INTO product (id, product_name, product_size, price, pile_height, country_of_manufacture) VALUES
(31, 'Ковер "Вельвет"', '2x3 м', 45000.00, 18, 'Бельгия'),
(32, 'Ковер "Шелковый путь"', '3x4 м', 65000.00, 20, 'Иран'),
(33, 'Ковер "Комфорт"', '2.5x3.5 м', 25000.00, 15, 'Турция'),
(34, 'Ковер "Эконом"', '1.5x2 м', 8000.00, 8, 'Россия');
SELECT setval('product_id_seq', 34);

-- Заказы (используем существующие ID клиентов 1,2,3,4,5)
INSERT INTO client_order (id, client_id, author_order, order_manager, status, create_date, comments) VALUES
(52, 1, 1, 1, 'completed', '2026-01-15', 'VIP заказ'),
(53, 1, 1, 1, 'completed', '2026-01-20', 'Повторный'),
(54, 1, 2, 1, 'processing', '2026-02-01', 'Третий заказ'),
(55, 2, 1, 2, 'completed', '2026-01-10', 'Первый'),
(56, 2, 2, 2, 'cancelled', '2026-01-25', 'Отмена'),
(57, 3, 1, 1, 'completed', '2026-01-05', 'Дорогой заказ'),
(58, 4, 2, 2, 'processing', '2026-02-05', 'Новый');
SELECT setval('client_order_id_seq', 58);

-- Позиции заказов (только существующие product_id)
INSERT INTO order_items (order_id, product_id, quantity, discount_percent, unit_price, expected_delivery_date) VALUES
(54, 31, 2, 0, 45000.00, '2026-02-10'),
(57, 32, 1, 15, 65000.00, '2026-01-10'),
(58, 33, 3, 0, 25000.00, '2026-02-15');

-- История заказов
INSERT INTO client_order_history (client_id, order_id) VALUES
(1, 52), (1, 53), (1, 54),
(2, 55), (2, 56),
(3, 57),
(4, 58);

-- Товары на локации
INSERT INTO location_products (location_id, product_id, total) VALUES
(1, 31, 5),
(1, 32, 3),
(1, 33, 8),
(2, 1, 12),
(2, 2, 7);
