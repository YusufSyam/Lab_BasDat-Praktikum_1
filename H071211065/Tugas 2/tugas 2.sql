-- USE classicmodels;

-- soal 1
-- SELECT * FROM offices WHERE city="San Francisco";

-- soal 2
-- SELECT * FROM orderDetails WHERE quantityOrdered > 70 ORDER BY orderLineNumber ASC;

-- soal 3
-- SELECT DISTINCT productLine FROM products;

-- soal 4 
-- SELECT customerNumber 'nomor kustomer', customerName 'nama kustomer' FROM customers 
-- WHERE customerNumber BETWEEN 100 AND 150 

-- soal 5
-- SELECT * FROM customers WHERE country!='USA' AND creditLimit='0' ORDER BY customerName ASC LIMIT 9, 10;