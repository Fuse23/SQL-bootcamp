CREATE OR REPLACE FUNCTION fnc_trg_person_update_audit() RETURNS trigger AS $trg_person_update_audit$
    BEGIN
        IF TG_OP = 'UPDATE' THEN
            INSERT INTO person_audit
            SELECT
                current_timestamp,
                'U',
                OLD.id,
                OLD.name,
                OLD.age,
                OLD.gender,
                OLD.address;
        END IF;
        RETURN NULL;
    END;
$trg_person_update_audit$ LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER trg_person_update_audit AFTER UPDATE ON person
    FOR EACH ROW EXECUTE PROCEDURE fnc_trg_person_update_audit();

UPDATE person SET name = 'Bulat' WHERE id = 10;
UPDATE person SET name = 'Damir' WHERE id = 10;
