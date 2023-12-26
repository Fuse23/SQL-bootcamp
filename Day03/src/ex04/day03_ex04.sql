WITH cte_male AS (
    SELECT pizzeria_id
    FROM menu
    JOIN person_order ON menu_id = menu.id
    WHERE person_id IN (
        SELECT id
        FROM person
        WHERE gender = 'male'
    )
), cte_female AS (
    SELECT pizzeria_id 
    FROM menu
    JOIN person_order ON menu_id = menu.id
    WHERE person_id IN (
        SELECT id
        FROM person
        WHERE gender = 'female'
    )
)
SELECT name AS pizzeria_name
FROM pizzeria
WHERE pizzeria.id IN (
    SELECT pizzeria_id
    FROM cte_male
    WHERE pizzeria_id NOT IN (
        SELECT pizzeria_id
        FROM cte_female
    )
    UNION
    SELECT pizzeria_id
    FROM cte_female
    WHERE pizzeria_id NOT IN (
        SELECT pizzeria_id
        FROM cte_male
    )
)
ORDER BY pizzeria_name;
