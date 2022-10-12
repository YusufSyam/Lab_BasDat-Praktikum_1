USE classicmodels;

-- Nomor 1
SELECT * FROM offices WHERE city='San Francisco';

--  Nomor 2
SELECT * FROM orderdetails WHERE quantityOrdered>70 ORDER BY orderLineNumber ASC;

-- Nomor 3
SELECT DISTINCT productLine FROM products;

-- Nomor 4
SELECT customerNumber 'No. Pelanggan', CustomerName 'Nama Pelanggan' FROM customers WHERE customerNumber BETWEEN 100 AND 150;

-- Nomor 5
SELECT * FROM customers WHERE (creditLimit=0 AND country!='USA') ORDER BY customerName ASC LIMIT 9,10;