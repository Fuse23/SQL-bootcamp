SELECT 
    CASE WHEN u.name IS NULL
        THEN 'not defined'
        ELSE u.name
    END AS name, 
    CASE WHEN u.lastname IS NULL
        THEN 'not defined'
        ELSE u.lastname
    END AS lastname, 
    (SELECT DISTINCT name FROM currency WHERE id = b.currency_id) AS currency_name,
    (money * rate_to_usd)::float AS currency_in_usd
FROM (
    SELECT *,
        CASE 
            WHEN EXISTS (SELECT rate_to_usd FROM currency WHERE id = b.currency_id AND updated < b.updated ORDER BY updated DESC LIMIT 1)
                THEN (SELECT rate_to_usd FROM currency WHERE id = b.currency_id AND updated < b.updated ORDER BY updated DESC LIMIT 1)
            ELSE (SELECT rate_to_usd FROM currency WHERE id = b.currency_id AND updated > b.updated ORDER BY updated LIMIT 1)
        END AS rate_to_usd
    FROM balance b
) b
    LEFT JOIN "user" u ON u.id = b.user_id
WHERE EXISTS (SELECT * FROM currency WHERE id = b.currency_id)
ORDER BY name DESC, lastname, currency_name