CREATE OR REPLACE FUNCTION func_minimum(VARIADIC arr NUMERIC[]) RETURNS NUMERIC AS $$
    BEGIN
        RETURN (SELECT MIN(item) FROM unnest(arr) item);
    END;
$$ LANGUAGE plpgsql;

SELECT func_minimum(VARIADIC arr => ARRAY[10.0, -1.0, 5.0, 4.4]);
SELECT func_minimum(VARIADIC arr => ARRAY[10.0, 11, 5.0, 4.4]);
