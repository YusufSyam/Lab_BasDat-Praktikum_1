-- Active: 1667760124683@@127.0.0.1@3306@classicmodels
-- Nomor 1
SET autocommit = 0;
START TRANSACTION;
INSERT INTO orders (orderNumber, orderDate, requiredDate, shippedDate, `status`, customerNumber) 
VALUES
((SELECT MAX(`orderNumber`)+1 FROM orders `o1`) , '2003-01-06', '2003-01-13', '2003-01-10', 'Shipped', 125),
((SELECT MAX(`orderNumber`)+2 FROM orders `o1`), '2004-02-03', '2004-03-23', '2003-02-11', 'Shipped', 124),
((SELECT MAX(`orderNumber`)+3 FROM orders `o1`), '2005-02-04', '2002-02-21', '2002-06-07', 'Shipped', 121);

INSERT INTO orderdetails (orderNumber, productCode, quantityOrdered, priceEach, orderLineNumber)
VALUES 
((SELECT MAX(orderNumber) + 1 FROM orderdetails `od1`), 'S18_1749', 40, 130.00, 2),
((SELECT MAX(orderNumber) + 2 FROM orderdetails `od1`), 'S24_3969', 44, 18.90, 4),
((SELECT MAX(orderNumber) + 3 FROM orderdetails `od1`), 'S18_4409', 20, 62.80, 1)
;

-- Commit Perubahan
COMMIT;

-- Cek apakah data tadi sudah di masuk atau tidak
SELECT * FROM orders ORDER BY orderNumber DESC LIMIT 3;
SELECT * FROM orderdetails ORDER BY `orderLineNumber` DESC LIMIT 3;


-- Nomor 2
START TRANSACTION;
DELETE FROM orderdetails;
SELECT * FROM orderdetails;
ROLLBACK;