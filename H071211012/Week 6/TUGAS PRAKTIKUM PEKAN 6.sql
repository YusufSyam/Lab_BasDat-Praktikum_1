USE classicmodels;

-- 1
SELECT 
c.customerName AS `Nama Pelanggan`, 
SUM(p.amount) AS `Total Belanja`, 
c.creditLimit AS `Batas Kredit`,
SUM(p.amount) - c.creditLimit AS `Selisih`
FROM customers AS c
INNER JOIN payments AS p ON c.customerNumber = p.customerNumber
GROUP BY c.customerName
HAVING `Selisih` > 0
ORDER BY `Selisih` DESC;

-- 2
SELECT 
CONCAT(c.customerName, ' : ', c.contactFirstName, c.contactLastName, '@', c.addressLine1) AS `Pelanggan`, 
SUM(od.quantityOrdered) AS `Jumlah Orderan`
FROM customers AS c 
INNER JOIN orders AS o ON c.customerNumber = o.customerNumber
INNER JOIN orderdetails AS od ON o.orderNumber = od.orderNumber
GROUP BY c.customerNumber
ORDER BY `Jumlah Orderan` DESC
LIMIT 1;

-- 3
SELECT
CONCAT(MONTHNAME(p.paymentDate), " ", YEAR(p.paymentDate)) AS `Hari Pembayaran`,
COUNT(p.customerNumber) AS `Jumlah Pelanggan`, 
GROUP_CONCAT(c.customerName ORDER BY c.customerName SEPARATOR ",") AS `List Pelanggan`,
SUM(p.amount) AS `Jumlah Pembayaran`
FROM payments AS p
INNER JOIN customers AS c ON p.customerNumber = c.customerNumber
WHERE MONTH(p.paymentDate) = 2
GROUP BY `Hari Pembayaran`
ORDER BY `Jumlah Pembayaran` DESC;

-- 4
SELECT
UPPER(p.productName) AS `Nama Produk`,
COUNT(od.priceEach) AS `Jumlah di Order`,
GROUP_CONCAT(o.orderDate SEPARATOR ',') AS `Waktu Orderan`,
p.buyPrice AS `Harga Beli`,
od.priceEach AS `Harga Jual`,
SUM(od.quantityOrdered) AS `Total Jumlah Orderan`,
CONCAT(od.priceEach * SUM(od.quantityOrdered), ' - ', p.buyPrice, ' = ', (od.priceEach * SUM(od.quantityOrdered)) - (p.buyPrice* SUM(od.quantityOrdered))) AS `Pendapatan - Modal = Keuntungan`
FROM products AS p 
INNER JOIN orderdetails AS od ON p.productCode = od.productCode
INNER JOIN orders AS o ON od.orderNumber = o.orderNumber
WHERE p.productName LIKE '%FERRARI ENZO%'
GROUP BY od.priceEach
HAVING ((od.priceEach * SUM(od.quantityOrdered)) - (p.buyPrice* SUM(od.quantityOrdered))) > 5000
ORDER BY ((od.priceEach * SUM(od.quantityOrdered)) - (p.buyPrice* SUM(od.quantityOrdered))) DESC;

-- 5
SELECT 
o.addressLine1 AS `Alamat`,
CONCAT(LEFT((o.phone), CHAR_LENGTH(o.phone)-5), '*****') AS `Nomor Telp`,
COUNT(DISTINCT e.employeeNumber) AS `Jumlah Karyawan`,
COUNT(DISTINCT c.customerNumber) AS `Jumlah Pelanggan`,
FORMAT(AVG(p.amount), 2) AS `Rata-Rata Penghasilan`
FROM employees e
INNER JOIN customers c ON e.employeeNumber = c.salesRepEmployeeNumber
INNER JOIN payments p ON c.customerNumber = p.customerNumber
INNER JOIN offices o ON e.officeCode = o.officeCode
GROUP BY `Alamat`
ORDER BY `Nomor Telp`;

