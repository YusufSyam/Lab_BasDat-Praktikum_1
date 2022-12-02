use classicmodels;

select customers.customerName, (customers.creditLimit - sum(orderdetails.quantityOrdered * orderdetails.priceEach)) as 'total',
case 
when  (customers.creditLimit - sum(orderdetails.quantityOrdered * orderdetails.priceEach)) > 0 then "you are safe"
when  (customers.creditLimit - sum(orderdetails.quantityOrdered * orderdetails.priceEach)) < 0 then "you are in debt"
when  (customers.creditLimit - sum(orderdetails.quantityOrdered * orderdetails.priceEach)) = 0 then  "you are running out of credits"
end 
as "are you safe?"
from customers
join orders 
using (customerNumber)
join orderdetails 
on orderdetails.orderNumber = orders.orderNumber
group by customers.customerNumber;