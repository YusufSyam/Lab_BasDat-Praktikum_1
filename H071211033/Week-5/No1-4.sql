-- --------- No 1 ---------
select c.customerName, o.status, o.comments
from customers c
join orders o
on c.customerNumber = o.customerNumber
where o.status = 'on hold' and o.comments like '%credit%';;

-- --------- No 2 ---------
SELECT c.customerName, o.status, o.comments
from customers c
JOIN orders o
where o.comments like '%dhl%';

-- --------- No 3 ---------
SELECT c.customerName, p.productName, o.status, o.shippedDate
from customers c
JOIN orders o
on c.customerNumber = o.customerNumber
join orderdetails od
on od.orderNumber = o.orderNumber
join products p
on p.productCode = od.productCode
WHERE p.productName like '%ferrari%'
order by o.shippedDate desc;
-- --------- No 4 ---------
insert into orders (ordernumber, orderdate, requireddate, status, customernumber)
VALUE (10426, curdate(),  curdate() + interval 1 year, 'In Process', 465);
insert into orderdetails (ordernumber, productcode, quantityordered, priceeach, orderlinenumber)
VALUE (10426, 'S18_2957', 50, 62.46, 1);
SELECT c.customerName, p.productName, o.orderDate, o.requiredDate, o.status
from customers c
join orders o
on o.customerNumber = c.customerNumber
join orderdetails od
on od.orderNumber = o.orderNumber
join products p
on p.productCode = od.productCode
where c.customerNumber = 465