WITH pepperoni_order AS (
    SELECT person_id
    FROM person_order
    JOIN menu ON menu.id = menu_id
    WHERE pizza_name = 'pepperoni pizza'
), cheese_order AS (
    SELECT person_id
    FROM person_order
    JOIN menu ON menu.id = menu_id
    WHERE pizza_name = 'cheese pizza'
), both_order AS (
    SELECT pepperoni_order.person_id
    FROM pepperoni_order
    JOIN cheese_order ON cheese_order.person_id = pepperoni_order.person_id
)
SELECT name
FROM person
JOIN both_order ON person.id = person_id
WHERE gender = 'female'
ORDER BY name;
