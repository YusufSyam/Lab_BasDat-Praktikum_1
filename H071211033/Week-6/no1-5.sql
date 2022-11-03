-- ---------- No 1 ----------
SELECT c.customerName 'Nama Pelanggan', (sum(od.quantityOrdered*od.priceEach)) 'Total Belanja', 
c.creditLimit 'Batas Kredit', (sum(od.quantityOrdered*od.priceEach) - c.creditLimit) 'Selisih'
FROM customers c
join orders o
on c.customerNumber = o.customerNumber
join orderdetails od
on o.orderNumber = od.orderNumber
-- where (sum(od.quantityOrdered*od.priceEach) - c.creditLimit) < 0
GROUP BY c.customerName
having (sum(od.quantityOrdered*od.priceEach)) > c.creditLimit
ORDER BY (sum(od.quantityOrdered*od.priceEach) - c.creditLimit) desc;
-- ---------- No 2 ----------
SELECT CONCAT(c.customerName, ' : ', c.contactFirstName, ' ', c.contactLastName, '@', c.addressLine1) 'Pelanggan', 
sum(od.`quantityOrdered`) 'Jumlah Orderan'
from customers c
join orders o
on c.customerNumber = o.customerNumber
join orderdetails od
on o.orderNumber = od.orderNumber
-- where max(od.quantityOrdered)
group by c.`customerName`
-- HAVING max(od.`quantityOrdered`)
order by sum(od.`quantityOrdered`) desc LIMIT 1;
-- ---------- No 3 ----------
SELECT concat(monthname(p.paymentDate), ' ', year(p.paymentDate)) 'Hari Pembayaran', 
COUNT( c.customerName) 'Jumlah Pelanggan', 
group_concat(c.customerName separator ', ') 'List Pelanggan', sum(p.amount) 'Jumlah Pembayaran'
from customers c
inner join payments p
on c.customerNumber = p.customerNumber
where month(p.paymentDate) = '2'
GROUP BY year(p.paymentDate)
;
-- ---------- No 5 ----------
SELECT o.addressLine1 'Alamat', Concat(substring(o.phone, 1, CHAR_LENGTH(o.phone) - 6), '* ****') 'Nomor Telp', 
COUNT(distinct e.lastName) 'Jumlah Karyawan', COUNT(DISTINCT c.customerName) 'Jumlah Pelanggan', round(AVG(p.amount), 2) 'Rata-rata penghasilan'
from offices o
JOIN employees e
on o.officeCode = e.officeCode
join customers c
on c.salesRepEmployeeNumber = e.employeeNumber
join payments p
on p.`customerNumber` = c.`customerNumber`
GROUP BY o.officeCode
order by o.phone asc;
-- ---------- No 4 ----------
SELECT upper(p.productName) 'Nama Produk', count(o.`orderDate`) 'Jumlah Diorder', group_concat(o.orderDate separator ', ') 'Waktu Orderan', p.buyPrice 'Harga Beli', 
od.priceEach 'Harga Jual',sum(od.`quantityOrdered`) 'Total Jumlah Orderan' ,
concat(sum(od.`quantityOrdered`)*od.`priceEach`,' - ' ,sum(od.`quantityOrdered`)*p.`buyPrice` ,' = ' ,(sum(od.`quantityOrdered`)*od.`priceEach`)-(sum(od.`quantityOrdered`)*p.`buyPrice`)) 'Pendapatan - Modal = Keuntungan'
from products p
join orderdetails od
on p.productCode = od.productCode
join orders o
on od.orderNumber = o.orderNumber
where p.productName = '2001 Ferrari Enzo'
GROUP BY od.`priceEach`
having (sum(od.`quantityOrdered`)*od.`priceEach`)-(sum(od.`quantityOrdered`)*p.`buyPrice`) >5000
order by (sum(od.`quantityOrdered`)*od.`priceEach`)-(sum(od.`quantityOrdered`)*p.`buyPrice`) desc;