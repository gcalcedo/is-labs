------------
-- TASK 1 --
------------

CREATE TABLE customer (
    custno SERIAL PRIMARY KEY,
    cust_name VARCHAR(50),
    cust_addr VARCHAR(100),
    cust_phone VARCHAR(20)
);

CREATE TABLE supplier (
    supplier_id SERIAL PRIMARY KEY,
    supplier_name VARCHAR(50)
);

CREATE TABLE product (
    product_id SERIAL PRIMARY KEY,
    product_title VARCHAR(50),
    product_code VARCHAR(50)
);

CREATE TABLE supplier_product (
    supplier_id INT NOT NULL,
    product_id INT NOT NULL,
    PRIMARY KEY (supplier_id, product_id),
    FOREIGN KEY (supplier_id) REFERENCES supplier (supplier_id),
    FOREIGN KEY (product_id) REFERENCES product (product_id)
);

CREATE TABLE sales (
    custno INT NOT NULL,
    sale_id INT NOT NULL,
    supplier_id INT NOT NULL,
    product_id INT NOT NULL,
    purchase_date DATE,
    sales_price INT,
    PRIMARY KEY (custno, sale_id),
    FOREIGN KEY (custno) REFERENCES customer (custno),
    FOREIGN KEY (supplier_id) REFERENCES supplier (supplier_id),
    FOREIGN KEY (product_id) REFERENCES product (product_id)
);

-- Sale ID counter
CREATE OR REPLACE FUNCTION set_sale_id_counter() RETURNS TRIGGER
LANGUAGE plpgsql AS
$$
DECLARE sale_count INT;
BEGIN    
    SELECT COUNT(*) + 1
    INTO sale_count
    FROM sales 
    WHERE sales.custno = NEW.custno;

    NEW.sale_id := sale_count;

    RETURN NEW;
END;
$$;

CREATE OR REPLACE TRIGGER sale_id_counter
BEFORE INSERT ON sales
FOR EACH ROW
EXECUTE FUNCTION set_sale_id_counter();