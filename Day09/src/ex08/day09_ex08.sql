CREATE OR REPLACE FUNCTION fnc_fibonacci(pstop INTEGER DEFAULT 10) RETURNS TABLE (
    num INTEGER
) AS $$
    WITH RECURSIVE cte_fibonacci(num1, num2) AS (
        SELECT
            0 AS num1,
            1 AS num2
        UNION ALL
        SELECT
            num2 AS num1,
            num1 + num2 AS num2
        FROM cte_fibonacci
        WHERE num2 < pstop
    )
    SELECT num1
    FROM cte_fibonacci;
$$ LANGUAGE SQL;

SELECT * from fnc_fibonacci(100);
SELECT * from fnc_fibonacci();
