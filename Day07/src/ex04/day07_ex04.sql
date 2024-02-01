SELECT name, COUNT(person_visits.id) AS count_of_visits
FROM person_visits
JOIN person ON person_id = person.id
GROUP BY name
HAVING COUNT(*) > 3;
