INSERT INTO person_order
SELECT
    generate_series(
        (SELECT MAX(id) + 1 FROM person_order),
        (SELECT MAX(id) FROM person) + (SELECT MAX(id) FROM person_order),
        1
    ),
    generate_series(
        (SELECT MIN(id) FROM person),
        (SELECT MAX(id) FROM person)
    ),
    (SELECT id FROM menu WHERE pizza_name = 'greek pizza'),
    '2022-02-25';
