SELECT
    person.name,
    pizza_name,
    price,
    CAST(price - price * (discount / 100) AS REAL) AS discount_price,
    pizzeria.name AS pizzeria_name
FROM person_order
JOIN person ON person.id = person_order.person_id
JOIN menu ON menu.id = menu_id
JOIN pizzeria ON pizzeria.id = menu.pizzeria_id
JOIN person_discounts
    ON person.id = person_discounts.person_id
    AND pizzeria.id = person_discounts.pizzeria_id
ORDER BY person.name, pizza_name;
