WITH RECURSIVE cte_path AS (
    SELECT
        point1,
        point2,
        ARRAY[point1] AS tour,
        cost AS summ
    FROM graph
    WHERE point1 = 'a'
    UNION ALL
    SELECT
        graph.point1,
        graph.point2,
        ARRAY_APPEND(cte_path.tour, graph.point1) AS tour,
        cte_path.summ + graph.cost AS summ
    FROM graph
    JOIN cte_path ON graph.point1 = cte_path.point2
    WHERE NOT graph.point1 = ANY(cte_path.tour)
)
SELECT
    summ AS total_cost,
    ARRAY_APPEND(tour, point2) AS tour
FROM cte_path
WHERE
    ARRAY_LENGTH(tour, 1) = (SELECT COUNT(DISTINCT point1) FROM graph)
    AND point2 = 'a'
ORDER BY total_cost, tour;
