WITH cte_last_rate AS (
    SELECT
        id,
        name AS currency_name,
        (
            SELECT rate_to_usd
            FROM currency
            WHERE currency.updated IN (
                SELECT MAX(currency.updated)
                FROM currency
            ) AND balance.currency_id = id
        ) AS last_rate
    FROM currency
    JOIN balance ON id = currency_id
    GROUP BY id, currency_name, currency_id
)
SELECT
    COALESCE(public.user.name, 'not defined') AS name,
    COALESCE(lastname, 'not defined') AS lastname,
    type,
    SUM(money) AS volume,
    COALESCE(cte_last_rate.currency_name, 'not defined') AS currency_name,
    COALESCE(cte_last_rate.last_rate, 1) AS last_rate_to_usd,
    CAST(SUM(COALESCE(money, 1) * COALESCE(last_rate, 1)) AS REAL) AS total_volume_in_usd
FROM public.user
FULL JOIN balance ON public.user.id = balance.user_id
LEFT JOIN cte_last_rate ON currency_id = cte_last_rate.id
GROUP BY type, public.user.id, name, lastname, currency_name, last_rate
ORDER BY name DESC, lastname, type;
