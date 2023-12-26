WITH cte_male AS (
    SELECT
        COUNT(person_id) AS c,
        pizzeria_id
    FROM person_visits
    WHERE person_id IN (
        SELECT person.id
        FROM person
        WHERE gender = 'male'
    )
    GROUP BY pizzeria_id
), cte_female AS (
    SELECT
        COUNT(person_id) AS c,
        pizzeria_id
    FROM person_visits
    WHERE person_id IN (
        SELECT person.id
        FROM person
        WHERE gender = 'female'
    )
    GROUP BY pizzeria_id
)
SELECT pizzeria.name AS pizzeria_name
FROM pizzeria
WHERE pizzeria.id IN (
    SELECT cte_male.pizzeria_id
    FROM cte_male
    JOIN cte_female ON cte_female.pizzeria_id = cte_male.pizzeria_id
    WHERE cte_male.c != cte_female.c
)
ORDER BY pizzeria_name;
