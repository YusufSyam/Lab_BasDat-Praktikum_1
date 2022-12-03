USE classicmodels;
-- 1
SELECT * FROM customers;
-- Siapa saja costumers yang status pesanannya tertahan karena melebihi batas kredit?

SELECT c.customerName, c.creditLimit, o.`status`, o.comments
FROM customers AS c
JOIN orders AS o
ON c.customerNumber = o.customerNumber
WHERE o.`status` = 'On Hold' AND  comments LIKE '%credit limit%';

-- SELECT * FROM orders WHERE comments LIKE '%credit limit%';

-- SELECT o.orderNumber, o.`status`,  o.shippedDate, c.quantityOrdered, c.orderNumber
-- FROM orders AS o
-- JOIN orderdetails AS c
-- ON o.orderNumber = c.orderNumber
-- WHERE o.`status` = 'Cancelled' AND o.shippedDate = '2003-11-13';




--  2
-- Siapa saja costumers yang berkomentar untuk menggunakan jasa pengantaran DHL? Tampilkan nama mereka, status order mereka, serta
-- komentar yang dimaksud
SELECT * FROM products;

SELECT c.customerName, o.`status`, o.comments
FROM customers AS c
JOIN orders AS o
ON c.customerNumber = o.customerNumber
WHERE o.comments LIKE '%dhl%';

-- 3
-- Tampilkam semua order mobil bermerk "Ferrari" pada database classicmodels! Tampilkan pula nama customer, nama mobilnya
-- status order, serta tanggal pengiriman yang berurut dan terkini
SELECT * FROM customers;
SELECT * FROM payments;
SELECT * FROM products;
SELECT * FROM orders;
SELECT * FROM orderdetails;

SELECT customers.customerName, products.productName , orders.status, orders.shippedDate FROM customers
INNER JOIN orders
ON  customers.customerNumber = orders.customerNumber
INNER JOIN orderdetails
ON orders.orderNumber = orderdetails.orderNumber
INNER JOIN products
ON orderdetails.productCode = products.productCode
WHERE  products.productName LIKE '%Ferrari%' ORDER BY orders.shippedDate DESC;


-- 4
-- Anton Designs Ltd memesan sebanyak 50 mobil "1934 Ford V8 Coupe" Masukkan data pemesanan ke database, dengan
-- ketentuan tambahan

-- status order = in process
-- tanggal order = gunakan fungsi untuk mendapatkan tanggal sekarang
-- deadline pengiriman = satu tahun dari sekarang
-- mobil akan dijual kembali dengan harga yang sama dengan harga eceran resmi/harga retail

INSERT INTO orders(orderNumber,status,orderDate,requiredDate,customerNumber)
VALUES ('20000','In Process',current_date(),current_date() + INTERVAL 1 YEAR,'465');

SELECT * FROM orders WHERE customerNumber = "465";

-- memasukkan data baru pada table orderdetails
SELECT * FROM products WHERE productName LIKE "%v8 coupe%";

-- SELECT * FROM orderdetails WHERE productCode LIKE '%s18_2957%';

INSERT INTO orderdetails
VALUES ('20000','S18_2957','50','62.46','40');

SELECT * FROM orderdetails WHERE orderNumber = "20000" ;

-- HASILNYA
SELECT customers.customerNumber, customers.customerName, orders.status, orders.orderDate,orders.requiredDate,orderdetails.quantityOrdered,orderdetails.priceEach,products.MSRP,products.productName FROM customers
INNER JOIN orders
ON  customers.customerNumber = orders.customerNumber
INNER JOIN orderdetails
ON orders.orderNumber = orderdetails.orderNumber
INNER JOIN products
ON orderdetails.productCode = products.productCode
WHERE  customers.customerNumber = '465';