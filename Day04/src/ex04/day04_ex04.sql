CREATE VIEW v_symmetric_union AS (
    WITH r AS (
        SELECT person_id
        FROM person_visits
        WHERE visit_date = '2022-01-02'
    ), s AS (
        SELECT person_id
        FROM person_visits
        WHERE visit_date = '2022-01-06'
    )
    (
        SELECT * FROM r
        EXCEPT
        SELECT * FROM s
    ) UNION (
        SELECT * FROM s
        EXCEPT
        SELECT * FROM r
    )
);
