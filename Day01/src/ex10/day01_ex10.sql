SELECT
    person.name AS person_name,
    pizza_name,
    pizzeria.name AS pizzeria_name
FROM pizzeria
JOIN menu ON menu.pizzeria_id = pizzeria.id
JOIN person_order ON person_order.menu_id = menu.id
JOIN person ON person.id = person_order.person_id
ORDER BY person_name, pizza_name, pizzeria_name;
