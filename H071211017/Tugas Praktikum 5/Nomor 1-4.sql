use classicmodels;

-- Nomor 1
SELECT c.customerName FROM customers c
JOIN orders o ON c.customerNumber=o.customerNumber
WHERE o.comments LIKE '%credit%exceeded%';

-- Nomor 2
SELECT c.customerName FROM customers c 
JOIN orders o ON c.customerNumber=o.customerNumber
WHERE o.comments LIKE '%DHL%';

-- Nomor 3
SELECT c.customerName, p.productName, o.status, o.shippedDate
FROM customers c JOIN orders o ON c.customerNumber=o.customerNumber
JOIN orderdetails od ON od.orderNumber=o.orderNumber
JOIN products p ON p.productCode=od.productCode
WHERE p.productName LIKE '%Ferrari%' ORDER BY o.shippedDate DESC;

-- Nomor 4
-- Mencari customerNumber Anton Designs, Ltd. pada tabel customers
SELECT customerNumber
FROM customers
WHERE customerName = 'Anton Designs, Ltd.';

-- Memasukkan data pesanan Anton Designs, Ltd. ke tabel orders
INSERT INTO orders (orderNumber, orderDate, requiredDate, shippedDate, `status`, comments, customerNumber)
VALUES (10426, CURRENT_DATE(), ADDDATE(CURRENT_DATE(), INTERVAL 1 YEAR), NULL, 'In Process', NULL, 465);
-- Cek data yang telah dimasukkan
SELECT * FROM orders WHERE orderNumber = 10426;

-- Mencari tahu productCode dan harga retail dari 1934 Ford V8 Coupe pada tabel products
SELECT productCode, buyPrice, MSRP
FROM products
WHERE productName = '1934 Ford V8 Coupe';

-- Memasukkan detail pesanan Anton Designs, Ltd. ke tabel orderdetails
INSERT INTO orderdetails (orderNumber, productCode, quantityOrdered, priceEach, orderLineNumber)
VALUES (10426, 'S18_2957', 50, (62.46+34.45)/2, 1);

-- Cek data yang telah dimasukkan
SELECT * FROM orderdetails WHERE orderNumber = 10426;
