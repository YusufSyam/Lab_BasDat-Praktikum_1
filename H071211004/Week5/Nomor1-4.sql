-- Nomor 1
/*
SELECT od.orderNumber, o.`status`, o.shippedDate, od.quantityOrdered 
FROM orders o 
INNER JOIN orderdetails od 
ON o.orderNumber = od.orderNumber
WHERE o.`status`='Cancelled' AND o.shippedDate IS NOT NULL LIMIT 3;

*/
-- Nomor 2

/*
SELECT c.customerName, o.`status`, o.comments 
FROM orders o 
INNER JOIN customers c 
ON o.customerNumber = c.customerNumber 
WHERE o.comments LIKE '%DHL%';
*/

-- Nomor 3
/*
SELECT c.customerName, p.productName, py.paymentDate, o.`status`
FROM orders o 
INNER JOIN orderdetails od 
ON o.orderNumber = od.orderNumber
INNER JOIN products p
ON p.productCode = od.productCode
INNER JOIN customers c
ON c.customerNumber = o.customerNumber
INNER JOIN payments py
ON py.customerNumber = c.customerNumber
WHERE p.productName LIKE '% Ferrari %';
*/

-- Nomor 1 EXTRA

/*
SELECT c.customerNumber, c.customerName, o.`status`, o.comments FROM orders o 
INNER JOIN customers c 
ON o.customerNumber = c.customerNumber 
WHERE comments LIKE '%credit limit exceeded%';
*/

-- Nomor 2 EXTRA

/*
SELECT c.customerNumber, c.customerName, o.`status`, o.comments FROM orders o 
INNER JOIN customers c 
ON o.customerNumber = c.customerNumber 
WHERE comments LIKE '%DHL%';
*/

-- Nomor 3 EXTRA

/*
SELECT c.customerName, p.productName, py.paymentDate, o.`status`
FROM orders o 
INNER JOIN orderdetails od 
ON o.orderNumber = od.orderNumber
INNER JOIN products p
ON p.productCode = od.productCode
INNER JOIN customers c
ON c.customerNumber = o.customerNumber
INNER JOIN payments py
ON py.customerNumber = c.customerNumber
WHERE p.productName LIKE '%Ferrari%';
*/

-- Nomor 4 EXTRA

/*
insert into orders value (10426, CURDATE(), ADDDATE(CURDATE(),365), null, 'In Process', null, 465);
insert into orderdetails value (10426, 'S18_2957', 50, 62.46, 19); 
*/




