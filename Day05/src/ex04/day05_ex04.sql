CREATE UNIQUE INDEX idx_menu_unique ON menu(pizzeria_id, pizza_name);

SET enable_seqscan TO OFF;

EXPLAIN ANALYZE SELECT pizzeria_id, pizza_name
FROM menu
WHERE pizzeria_id BETWEEN 3 AND 5 AND pizza_name = 'supreme pizza';
