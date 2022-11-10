-- Active: 1667760124683@@127.0.0.1@3306@classicmodels
USE classicmodels;

-- 1
SELECT
    customerName AS `Nama Pelanggan`, -- Menampilkan nama pelanggan
    (SELECT MIN(amount) FROM payments WHERE customerNumber = c.customerNumber) AS `Pembayaran Terkecil`, -- Menampilkan amount terbanyak dari setiap customers
    (SELECT MAX(amount) FROM payments WHERE customerNumber = c.customerNumber) AS `Pembayaran Terbesar` -- Menampilkan amount terkecil dari setiap customers
FROM
    customers c
INNER JOIN payments p ON c.customerNumber = p.customerNumber -- Menghubungkan tabel customers dan payments agar tidak ada nilai null
GROUP BY c.customerName; -- Mengelompokkan berdasarkan kolom customerName

-- 2
-- Mencari officeCode dengan employee terbanyak. 
SELECT officeCode, -- Mencari officeCode
COUNT(e.employeeNumber) `Jumlah Karyawan` -- Menampilkan Jumlah Karyawan dari setiap officeCode 
FROM employees e 
GROUP BY `officeCode` -- Menyatukan tabel berdasarkan officeCode
ORDER BY `Jumlah Karyawan` DESC -- Mengurutkan Berdasarkan jumlah karyawan terbanyak
LIMIT 1; -- Mengambil 1 data dengan urutan teratas, yaitu data officeCode yang memiliki karyawan terbanyak

SELECT 
officeCode,
CONCAT(e.firstName, ' ', e.lastName) AS `Nama Karyawan`, -- Menampilkan Nama Lengkap dari setiap karyawan dengan menggabungan nama depan dan belakangnya
e.jobTitle AS `Jabatan`, -- Menampilkan Jabatan dari setiap karyawan
e.email AS `Email`, -- Menampilkan Email dari setiap karyawan
e.extension AS `Extension`
FROM employees e
WHERE officeCode =
-- -- Memfilter berdasarkan officeCode dengan karyawan terbanyak
(SELECT officeCode -- Mencari officeCode
FROM employees e 
GROUP BY `officeCode` -- Menyatukan tabel berdasarkan officeCode
ORDER BY COUNT(e.employeeNumber) DESC -- Mengurutkan Berdasarkan jumlah karyawan terbanyak
LIMIT 1); -- Mengambil 1 data dengan urutan teratas, yaitu data officeCode yang memiliki karyawan terbanyak

-- 3
SELECT `productName`, `productScale` -- Menampilkan nama produk dan skala produk
FROM products
WHERE `productCode` IN 
-- --Memfilter berdasarkan productCode yang terdapat 'FORD' di namanya
(SELECT `productCode` FROM products WHERE `productName` LIKE '%FORD%');

-- 4
SELECT MAX(amount) FROM payments; -- Mengetahui pembayaran termahal

SELECT 
c.customerName AS `Nama Pelanggan`, -- Menampilkan Nama Pelanggan dari kolom customerName
CONCAT(e.`firstName`, ' ', e.`lastName`) AS `Nama Karyawan`, -- Menampilkan nama karyawan dengan menggabungkan nama depan dan belakang dari karyawan
o.orderNumber AS `Nomor Pesanan`, -- Menampilkan Nomor Pesanan dari kolom orderNumber
p.amount AS `Biaya Pesanan` -- Menampilkan Biaya Pesanan
FROM customers c
INNER JOIN payments p ON c.customerNumber = p.customerNumber
INNER JOIN orders o ON c.customerNumber = o.customerNumber
INNER JOIN employees e ON c.salesRepEmployeeNumber = e.employeeNumber
WHERE p.amount = (SELECT MAX(amount) FROM payments) -- Memfilter hasil dari amount agar menghasilkan amount yang termahal
GROUP BY `Nama Pelanggan`, `Nama Karyawan`; -- Mengelompokkan berdasarkan Nama Pelanggan dan Nama Karyawan bagi pesanan yang jumlah pembayarannya termahal

-- 5
SELECT country AS `Negara`, -- Menampilkan negara
LENGTH(`country`) AS `Panjang Karakter` -- Menampilkan panjang karakter dari negara
FROM customers 
WHERE 
LENGTH(country) = (SELECT MAX(LENGTH(country)) FROM customers) -- Memfilter berdasarkan negara dengan panjang karakter terbanyak
OR 
LENGTH(country) = (SELECT MIN(LENGTH(country)) FROM customers) -- Memfilter berdasarkan negara dengan panjang karakter tersedikit
GROUP BY `Negara`; -- Mengelompokkan berdasarkan Negara