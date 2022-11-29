------------
-- TASK 3 --
------------

CREATE OR REPLACE FUNCTION check_sales_price_not_negative() RETURNS TRIGGER
LANGUAGE plpgsql AS
$$
BEGIN
    IF (NEW.sales_price < 0) THEN
        RAISE EXCEPTION 'Sales price cannot be negative';
    END IF;
    RETURN NEW;
END;
$$;

CREATE OR REPLACE TRIGGER sales_price_not_negative
BEFORE INSERT OR UPDATE ON sales
FOR EACH ROW
EXECUTE FUNCTION check_sales_price_not_negative();