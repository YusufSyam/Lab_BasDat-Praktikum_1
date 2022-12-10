USE classicmodels;

-- NOMOR 1
SELECT customerNumber, customerName,
	(SELECT MAX(amount) FROM payments WHERE customers.customerNumber = payments.customerNumber) AS 'Terbesar',
	(SELECT MIN(amount) FROM payments WHERE customers.customerNumber = payments.customerNumber) AS 'Terkecil'
FROM customers;


-- NOMOR 2
SELECT * FROM employees
WHERE officeCode = 
	(SELECT officeCode FROM employees GROUP BY officeCode ORDER BY COUNT(employeeNumber) DESC LIMIT 1);
	
	
-- NOMOR 3
SELECT productName, productScale 
FROM products AS p
WHERE EXISTS
	(SELECT * FROM products WHERE p.productName LIKE '%Ford%');
	
	
-- NOMOR 4
SELECT customers.customerName AS 'Nama pelanggan', 
	CONCAT(employees.firstName, ' ', employees.lastName) AS 'Nama karyawan', 
	orders.orderNumber, 
	SUM(quantityOrdered * priceEach) AS 'Biaya pesanan'
FROM customers
JOIN employees
ON customers.salesRepEmployeeNumber = employees.employeeNumber
JOIN orders
ON customers.customerNumber = orders.customerNumber
JOIN orderdetails
ON orders.orderNumber = orderdetails.orderNumber
WHERE orderdetails.orderNumber = 
	(SELECT orderNumber FROM orderdetails GROUP BY orderNumber ORDER BY SUM(quantityOrdered * priceEach) DESC LIMIT 1);
	

-- NOMOR 5
SELECT DISTINCT country,
	LENGTH(country) AS 'Panjang Karakter'
FROM customers
WHERE 
	LENGTH(country) = 
	(SELECT MAX(LENGTH(country)) FROM customers) OR
	LENGTH(country) =
	(SELECT MIN(LENGTH(country)) FROM customers)
ORDER BY LENGTH(country) DESC;