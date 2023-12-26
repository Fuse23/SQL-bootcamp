SELECT
    pizza_name,
    price,
    name AS pizzeria_name
FROM menu
JOIN pizzeria ON pizzeria.id = pizzeria_id
WHERE NOT EXISTS (
    SELECT menu_id
    FROM person_order
    WHERE menu.id = menu_id
)
ORDER BY pizza_name, price;
