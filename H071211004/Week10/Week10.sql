SELECT cst.customerName 'Nama', 
CASE 
WHEN (cst.creditLimit - SUM(od.priceEach * od.quantityOrdered)) < 0 THEN 'YOU ARE IN DEBT'
WHEN (cst.creditLimit - SUM(od.priceEach * od.quantityOrdered)) = 0 THEN 'You are running out of credits'
ELSE 'YOU ARE SAFE'
END AS 'Are you Safe?',
(cst.creditLimit - SUM(od.priceEach * od.quantityOrdered)) AS 'TOTAL'
FROM customers cst
INNER JOIN orders o
USING (customerNumber)
INNER JOIN orderdetails od
USING (orderNumber)
GROUP BY cst.customerName