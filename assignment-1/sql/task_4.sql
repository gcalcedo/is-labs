------------
-- TASK 4 --
------------

CREATE OR REPLACE FUNCTION set_discount_fifth_sale() RETURNS TRIGGER
LANGUAGE plpgsql AS
$$
DECLARE sale_count INT;
BEGIN
    SELECT COUNT(*) + 1
    INTO sale_count
    FROM sales 
    WHERE sales.custno = NEW.custno;

    NEW.sale_id := sale_count;

    IF (MOD(NEW.sale_id, 5) = 0) THEN
        NEW.sales_price := NEW.sales_price * 0.9;
    END IF;
    RETURN NEW;
END;
$$;

CREATE OR REPLACE TRIGGER discount_fifth_sale
BEFORE INSERT ON sales
FOR EACH ROW
EXECUTE FUNCTION set_discount_fifth_sale();