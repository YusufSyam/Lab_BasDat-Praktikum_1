USE classicmodels;

-- Nomor 2
SELECT c.customerName, o.`status`, o.comments FROM customers AS c
INNER JOIN orders AS o ON c.customerNumber = o.customerNumber
WHERE o.comments IS NOT NULL;