WITH cte_orders AS (
    SELECT
        name,
        COUNT(person_order.id) AS count,
        'order' AS action_type
    FROM person_order
    JOIN menu ON menu.id = menu_id
    JOIN pizzeria ON pizzeria.id = pizzeria_id
    GROUP BY name
    ORDER BY count DESC
    LIMIT 3
), cte_visits AS (
    SELECT
        name,
        COUNT(person_visits.id) AS count,
        'visit' AS action_type
    FROM person_visits
    JOIN pizzeria ON pizzeria.id = pizzeria_id
    GROUP BY name
    ORDER BY count DESC
    LIMIT 3
)
SELECT *
FROM cte_orders
UNION
SELECT *
FROM cte_visits
ORDER BY action_type, count DESC;
