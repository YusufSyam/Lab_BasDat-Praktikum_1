USE classicmodels;
-- SELECT * FROM orders; 
-- SELECT * from orderdetails;
-- SELECT * FROM productlines;
-- SELECT * FROM products;

-- nomor 1 --
-- SELECT o.orderDate, p.productCode, p.productName
-- FROM products AS p
-- JOIN orderdetails AS od
-- ON p.productCode = od.productCode
-- JOIN orders AS o
-- ON od.orderNumber = o.orderNumber
-- WHERE productName = "1940 Ford Pickup Truck"
-- ORDER BY orderDate DESC;

-- nomor 2 --
-- SELECT p.productCode, p.productName
-- FROM products AS p
-- JOIN orderdetails AS od 
-- ON p.productCode = od.productCode
-- WHERE od.priceEach < 0.8 * p.MSRP;
		
		
-- USE appseminar;
-- nomor 3 
-- SELECT m.nama, d.nama
-- FROM ss_dosen AS d 
-- JOIN ss_pembimbing AS p
-- ON d.id_dosen = p.id_pembimbing_utama
-- JOIN ss_mahasiswa AS m
-- ON p.id_mahasiswa = m.id_mahasiswa
-- WHERE m.nama = "Sulaeman";
-- 		
-- nomor 4
		
-- SELECT * FROM customers;
-- ALTER TABLE customers 
-- ADD `status` VARCHAR(10)
-- SELECT * FROM orders;
-- SELECT * FROM orderdetails;
-- SELECT * FROM products;
-- 		
-- UPDATE customers AS c
-- INNER JOIN payments AS p
-- ON c.customerNumber = p.customerNumber
-- INNER JOIN orders AS o
-- ON c.customerNumber = o.customerNumber
-- INNER JOIN orderdetails AS od
-- ON o.orderNumber = od.orderNumber
-- SET c.`status` = 'VIP'
-- WHERE od.quantityOrdered >= 50 OR p.amount > 100000;
-- 		
-- UPDATE customers 
-- SET `status` = "Reguler"
-- WHERE `status` IS NULL;
 		
-- nomor 5 

-- ALTER TABLE orders DROP CONSTRAINT  `orders_ibfk_1`;
-- ALTER TABLE payments DROP CONSTRAINT  `payments_ibfk_1`;
-- SELECT * FROM customers;
-- 
-- DELETE  customers
-- JOIN orders 
-- ON customers.customerNumber = orders.customerNumber
-- WHERE orders.`status` = "Cancelled";

		
		
		
		
		
		
		
		
		
		
		
