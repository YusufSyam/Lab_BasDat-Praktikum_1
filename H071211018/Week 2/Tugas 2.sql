USE classicmodels;

#nomor 1
SELECT * FROM offices WHERE city='San Francisco';

#nomor 2
SELECT * FROM orderdetails WHERE quantityOrdered > 70 ORDER BY orderLineNumber ASC;

#nomor 3
SELECT DISTINCT productLine FROM products;

#nomor 4
SELECT customerNumber AS nomorPelanggan, customerName AS namaPelanggan FROM customers WHERE customerNumber > 100 and customerNumber < 150 ;

#nomor 5
SELECT * FROM customers WHERE country != 'USA' and creditLimit = 0 ORDER BY customerName ASC LIMIT 9,10;
