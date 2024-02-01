SELECT
    address,
    CAST(ROUND(MAX(age::numeric) - (MIN(age::numeric) / MAX(age::numeric)), 2) AS REAL) AS formula,
    CAST(ROUND(AVG(age::numeric), 2) AS REAL) AS average,
    (MAX(age::numeric) - (MIN(age::numeric) / MAX(age::numeric))) > AVG(age::numeric) AS comparison
FROM person
GROUP BY address
ORDER BY address;
