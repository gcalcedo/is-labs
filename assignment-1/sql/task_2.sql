------------
-- TASK 2 --
------------

-- Customer
CREATE OR REPLACE FUNCTION set_cust_name_uppercase() RETURNS TRIGGER
LANGUAGE plpgsql AS
$$
BEGIN
    NEW.cust_name := UPPER(NEW.cust_name);
    RETURN NEW;
END;
$$;

CREATE OR REPLACE TRIGGER cust_name_uppercase
BEFORE INSERT OR UPDATE ON customer
FOR EACH ROW
EXECUTE FUNCTION set_cust_name_uppercase();

-- Supplier
CREATE OR REPLACE FUNCTION set_supplier_name_uppercase() RETURNS TRIGGER
LANGUAGE plpgsql AS
$$
BEGIN
    NEW.supplier_name := UPPER(NEW.supplier_name);
    RETURN NEW;
END;
$$;

CREATE OR REPLACE TRIGGER supplier_name_uppercase
BEFORE INSERT OR UPDATE ON supplier
FOR EACH ROW
EXECUTE FUNCTION set_supplier_name_uppercase();