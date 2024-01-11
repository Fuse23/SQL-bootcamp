CREATE UNIQUE INDEX idx_person_order_order_date ON person_order(menu_id, person_id)
WHERE order_date = '2022-01-01';

SET enable_seqscan TO OFF;

EXPLAIN ANALYZE SELECT person_id, menu_id
FROM person_order
WHERE order_date = '2022-01-01';
