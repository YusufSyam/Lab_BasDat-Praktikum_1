-- USE classicmodels;

-- Soal 1
SELECT * FROM products;
SELECT * FROM orderdetails;
SELECT * FROM orders;

SELECT orderdetails.productCode, orders.orderDate, products.productName
FROM products
INNER JOIN orderdetails
ON products.productCode = orderdetails.productCode
INNER JOIN orders
ON orderdetails.orderNumber = orders.orderNumber
WHERE productName='1940 Ford Pickup Truck' ORDER BY orderDate DESC;

-- Soal 2
-- SELECT products.productName, orderdetails.priceEach, 0.8 * products.MSRP
-- FROM products
-- INNER JOIN orderdetails
-- ON products.productCode = orderdetails.productCode
-- WHERE orderdetails.priceEach < 0.8 * products.MSRP

-- Soal 3
-- USE appseminar;
-- 
-- SELECT * FROM ss_pembimbing;
-- SELECT * FROM ss_mahasiswa;

-- SELECT ss_dosen.nama, ss_mahasiswa.nama
-- FROM ss_pembimbing
-- JOIN ss_mahasiswa
-- ON ss_pembimbing.id_mahasiswa = ss_mahasiswa.id_mahasiswa
-- JOIN ss_dosen
-- ON ss_dosen.id_dosen = ss_pembimbing.id_pembimbing_utama
-- WHERE ss_mahasiswa.nama='Sulaeman'

-- Soal 4
-- USE classicmodels;

-- ALTER TABLE customers
-- ADD status VARCHAR(255) NOT NULL;

-- SELECT * FROM customers;
-- SELECT * FROM payments;

-- SELECT * FROM orders;
-- SELECT * FROM orderdetails;
-- 
-- UPDATE customers
-- INNER JOIN payments
-- ON customers.customerNumber = payments.customerNumber
-- INNER JOIN orders
-- ON orders.customerNumber =  payments.customerNumber
-- INNER JOIN orderdetails
-- ON orderdetails.orderNumber = orders.orderNumber
-- SET customers.status ='VIP'
-- WHERE quantityOrdered>50 or amount>100000;

-- Soal 5
-- ALTER TABLE orderdetails
-- DROP CONSTRAINT orderdetails_ibfk_1;
-- 
-- ALTER TABLE orderdetails	
-- ADD CONSTRAINT orderdetails_ibfk_1 FOREIGN KEY(OrderNumber) REFERENCES orders(orderNumber)
-- ON DELETE CASCADE ON UPDATE CASCADE;
-- 
-- ALTER TABLE orders
-- DROP CONSTRAINT orders_ibfk_1;
-- 
-- ALTER TABLE orders
-- ADD CONSTRAINT orders_ibfk_1 FOREIGN KEY(customerNumber) REFERENCES customers(customerNumber)
-- ON DELETE CASCADE ON UPDATE CASCADE;
-- 
-- ALTER TABLE payments
-- DROP CONSTRAINT payments_ibfk_1;
-- 
-- ALTER TABLE Payments
-- ADD CONSTRAINT payments_ibfk_1 FOREIGN KEY(customerNumber) REFERENCES customers(customerNumber)
-- ON DELETE CASCADE ON UPDATE CASCADE;

-- DELETE customers, orders, orderdetails
-- FROM customers
-- INNER JOIN orders
-- ON customers.customerNumber = orders.customerNumber
-- INNER JOIN orderdetails
-- ON orders.orderNumber = orderdetails.orderNumber
-- INNER JOIN payments
-- ON customers.customerNumber = payments.customerNumber
-- WHERE orders.status = 'Cancelled';