\# Carpets Company Database



Учебный проект базы данных для компании по продаже ковров.  

Реализована полная структура БД с помощью миграций Flyway, нормализация, индексы, триггеры и аналитические представления.



\## Стек технологий



\- \*\*PostgreSQL\*\* — реляционная база данных

\- \*\*Flyway\*\* — версионирование схемы и миграции

\- \*\*Git\*\* — контроль версий



\## Структура проекта



```

Carpets-Company-Database/

├── sql/                    # Миграции Flyway

│   ├── V1\_\_Create\_base\_tables.sql

│   ├── V2\_\_Create\_orders\_and\_relations.sql

│   ├── ...

│   └── V21\_\_add\_remaining\_data.sql

├── queries/                 # Аналитические SQL-запросы

│   ├── 01\_clients.sql

│   ├── 02\_products.sql

│   ├── 03\_orders.sql

│   ├── 04\_reports.sql

│   └── 05\_views\_examples.sql

└── README.md

```



\## Модель данных



\### Основные таблицы

\- `client` — клиенты (VIP, контакты, дата регистрации)

\- `product` — товары (название, размер, цена, страна производства)

\- `locations` — объединённые магазины и склады

\- `employee` — сотрудники

\- `client\_order` — заказы

\- `order\_items` — позиции заказов



\### Вспомогательные таблицы

\- `fitting\_or\_delivery` — доставки и примерки

\- `location\_products` — остатки товаров на локациях

\- `returns\_of\_customers` — возвраты

\- `client\_order\_history` — история заказов



\### Представления (VIEW)

\- `full\_list\_carpets\_in\_order` — детализация заказов

\- `order\_totals` — суммы по заказам

\- `client\_totals` — статистика по клиентам

\- `sales\_report` — отчёт по продажам



\## Особенности реализации



\- \*\*Нормализация 3НФ\*\* — устранены избыточные и вычисляемые поля

\- \*\*Триггеры\*\* — автообновление `updated\_at`

\- \*\*Индексы\*\* — на всех внешних ключах для ускорения JOIN

\- \*\*Flyway\*\* — версионирование схемы (21 миграция)

\- \*\*Тестовые данные\*\* — 84 товара, 50+ клиентов, 30+ заказов



\## Примеры запросов



```sql

-- Топ клиентов по сумме покупок

SELECT \* FROM client\_totals ORDER BY total\_spent DESC LIMIT 10;



-- Отчёт по продажам за месяц

SELECT \* FROM sales\_report WHERE month = '2026-01-01';



-- Товары, которые ни разу не заказывали

SELECT \* FROM product 

WHERE NOT EXISTS (SELECT 1 FROM order\_items WHERE product\_id = product.id);

```



\## Запуск проекта



\### Требования

\- PostgreSQL 16+

\- Flyway 11+

\- Git



\### Установка

```bash

\# Клонировать репозиторий

git clone https://github.com/Efcko31/Carpets-Company-Database.git

cd Carpets-Company-Database



\# Создать файл конфигурации (заменить пароль)

echo "flyway.url=jdbc:postgresql://localhost:5432/postgres

flyway.user=postgres

flyway.password=ТВОЙ\_ПАРОЛЬ

flyway.schemas=kovry\_company

flyway.locations=filesystem:./sql" > flyway.conf



\# Запустить миграции

flyway migrate



\# Проверить результат

flyway info

```



\## Планы по развитию



\- Интеграция с Java/Spring Boot

\- REST API для работы с данными

\- Docker-контейнеризация

\- Партиционирование больших таблиц



\## Лицензия



Проект создан в учебных целях. Свободно для использования и модификации.



---



\*\*Автор:\*\* Илья  

\*\*GitHub:\*\* \[@Efcko31](https://github.com/Efcko31)

