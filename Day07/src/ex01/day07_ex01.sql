SELECT name, COUNT(person_id) AS count_of_visits
FROM person_visits
JOIN person ON person.id = person_id
GROUP BY name
ORDER BY count_of_visits DESC, name
LIMIT 4;
