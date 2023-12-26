SELECT
    pizza_name,
    pizzeria.name AS pizzeria_name,
    price
FROM menu
JOIN pizzeria ON pizzeria.id = pizzeria_id
WHERE pizza_name IN ('mushroom pizza', 'pepperoni pizza')
ORDER BY pizza_name, pizzeria_name;
