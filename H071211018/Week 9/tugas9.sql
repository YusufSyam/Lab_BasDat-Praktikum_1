USE classicmodels;
SELECT * FROM orders;
SELECT * FROM orderdetails;
SELECT * FROM products;
#no.1
#tambahkan 3 data kedalam tabel orders dan orderdetails setelah itu lakukan perintah commit
SET autocommit = 0;

BEGIN;
INSERT INTO orders (orderNumber, orderDate, requiredDate, shippedDate, `status`, comments, customerNumber)
VALUES (11426, '2022-11-21', '2022-12-01', '2022-11-25', 'Shipped', 'NULL', 363),
       (11427, '2022-11-22', '2022-12-02', '2022-11-27', 'In Process', 'NULL', 128),
       (11428, '2022-11-23', '2022-12-03', '2022-11-29', 'In Process', 'NULL', 181);
COMMIT;

BEGIN;
INSERT INTO orderdetails(orderNumber, productCode, quantityOrdered, priceEach, orderLineNumber)
VALUES (11426, 'S18_1749', 100, '30.0', 3),
       (11427, 'S24_4258', 57, '15.0', 7),
       (11428, 'S10_4962', 86, '80.0', 5);	
COMMIT ;  

#no.2 
#hapus seluruh data dari tabel orderdetails 
#dan gunakan perintah rollback untuk mengembalikan data tsb
BEGIN;
SET autocommit = 0;
SHOW CREATE TABLE products;
ALTER TABLE products DROP CONSTRAINT products_ibfk_1;
SHOW CREATE TABLE orders;
ALTER TABLE orders DROP CONSTRAINT orders_ibfk_1;
DELETE FROM orderdetails;
ROLLBACK;


