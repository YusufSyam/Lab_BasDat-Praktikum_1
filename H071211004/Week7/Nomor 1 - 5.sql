-- Nomor 1 (Tanpa Subquery)
/*
SELECT c.customerName, MIN(p.amount), MAX(p.amount) 
FROM customers c
INNER JOIN payments p
ON c.customerNumber = p.customerNumber
GROUP BY c.customerNumber
ORDER BY c.customerName;

-- Nomor 1 (Dengan Subquery)

SELECT test.Nama, MIN(Banyak), MAX(Banyak) FROM 
(SELECT c.customerName 'Nama', p.amount 'Banyak'
FROM customers c
INNER JOIN payments p
ON c.customerNumber = p.customerNumber
) AS test
GROUP BY Nama;


-- Nomor 2

SELECT * FROM employees WHERE officeCode = 
(SELECT officeCode FROM (SELECT o.officeCode 'officeCode', o.city 'kota', COUNT(em.employeeNumber) 'banyak', CONCAT(em.firstName, ' ', em.lastName) 'nama' FROM offices o
INNER JOIN employees em
ON o.officeCode = em.officeCode
GROUP BY o.officeCode) AS perusahaan
HAVING MAX(banyak));

-- Nomor 3
SELECT productName, productScale FROM 
(SELECT * FROM products pr WHERE pr.productName LIKE "%FORD%") AS produk;

-- Nomor 4
SELECT CONCAT(emp.lastName, ' ', emp.firstName) AS 'employeeName', 
c.customerName, o.orderNumber, jumlah
FROM (SELECT orderNumber, SUM(quantityOrdered * priceEach) 'jumlah' FROM orderdetails
GROUP BY orderNumber) od
INNER JOIN orders o ON o.orderNumber = od.orderNumber
JOIN customers c ON c.customerNumber = o.customerNumber
JOIN employees emp ON emp.employeeNumber = c.salesRepEmployeeNumber
WHERE jumlah = (SELECT MAX(sq1.jumlah) AS 'maxJumlah' 
FROM (SELECT orderNumber, SUM(quantityOrdered * priceEach) 'jumlah' FROM orderdetails
GROUP BY orderNumber) AS sq1);

-- Nomor 5

SELECT DISTINCT country FROM customers WHERE LENGTH(country) IN (
(SELECT MAX(LENGTH(country)) FROM customers), (SELECT MIN(LENGTH(country)) FROM customers));

-- Nomor 5 Alternate Version

SELECT DISTINCT country FROM customers WHERE LENGTH(country) = (
SELECT MAX(LENGTH(country)) FROM customers) OR LENGTH(country) = (SELECT MIN(LENGTH(country)) FROM customers);
