SELECT pizza_name, pizzeria.name AS pizzeria_name
FROM menu
JOIN pizzeria ON pizzeria.id = pizzeria_id
JOIN person_order ON menu_id = menu.id
JOIN person ON person.id = person_id
WHERE person.name IN ('Denis', 'Anna')
ORDER BY pizza_name, pizzeria_name;
