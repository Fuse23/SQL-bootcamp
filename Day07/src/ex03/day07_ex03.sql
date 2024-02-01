WITH cte_orders AS (
    SELECT
        name,
        COUNT(person_order.id) AS count,
        'order' AS action_type
    FROM person_order
    JOIN menu ON menu.id = menu_id
    RIGHT JOIN pizzeria ON pizzeria.id = pizzeria_id
    GROUP BY name
    ORDER BY count DESC
), cte_visits AS (
    SELECT
        name,
        COUNT(person_visits.id) AS count,
        'visit' AS action_type
    FROM person_visits
    RIGHT JOIN pizzeria ON pizzeria.id = pizzeria_id
    GROUP BY name
    ORDER BY count DESC
)
SELECT name, SUM(count) AS total_count
FROM (
    SELECT *
    FROM cte_orders
    UNION
    SELECT *
    FROM cte_visits
) AS foo
GROUP BY name
ORDER BY total_count DESC, name;
