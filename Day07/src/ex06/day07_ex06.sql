SELECT
    name,
    COUNT(pizzeria_id) AS count_of_orders,
    CAST(ROUND(AVG(price), 2) AS REAL) AS average_price,
    MAX(price) AS max_price,
    MIN(price) AS min_price
FROM person_order
JOIN menu ON menu.id = menu_id
JOIN pizzeria ON pizzeria.id = pizzeria_id
GROUP BY name
ORDER BY name;
