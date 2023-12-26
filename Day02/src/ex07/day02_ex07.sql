SELECT pizzeria.name
FROM pizzeria
JOIN person_visits ON person_visits.pizzeria_id = pizzeria.id
JOIN person ON person_id = person.id
JOIN menu ON menu.pizzeria_id = pizzeria.id
WHERE
    person.name = 'Dmitriy'
    AND visit_date = '2022-01-08'
    AND price < 800;
