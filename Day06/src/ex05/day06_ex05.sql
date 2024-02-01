COMMENT ON TABLE person_discounts IS 'Information about personal discount';
COMMENT ON COLUMN person_discounts.id IS 'Unique id for each table entry';
COMMENT ON COLUMN person_discounts.person_id IS 'Unique id of a person from order list';
COMMENT ON COLUMN person_discounts.pizzeria_id IS 'Unique id of a pizzeria where the person made an order';
COMMENT ON COLUMN person_discounts.discount IS 'Personal discount calculattd by the number of orders';
