SELECT
	(SELECT name FROM person WHERE person_order.person_id = id) AS NAME
FROM person_order
WHERE menu_id IN (13, 14, 18) AND order_date = '2022-01-07';
