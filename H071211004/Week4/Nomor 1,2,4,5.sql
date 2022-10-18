-- Nomor 1
SELECT o.orderDate, p.productName 
FROM orders AS o 
INNER JOIN orderdetails AS od
ON o.orderNumber = od.orderNumber
INNER JOIN products AS p
ON p.productCode = od.productCode
WHERE p.productName = '1940 Ford Pickup Truck' ORDER BY o.orderDate DESC;

-- Nomor 2
SELECT p.productName FROM products p INNER JOIN orderdetails od ON od.productCode = p.productCode WHERE od.priceEach < (p.MSRP * 0.8);

-- Nomor 4

ALTER TABLE customers ADD status VARCHAR(255);

UPDATE customers AS c 
INNER JOIN payments AS p 
ON p.customerNumber = c.customerNumber 
INNER JOIN orders AS o 
ON o.customerNumber = c.customerNumber
INNER JOIN orderdetails AS od
ON o.orderNumber = od.orderNumber
SET c.status="VIP"
WHERE p.amount > 99999 OR od.quantityOrdered > 49;

UPDATE customers AS c 
INNER JOIN payments AS p 
ON p.customerNumber = c.customerNumber 
INNER JOIN orders AS o 
ON o.customerNumber = c.customerNumber
INNER JOIN orderdetails AS od
ON o.orderNumber = od.orderNumber
SET c.status="Regular"
WHERE (p.amount < 100000 OR od.quantityOrdered < 50) AND c.status!="VIP";

-- Nomor 5

ALTER TABLE orders DROP CONSTRAINT orders_ibfk_1;
ALTER TABLE payments DROP CONSTRAINT payments_ibfk_1;

DELETE c FROM customers c
INNER JOIN orders o
ON c.customerNumber = o.customerNumber
INNER JOIN payments p
ON c.customerNumber = p.customerNumber
WHERE o.`status`="Cancelled";

