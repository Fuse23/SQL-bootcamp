SELECT pizzeria.name AS pizzeria_name
FROM person_visits
JOIN pizzeria ON pizzeria.id = pizzeria_id
JOIN person ON person.id = person_id
WHERE person.name = 'Andrey'
EXCEPT
SELECT pizzeria.name AS pizzeria_name
FROM person_order
JOIN menu ON menu.id = menu_id
JOIN pizzeria ON pizzeria.id = pizzeria_id
JOIN person ON person.id = person_id
WHERE person.name = 'Andrey'
ORDER BY pizzeria_name;
