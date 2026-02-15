INSERT INTO client (phone_number, first_name, last_name, email, is_vip, password) VALUES
('+79161234567', 'Иван', 'Петров', 'ivan@mail.ru', true, 'hash1'),
('+79162345678', 'Мария', 'Сидорова', 'maria@gmail.com', false, 'hash2'); 
INSERT INTO employee (phone_number, first_name, last_name, email, password, place_of_work) VALUES
('+79170001111', 'Александр', 'Иванов', 'alex@company.ru', 'emp1', 'Москва-Тверская'),
('+79170002222', 'Ольга', 'Смирнова', 'olga@company.ru', 'emp2', 'Москва-Арбат');
INSERT INTO product (product_name, product_size, price, country_of_manufacture) VALUES
('Ковер "Классика"', '2x3 м', 15000.00, 'Турция'),
('Ковер "Премиум"', '3x4 м', 35000.00, 'Бельгия');
INSERT INTO shops (phone_number, email, address) VALUES
('+74951111111', 'shop1@mail.ru', 'Москва, ул. Тверская, 10'),
('+74952222222', 'shop2@mail.ru', 'Москва, ул. Арбат, 25');
