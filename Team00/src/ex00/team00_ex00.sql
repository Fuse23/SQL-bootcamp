CREATE TABLE graph --ddl
(
    id     BIGINT PRIMARY KEY,
    point1 VARCHAR NOT NULL,
    point2 VARCHAR NOT NULL,
    cost   INT     NOT NULL
);

INSERT INTO graph VALUES (1, 'a', 'b', 10);
INSERT INTO graph VALUES (2, 'a', 'c', 15);
INSERT INTO graph VALUES (3, 'a', 'd', 20);

INSERT INTO graph VALUES (4, 'b', 'a', 10);
INSERT INTO graph VALUES (5, 'b', 'c', 35);
INSERT INTO graph VALUES (6, 'b', 'd', 25);

INSERT INTO graph VALUES (7, 'c', 'a', 15);
INSERT INTO graph VALUES (8, 'c', 'b', 35);
INSERT INTO graph VALUES (9, 'c', 'd', 30);

INSERT INTO graph VALUES (10, 'd', 'a', 20);
INSERT INTO graph VALUES (11, 'd', 'b', 25);
INSERT INTO graph VALUES (12, 'd', 'c', 30);


-- dml

WITH RECURSIVE TourPaths AS (
    SELECT
        point1 AS start_city,
        point1 AS current_city,
        ARRAY[point1] AS tour,
        0 AS total_cost
    FROM graph
    WHERE point1 = 'a'

    UNION

    SELECT
        TourPaths.start_city,
        graph.point2 AS current_city,
        array_cat(TourPaths.tour, ARRAY[graph.point2]),
        TourPaths.total_cost + graph.cost AS total_cost
    FROM TourPaths
    JOIN graph ON TourPaths.current_city = graph.point1
    WHERE NOT (graph.point2 = ANY(TourPaths.tour))
)
SELECT
    total_cost + graph.cost AS total_cost,
    array_cat(tour, ARRAY[graph.point2]) AS tour
FROM TourPaths
JOIN graph ON TourPaths.current_city = graph.point1 AND TourPaths.start_city = graph.point2
WHERE array_length(tour, 1) = (SELECT count(DISTINCT point1) FROM graph)
ORDER BY total_cost, tour
LIMIT 2;