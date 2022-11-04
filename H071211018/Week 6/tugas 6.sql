SELECT * FROM payments;
SELECT * FROM customers;
SELECT * FROM orders;
SELECT * FROM orderdetails;
SELECT * FROM offices;
SELECT * FROM employees;
SELECT * FROM products;

#NO. 1
#tampilkan nama pelanggan yang belanjanya melebihi kredit limit, dan selisih total belanja dengan kredit limit
#kemudian urutkan berdasarkan selisih tsb secara menurun
SELECT customers.customerName AS 'Nama Pelanggan', SUM(amount) AS 'Total Belanja', customers.creditLimit AS 'Batas Kredit', (SUM(amount)-creditLimit) AS 'Selisih'
FROM customers
INNER JOIN payments
ON customers.customerNumber = payments.customerNumber
GROUP BY customerName
HAVING SUM(amount) > customers.creditLimit ORDER BY (SUM(amount)-creditLimit)  DESC LIMIT 5;

#NO. 2
#siapa customer yg total pembelian barangnya terbanyak(dihitung dari quantity)
SELECT CONCAT(c.customerName, ' : ', c.contactFirstName, ' ', c.contactLastName, '@', c.addressLine1) AS 'Pelanggan', SUM(od.quantityOrdered) AS 'Jumlah Orderan'
FROM customers AS c
INNER JOIN orders AS o
ON c.customerNumber = o.customerNumber
INNER JOIN orderdetails AS od
ON o.orderNumber = od.orderNumber
GROUP BY c.customerName
ORDER BY SUM(od.quantityOrdered) DESC LIMIT 1;

#NO. 3
#tampilkan jumlah dan list pelanggan, dan jumlah pembayaran
#untuk pembayaran yg dilakukan pada bulan februari setiap tahunnya
SELECT CONCAT((MONTHNAME(paymentDate)), " ", YEAR(paymentDate)) AS 'Hari Pembayaran', COUNT(c.customerName) AS 'Jumlah Pelanggan', 
GROUP_CONCAT(customerName ORDER BY customerName ASC) AS 'List Pelanggan', SUM(p.amount) AS 'Jumlah Pembayaran'
FROM customers AS c
INNER JOIN payments AS p
ON c.customerNumber = p.customerNumber
WHERE MONTH(paymentDate) = 02
GROUP BY YEAR(paymentDate) 
ORDER BY SUM(p.amount) DESC;

#NO.4
#tampilkan informasi jumlah orderan serta keuntungan untuk penjualan 2001 ferrari Enzo 
#yang keuntungannya lebih besar dari 5000
SELECT UPPER(p.productName) AS 'Nama Produk', COUNT(o.customerNumber) AS 'Jumlah di Order',
GROUP_CONCAT(orderDate) AS 'Waktu Orderan', p.buyPrice AS 'Harga Beli', od.priceEach AS 'Harga Jual',
SUM(od.quantityOrdered) AS 'Total Jumlah Orderan' , 
CONCAT((SUM(od.quantityOrdered * od.priceEach)), "-", SUM(od.quantityOrdered * p.buyPrice), "=",
(SUM(od.quantityOrdered * od.priceEach)) - SUM(od.quantityOrdered * p.buyPrice)) AS 'Pendapatan-Modal = Keuntungan'
FROM products AS p
INNER JOIN orderdetails AS od
ON p.productCode = od.productCode
INNER JOIN orders AS o
ON od.orderNumber = o.orderNumber
WHERE p.productName = '2001 Ferrari Enzo'
GROUP BY priceEach
HAVING (SUM(od.quantityOrdered * od.priceEach)) - SUM(od.quantityOrdered * p.buyPrice) > 5000
ORDER BY (SUM(od.quantityOrdered * od.priceEach)) - SUM(od.quantityOrdered * p.buyPrice) DESC;

#NO.5
#tampilkan alamat pertama dari tiap kantor, no.telp yang 5 angka terakhirnya disamarkan,
#jumlah karayawan, jumlah pelanggan yang pernah dilayani, rata" penghasilan
SELECT o.addressLine1 AS 'Alamat', CONCAT(LEFT(o.phone, LENGTH(o.phone)-6), '* ****') AS 'Nomor Telp', 
COUNT(DISTINCT e.employeeNumber) AS 'Jumlah Karyawan', COUNT(DISTINCT c.customerName) AS 'Jumlah Pelanggan',
ROUND(AVG(amount), 2) AS 'Rata-rata Penghasilan'
FROM offices AS o
LEFT JOIN employees AS e
ON o.officeCode = e.officeCode
LEFT JOIN customers AS c
ON e.employeeNumber = c.salesRepEmployeeNumber
LEFT JOIN payments AS p
ON c.customerNumber = p.customerNumber
GROUP BY o.officeCode
ORDER BY CONCAT(LEFT(o.phone, LENGTH(o.phone)-6), '* ****') ASC;










