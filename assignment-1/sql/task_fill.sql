--------------
-- CUSTOMER --
--------------
INSERT INTO customer(cust_name, cust_addr, cust_phone) VALUES ('John', 'Main Street, 1', '111111111');
INSERT INTO customer(cust_name, cust_addr, cust_phone) VALUES ('Lisa', 'Main Street, 2', '222222222');
INSERT INTO customer(cust_name, cust_addr, cust_phone) VALUES ('Max', 'Main Street, 3', '333333333');
INSERT INTO customer(cust_name, cust_addr, cust_phone) VALUES ('Paul', 'Main Street, 4', '444444444');
INSERT INTO customer(cust_name, cust_addr, cust_phone) VALUES ('Laura', 'Main Street, 5', '555555555');

--------------
-- SUPPLIER --
--------------
INSERT INTO supplier(supplier_name) VALUES ('Groningen Supplies');
INSERT INTO supplier(supplier_name) VALUES ('Leeuwarden Supplies');
INSERT INTO supplier(supplier_name) VALUES ('Zwolle Supplies');

-------------
-- PRODUCT --
-------------
INSERT INTO product(product_title, product_code) VALUES ('Wood', '123');
INSERT INTO product(product_title, product_code) VALUES ('Iron', '234');
INSERT INTO product(product_title, product_code) VALUES ('Stone', '345');
INSERT INTO product(product_title, product_code) VALUES ('Sand', '456');
INSERT INTO product(product_title, product_code) VALUES ('Coal', '567');

------------------------
-- SUPPLIER & PRODUCT --
------------------------
INSERT INTO supplier_product(supplier_id, product_id) VALUES (1, 1);
INSERT INTO supplier_product(supplier_id, product_id) VALUES (1, 3);
INSERT INTO supplier_product(supplier_id, product_id) VALUES (2, 2);
INSERT INTO supplier_product(supplier_id, product_id) VALUES (2, 5);
INSERT INTO supplier_product(supplier_id, product_id) VALUES (3, 4);
INSERT INTO supplier_product(supplier_id, product_id) VALUES (3, 2);

-----------
-- SALES --
-----------
INSERT INTO sales(custno, sale_id, supplier_id, product_id, purchase_date, sales_price) 
VALUES (1, 0, 1, 1, '2022-10-2', 300);
INSERT INTO sales(custno, sale_id, supplier_id, product_id, purchase_date, sales_price)
VALUES (2, 0, 1, 3, '2022-10-4', 200);
INSERT INTO sales(custno, sale_id, supplier_id, product_id, purchase_date, sales_price)
VALUES (3, 0, 2, 2, '2022-10-5', 100);
INSERT INTO sales(custno, sale_id, supplier_id, product_id, purchase_date, sales_price)
VALUES (4, 0, 3, 4, '2022-10-7', 500);
INSERT INTO sales(custno, sale_id, supplier_id, product_id, purchase_date, sales_price)
VALUES (5, 0, 3, 2, '2022-10-9', 700);
INSERT INTO sales(custno, sale_id, supplier_id, product_id, purchase_date, sales_price)
VALUES (1, 0, 1, 1, '2022-10-10', 300);
INSERT INTO sales(custno, sale_id, supplier_id, product_id, purchase_date, sales_price)
VALUES (1, 0, 1, 1, '2022-10-11', 300);
INSERT INTO sales(custno, sale_id, supplier_id, product_id, purchase_date, sales_price)
VALUES (1, 0, 1, 1, '2022-10-12', 300);
INSERT INTO sales(custno, sale_id, supplier_id, product_id, purchase_date, sales_price)
VALUES (1, 0, 1, 1, '2022-10-13', 300);
INSERT INTO sales(custno, sale_id, supplier_id, product_id, purchase_date, sales_price)
VALUES (1, 0, 1, 1, '2022-10-14', 300);
INSERT INTO sales(custno, sale_id, supplier_id, product_id, purchase_date, sales_price)
VALUES (1, 0, 1, 1, '2022-10-14', 300);