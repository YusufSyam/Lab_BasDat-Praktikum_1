-- ----------- No 1 ---------------------

SELECT py.paymentdate, pr.productname
FROM payments as py
JOIN orders o
ON py.customerNumber = o.customernumber
JOIN orderdetails od
ON o.ordernumber = od.orderNumber
JOIN products pr
ON pr.productcode = od.productCode
WHERE pr.productName="1940 Ford Pickup Truck"
ORDER BY py.paymentdate DESC; 

-- ----------- No 2 ---------------------

SELECT pr.productName, py.amount
FROM products pr
JOIN orderdetails od
ON pr.productCode = od.productCode
JOIN orders o
ON o.orderNumber = od.orderNumber
JOIN payments py
ON py.customerNumber = o.customerNumber
WHERE pr.buyprice < pr.msrp*0.8;
