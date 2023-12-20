SELECT
    order_date,
    CONCAT(name, ' (age:', age, ')') AS person_information
FROM person
NATURAL JOIN (
    SELECT person_id AS id, order_date
    FROM person_order
) AS tmp
ORDER BY order_date, person_information;
