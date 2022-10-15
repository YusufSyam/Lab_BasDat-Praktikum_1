-- ----------- No 4 ---------------------

ALTER TABLE customers
ADD status VARCHAR(7);

UPDATE customers c
JOIN payments p
ON p.customernumber = c.customerNumber
JOIN orders o
ON o.customerNumber = c.customerNumber
JOIN orderdetails od
ON o.orderNumber = od.orderNumber
SET c.status='VIP'
WHERE od.quantityOrdered > 50 AND p.amount > 100000;

UPDATE customers c
SET c.status='Regular'
WHERE c.status IS NULL;

-- ----------- No 5 ---------------------

ALTER TABLE orders drop constraint orders_ibfk_1;
ALTER TABLE payments drop constraint payments_ibfk_1;
DELETE c FROM customers c
JOIN orders o
ON c.customernumber = o.customerNumber
WHERE o.status='cancelled'