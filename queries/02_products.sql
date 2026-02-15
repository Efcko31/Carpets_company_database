-- 1. Ковры до 20 000 руб.
SELECT * FROM product
WHERE price < 20000.00;

-- 2. Ковры от 30 000 руб.
SELECT * FROM product
WHERE price >= 30000.00;

-- 3. Мягкие ковры (pile_height >= 15)
SELECT * FROM product
WHERE pile_height >= 15;

-- 4. Ковры из Турции
SELECT * FROM product
WHERE country_of_manufacture = 'Турция';

-- 5. Ковры из Турции или Бельгии
SELECT *
FROM product 
WHERE country_of_manufacture IN ('Турция', 'Бельгия');

-- 6. Дорогие мягкие ковры
SELECT * FROM product
WHERE price >= 40000.00 AND pile_height >= 15;

-- 7. Количество товаров по странам
SELECT 
    country_of_manufacture,
    COUNT(*) as product_count
FROM product  
GROUP BY country_of_manufacture 
ORDER BY product_count DESC;

-- 8. Средняя цена по странам
SELECT
    country_of_manufacture,
    ROUND(AVG(price), 2) as avg_price
FROM product 
GROUP BY country_of_manufacture;

-- 9. Страны, где средняя цена > 40 000
SELECT 
    country_of_manufacture
FROM product 
GROUP BY country_of_manufacture 
HAVING AVG(price) > 40000;

-- 10. Товары, которые ни разу не заказывали
SELECT *
FROM product p 
WHERE NOT EXISTS (SELECT 1 FROM order_items oi WHERE oi.product_id = p.id);
