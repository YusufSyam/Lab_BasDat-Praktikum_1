USE classicmodels;

#No.1 
#Siapa saja customer yang status pemesananya tertahan karena memilebihi batas kredit?
SELECT c.customerName, o.status, o.comments
FROM customers as c
INNER JOIN orders as o
ON c.customerNumber = o.customerNumber
WHERE status = 'on hold' AND o.comments LIKE '%credit limit exceed%' ;

#No.2
#Siapa saja customrs yang berkomentar untuk menggunakan jasa pengantaran DHL? tampilkan nama mereka, satus order mereka serta komentar yang di maksud.
SELECT c.customerName, o.status, o.comments
FROM customers AS c
INNER JOIN orders AS o
ON c.customerNumber = o.customerNumber
WHERE comments LIKE '%dhl%' ;

#No.3 
#Tampilkan semua order mobil bermerek ferarri pada database classicmodels! tampilkan pula nama customers, nama mobilnya, status order, serta tanggal pengiriman yang berturut terkini
SELECT c.customerName, p.productName, o.status, o.shippedDate
FROM customers AS c
INNER JOIN orders AS o
ON c.customerNumber = o.customerNumber
INNER JOIN orderdetails AS od
ON o.orderNumber = od.orderNumber
INNER JOIN products AS p
ON od.productCode = p.productCode
WHERE productName LIKE '%ferrari%'
ORDER BY shippedDate DESC ;

#NO. 4 
#Anton Designs, Ltd. memesan sebanyak 50 mobil “1934 Ford V8 Coupe”. Masukkan
#data pemesanan ke database, dengan ketentuan tambahan:
#a. Status order = In Process
#b. Tanggal order = gunakan fungsi untuk mendapatkan tanggal sekarang
#c. Deadline pengiriman = satu tahun dari sekarang
#d. Mobil akan dijual kembali dengan harga yang sama dengan harga eceran resmi/Harga retail.

INSERT INTO orders (orderNumber, orderDate, requiredDate, shippedDate, status, comments, customerNumber)
VALUES (10427, current_timestamp(),  DATE_ADD(NOW(), INTERVAL 1 YEAR), NULL, 'In Process', NULL, 465);

INSERT INTO orderdetails (orderNumber, productCode, quantityOrdered, priceEach, orderLineNumber)
VALUES (10426, 'S18_2957', 50, p.MSRP, 1);
SELECT  10426, 'S18_2957', 50, p.MSRP, 1
FROM orderdetails AS od
INNER JOIN products AS p
ON od.productCode = p.productCode
WHERE p.productCode = 'S18_2957' LIMIT 1;