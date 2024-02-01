SELECT DISTINCT name
FROM person_order
JOIN person ON person.id = person_id
ORDER BY name;
