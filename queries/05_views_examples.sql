--  Использование VIEW в запросах
SELECT * FROM full_list_carpets_in_order WHERE order_id = 1;
SELECT * FROM order_totals WHERE total_amount > 50000;
SELECT * FROM client_totals WHERE total_orders >= 3;

-- VIEW + агрегация
SELECT 
    AVG(total_spent) as avg_customer_spent,
    MAX(total_spent) as max_customer_spent,
    SUM(total_spent) as total_revenue
FROM client_totals;
