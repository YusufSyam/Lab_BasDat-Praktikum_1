USE classicmodels;
SELECT * FROM payments;
SELECT * FROM customers;
SELECT * FROM offices;
SELECT * FROM employees;

#no. 1
#buatlah query untuk menampilkan data pembayaran(payment) terkecil dan terbesar untuk masing" pengguna dengan menggunakan subquery
SELECT customerName,   MAX(amount) AS 'Pembayaran Terbesar', MIN(amount) AS 'Pembayaran Terkecil'
FROM (SELECT customerNumber, amount
		 FROM payments) AS p
INNER JOIN customers
ON customers.customerNumber = p.customerNumber
GROUP BY customers.customerNumber;

#no. 2
#buatlah query untuk menampilkan seluru employee yang bekerjaa di office dengan employee terbanyak
#(misalnya office A memiliki paling banyak employee, maka buatkan daftar employee pada office A)
SELECT * FROM employees
WHERE officeCode = (SELECT officeCode
FROM employees
GROUP BY officeCode
ORDER BY COUNT(employeeNumber) DESC LIMIT 1);

#no. 3
#buatlah query yang akan menampilkan seluruh product yang dinamanya mengandung kata 'Ford'
#beserta productScale dari product tsb
SELECT * FROM (SELECT products.productName, products.productScale
FROM products
WHERE productName LIKE '%Ford%') AS p ;

# no. 4
# siapa nama pelanggan, dan nama karyawan serta 
# berapa nomor pesanan dan biaya pesanan untuk pesanan yang paling mahal

SELECT customerName AS `Nama Kustomer`, 
CONCAT(e.firstName, ' ', e.lastName) AS `Nama Karyawan`,
o.orderNumber AS 'Nomor Pesanan'

FROM orders o JOIN customers c
USING(customerNumber)
JOIN employees e
ON c.salesRepEmployeeNumber=e.employeeNumber
WHERE o.orderNumber=(SELECT orderNumber FROM orderdetails
GROUP BY orderNumber
ORDER BY sum(quantityOrdered*priceEach) DESC LIMIT 1);

#no.5
#tamplikan nama negara dan panjang karakter negara
#dimana menampilkan dua negara yaitu negara dengan karakter terpanjang dan negara dengan karakter terpendek
SELECT distinct country, LENGTH(country) AS `Panjang Karakter Negara` FROM customers 
WHERE country=(SELECT country FROM customers ORDER BY LENGTH(country) DESC LIMIT 1)
OR country=(SELECT country FROM customers ORDER BY LENGTH(country) ASC LIMIT 1);

