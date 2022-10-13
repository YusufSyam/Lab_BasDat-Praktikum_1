use classicmodels;

-- nomor 1
SELECT * FROM offices WHERE city = "San Francisco";

-- nomor 2
SELECT * FROM orderdetails WHERE quantityOrdered > 70 ORDER BY orderlinenumber;

-- nomor 3
SELECT DISTINCT productLine FROM products;

-- nomor 4
SELECT customerNumber AS nomorKustomer, customerName AS namaKostumer FROM customers WHERE customerNumber >= 100 AND customerNumber <= 150;

-- nomor 5
SELECT * FROM customers WHERE country != 'USA' AND creditLimit = 0 ORDER BY customerName LIMIT 9,10;

