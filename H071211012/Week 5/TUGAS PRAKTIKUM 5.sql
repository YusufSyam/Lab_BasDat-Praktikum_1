USE classicmodels;

-- Nomor 1
SELECT c.customerName, c.creditLimit, o.`status`, o.comments FROM customers AS c
INNER JOIN orders AS o ON c.customerNumber = o.customerNumber
WHERE o.`status` = "ON HOLD" AND o.comments LIKE "%exceed%";

-- Nomor 2
SELECT c.customerName, o.`status`, o.comments FROM customers AS c
INNER JOIN orders AS o ON c.customerNumber = o.customerNumber
WHERE o.comments LIKE "%DHL%";

-- Nomor 3
SELECT c.customerName, p.productName, o.`status`, o.shippedDate FROM products AS p 
INNER JOIN orderdetails AS od ON p.productCode = od.productCode
INNER JOIN orders AS o ON od.orderNumber = o.orderNumber
INNER JOIN customers AS c ON o.customerNumber = c.customerNumber
WHERE p.productName LIKE "%Ferrari%"
ORDER BY o.shippedDate DESC;

-- Nomor 4
SELECT customerNumber FROM customers WHERE customerName LIKE "%Anton%"; -- Cek customerNumber dari customer yang memiliki nama "Anton"

SELECT MAX(orderNumber) FROM orders; -- Cek value akhir kolom `orderNumber` di tabel orders

-- Tambahkan data awal di tabel orders
INSERT INTO orders (orderNumber, `status`, orderDate, requiredDate, customerNumber)
VALUES (10426, "In Process", NOW(), ADDDATE(NOW(), INTERVAL 1 YEAR) , 465);

SELECT productCode FROM products WHERE productName = "1934 Ford V8 Coupe"; -- Cek product Code dari productName yang bernama `1934 Ford V8 Coupe`

-- Menambahkan data tambahan di tabel orderdetails
INSERT INTO orderdetails 
VALUES (10426, "S18_2957", 50, 62.46, 90);

-- Cek apakah semua data sudah masuk
SELECT * FROM customers AS c
INNER JOIN orders AS o ON c.customerNumber = o.customerNumber
INNER JOIN orderdetails AS od ON o.orderNumber = od.orderNumber
INNER JOIN products AS p ON od.productCode = p.productCode
WHERE c.customerName LIKE "%Anton%";