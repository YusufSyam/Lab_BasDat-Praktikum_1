use classicmodels;

-- 1. Menggunakan database classicmodels tampilkan nama pelanggan yang total
-- 	  belanjanya melebihi kredit limit, serta tampilkan selisih total belanja dengan kredit
-- 	  limit, kemudian urutkan berdasarkan selisih tersebut secara menurun

SELECT customers.customerName AS 'Nama Pelanggan', 
SUM(amount) AS 'Total Belanja', customers.creditLimit AS 'Batas Kredit', (SUM(amount)-creditLimit) AS 'Selisih'
FROM customers
INNER JOIN payments
ON customers.customerNumber = payments.customerNumber
GROUP BY customerName
HAVING SUM(amount) > customers.creditLimit ORDER BY (SUM(amount)-creditLimit)  DESC LIMIT 5;

-- 2. Siapa customer yang total pembelian barangnya terbanyak (dihitung dari quantity
-- bukan price)

-- SELECT CONCAT(customerName, " ",':'," ", contactFirstName, " ",contactLastName, " ", addressLine1) as pelanggan, MAX(quantityordered) as jumlah_orderan
-- FROM customers AS c
-- JOIN orders AS o
-- ON c.customerNumber = o.customerNumber
-- JOIN orderdetails AS od
-- ON o.orderNumber = od.orderNumber
-- WHERE od.quantityOrdered = 97;

SELECT CONCAT(c.customerName, ' : ', c.contactFirstName, ' ', c.contactLastName, '@', c.addressLine1) AS Pelanggan, sum(od.quantityOrdered) AS 'Jumlah Orderan'
FROM customers AS c
INNER JOIN orders AS o
ON c.customerNumber = o.customerNumber
INNER JOIN orderdetails AS od
ON o.orderNumber = od.orderNumber
GROUP BY c.customerName
HAVING SUM(od.quantityOrdered) ORDER BY SUM(od.quantityOrdered) DESC LIMIT 1;

-- 3.Tampilkan jumlah dan list pelanggan, serta jumlah pembayaran untuk pembayaran
-- yang dilakukan pada bulan februari setiap tahunnya.

SELECT CONCAT((MONTHNAME(paymentDate)), " ",YEAR(paymentDate)) AS 'hari pembayaran', COUNT(customers.customerName) AS 'jumlah pelanggan', 
GROUP_CONCAT(customerName ORDER BY customerName ASC) AS 'list pelanggan', SUM(payments.amount) AS 'jumlah pembayaran'
FROM customers
INNER JOIN payments 
ON customers.customerNumber = payments.customerNumber
WHERE MONTH(paymentdate) = 2
GROUP BY YEAR(paymentDate) ORDER BY SUM(payments.amount) DESC;

-- 4. Tampilkan informasi jumlah orderan serta keuntungan untuk penjualan 2001 Ferrari
-- Enzo yang keuntungannya lebih besar dari 5000.
-- Berikut ketentuan outputnya:
-- a. Nama Produk dalam huruf kapital
-- b. Jumlah di Order
-- c. Waktu Orderan dipisah dengan Comma
-- d. Harga Beli
-- e. Harga Jual
-- f. Total Kuantitas Orderan
-- g. Serta Keuntungan bersih yang diperoleh

SELECT UPPER(p.productName) AS 'nama produk' , COUNT(o.customerNumber) AS 'jumlah diorder', 
GROUP_CONCAT(orderDate) AS 'waktu orderan', p.buyPrice AS 'harga beli', od.priceEach AS 'harga jual', 
CONCAT((SUM(od.quantityOrdered *od.priceEach)), "-", SUM(od.quantityOrdered * p.buyprice), "=", (SUM(od.quantityOrdered * od.priceEach)) - SUM(od.quantityOrdered * p.buyprice))
AS "pendapatan - modal = keuntungan"
FROM products AS p
INNER JOIN orderdetails AS od
ON p.productCode = od.productCode
INNER JOIN orders AS o
ON od.orderNumber = o.orderNumber
WHERE p.productName =  '2001 Ferrari Enzo'
GROUP BY priceEach
HAVING (SUM(od.quantityOrdered * od.priceEach)) - SUM(od.quantityOrdered * p.buyprice) > 5000 
ORDER BY (SUM(od.quantityOrdered * od.priceEach)) - SUM(od.quantityOrdered * p.buyprice) DESC;

-- 5. Tampilkan alamat pertama dari tiap kantor, no telp yang 5 angka terakhirnya
-- disamarkan, jumlah karyawan, jumlah pelanggan yang pernah dilayani, serta
-- rata-rata penghasilan.

SELECT o.addressLine1 AS 'Alamat', concat(LEFT(o.phone, LENGTH(o.phone)-6), '* ****'),
COUNT(DISTINCT e.employeeNumber) AS 'jumlah karyawan' , COUNT(DISTINCT c.customerName), ROUND(AVG(amount), 2)
from offices AS o
INNER JOIN employees AS e
ON e.officeCode = o.officeCode
INNER JOIN customers AS c
ON c.salesRepEmployeeNumber = e.employeeNumber
INNER JOIN payments AS p
ON c.customerNumber = p.customerNumber
GROUP BY o.officeCode