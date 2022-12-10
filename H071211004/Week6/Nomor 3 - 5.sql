-- Nomor 3
/*
SELECT CONCAT('February ', YEAR(p.paymentDate)) 'Hari Pembayaran',
GROUP_CONCAT(DISTINCT c.customerName SEPARATOR ',') 'List Pelanggan',
SUM(p.amount) 'Jumlah Pembayaran'
FROM payments p
INNER JOIN customers c
ON p.customerNumber = c.customerNumber
WHERE MONTH(p.paymentDate) = 02
GROUP BY YEAR(p.paymentDate)
ORDER BY SUM(p.amount) DESC;

-- Nomor 4

SELECT productName 'Nama Product',
COUNT(o.orderDate) 'Jumlah di Order',
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
COUNT(c.customerNumber) 'Jumlah Pelanggan'
FROM offices office
INNER JOIN employees em
ON em.officeCode = office.officeCode
INNER JOIN customers c
ON c.salesRepEmployeeNumber = em.employeeNumber
GROUP BY office.officeCode
;
*/
