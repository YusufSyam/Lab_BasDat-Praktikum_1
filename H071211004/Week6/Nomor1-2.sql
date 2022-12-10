-- Nomor 1 (Before Edited)

SELECT COUNT(b.nama)
FROM (SELECT c.customerName AS nama, SUM(od.quantityOrdered * od.priceEach) AS total_harga_belanja, c.creditLimit
FROM customers c 
INNER JOIN orders o 
ON o.customerNumber = c.customerNumber
INNER JOIN orderdetails od
ON o.orderNumber = od.orderNumber
GROUP BY c.customerName, c.creditLimit
HAVING SUM(od.quantityOrdered * od.priceEach) > c.creditLimit) AS b;

-- Nomor 1 (After Edited)

SELECT c.customerName AS nama_pelanggan, 
SUM(od.quantityOrdered * od.priceEach) AS total_harga_belanja, 
c.creditLimit AS batas_credit,
(SUM(od.quantityOrdered * od.priceEach) - c.creditLimit) AS selisih
FROM customers c 
INNER JOIN orders o 
ON o.customerNumber = c.customerNumber
INNER JOIN orderdetails od
ON o.orderNumber = od.orderNumber
GROUP BY c.customerName, c.creditLimit
HAVING SUM(od.quantityOrdered * od.priceEach) > c.creditLimit
ORDER BY selisih DESC;

-- Nomor 2

SELECT CONCAT(c.customerName, ' : ', c.contactFirstName, ' ', c.contactLastName, '@', c.addressLine1) AS nama_pelanggan,
SUM(od.quantityOrdered) AS jumlah_orderan
FROM orderdetails od
INNER JOIN orders o
ON o.orderNumber = od.orderNumber
INNER JOIN customers c
ON c.customerNumber = o.customerNumber
GROUP BY nama_pelanggan
ORDER BY jumlah_orderan DESC LIMIT 1;

-- Nomor 3

SELECT CONCAT(MONTHNAME(p.paymentDate), ' ', YEAR(p.paymentDate)) 'Hari Pembayaran',
GROUP_CONCAT(DISTINCT c.customerName SEPARATOR ',') 'List Pelanggan',
SUM(p.amount) 'Jumlah Pembayaran'
FROM payments p
INNER JOIN customers c
ON p.customerNumber = c.customerNumber
WHERE MONTH(p.paymentDate) = 02
GROUP BY YEAR(p.paymentDate)
ORDER BY SUM(p.amount) DESC;

-- Nomor 4

SELECT UPPER(productName) 'Nama Product',
COUNT(o.orderNumber) 'Jumlah di Order',
GROUP_CONCAT(DISTINCT o.orderDate SEPARATOR ',') 'Waktu Orderan',
buyPrice 'Harga Beli',
od.priceEach 'Harga Jual',
SUM(od.quantityOrdered) 'Total Jumlah Orderan',
CONCAT((priceEach * SUM(od.quantityOrdered)), ' - ', (buyPrice * SUM(od.quantityOrdered)), ' = ', (priceEach * SUM(od.quantityOrdered)) - (buyPrice * SUM(od.quantityOrdered))) 'Pendapatan - Modal = Keuntungan' 
FROM products AS pr
INNER JOIN orderdetails od
ON pr.productCode = od.productCode
INNER JOIN orders o
ON o.orderNumber = od.orderNumber
WHERE productName = '2001 Ferrari Enzo'
GROUP BY priceEach
ORDER BY (priceEach * SUM(od.quantityOrdered)) - (buyPrice * SUM(od.quantityOrdered)) DESC;

-- Nomor 5

SELECT office.addressLine1 'Alamat',
REPLACE(office.phone, RIGHT(office.phone, 6), '* ****') 'No Telp',
COUNT(DISTINCT em.employeeNumber) 'Jumlah Karyawan',
COUNT(c.customerNumber) 'Jumlah Pelanggan',
ROUND(AVG(p.amount), 2) 'Rata-Rata Penghasilan'
FROM offices office
INNER JOIN employees em
ON em.officeCode = office.officeCode
INNER JOIN customers c
ON c.salesRepEmployeeNumber = em.employeeNumber
INNER JOIN payments p
ON p.customerNumber = c.customerNumber
GROUP BY office.officeCode
ORDER BY office.phone ASC;


