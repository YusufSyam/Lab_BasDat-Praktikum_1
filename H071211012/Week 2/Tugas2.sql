USE classicmodels;

-- Nomor 1
SELECT * FROM offices 
WHERE city="San Francisco";

-- Nomor 2
SELECT * FROM orderdetails 
WHERE quantityOrdered > 70 ORDER BY orderLineNumber DESC;

-- Nomor 3
SELECT DISTINCT productLine FROM products;

-- Nomor 4
SELECT customerNumber AS `Nomor Pelanggan`, customerName AS `Nama Pelanggan` 
FROM customers WHERE customerNumber >= 100 AND customerNumber <= 150;

-- Nomor 5
SELECT * FROM customers 
WHERE city!="USA" AND creditLimit = 0 ORDER BY customerName LIMIT 9, 10;
