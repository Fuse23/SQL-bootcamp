CREATE OR REPLACE FUNCTION fnc_person_visits_and_eats_on_date(
    IN pperson VARCHAR DEFAULT 'Dmitriy',
    IN pprice INTEGER DEFAULT 500,
    IN pdate DATE DEFAULT '2022-01-08'
) RETURNS TABLE (
    name VARCHAR
) AS $$
    BEGIN
        RETURN QUERY
            SELECT pizzeria.name
            FROM pizzeria
            JOIN person_visits ON person_visits.pizzeria_id = pizzeria.id
            JOIN person ON person_id = person.id
            JOIN menu ON menu.pizzeria_id = pizzeria.id
            WHERE person.name = pperson AND visit_date = pdate AND price < pprice;
    END;
$$ LANGUAGE plpgsql;

SELECT *
FROM fnc_person_visits_and_eats_on_date(pprice := 800);

SELECT *
FROM fnc_person_visits_and_eats_on_date(pperson := 'Anna', pprice := 1300, pdate := '2022-01-01');
