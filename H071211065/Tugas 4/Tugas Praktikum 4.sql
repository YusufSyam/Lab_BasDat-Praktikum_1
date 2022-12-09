select  * from products;
select  * from productlines;
select  * from orderdetails;
select * from payments;
select * from customers;
select * from orders;
-- nomor 1
SELECT products.productName, products.productcode, orders.orderDate From products
INNER JOIN orderdetails
ON products.productCode = orderdetails.productCode 
INNER JOIN orders
on  orderdetails.orderNumber = orders.orderNumber
WHERE products.productCode = "S18_1097" order by orders.orderDate desc;

-- nomor 2
SELECT products.productName, products.productcode, orderdetails.priceEach, products.MSRP From products
INNER JOIN orderdetails
ON products.productCode = orderdetails.productCode 
WHERE orderdetails.priceEach < 80/100*(Products.MSRP);

-- nomor 3
SELECT ss_mahasiswa.Nama, ss_mahasiswa.id_mahasiswa , ss_pembimbing.id_pembimbing_utama, ss_dosen.nama From ss_mahasiswa
INNER JOIN ss_pembimbing
ON ss_mahasiswa.id_mahasiswa = ss_pembimbing.id_mahasiswa
INNER JOIN ss_dosen
ON ss_pembimbing.id_pembimbing_utama = ss_dosen.id_dosen
WHERE ss_mahasiswa.id_mahasiswa = '288';

-- nomor 4
ALTER TABLE customers
ADD COLUMN `Status` varchar(10);

update customers
INNER JOIN payments
ON customers.customerNumber = payments.customerNumber
INNER JOIN orders
ON customers.customerNumber = orders.customerNumber
INNER JOIN orderdetails
ON orders.orderNumber = orderdetails.orderNumber
Set customers.Status = 'VIP'
WHERE payments.amount >= 100000 or orderdetails.quantityOrdered >= 50;

-- melihat daftar customer VIP
SELECT customers.customerName, payments.amount, orderdetails.quantityOrdered, customers.status FROM customers
INNER JOIN payments
ON customers.customerNumber = payments.customerNumber
INNER JOIN orders
ON customers.customerNumber = orders.customerNumber
INNER JOIN orderdetails
ON orders.orderNumber = orderdetails.orderNumber
WHERE payments.amount >= 100000 or orderdetails.quantityOrdered >= 50;

-- Mengubah yang selain VIP menjadi Regular
Update customers
SET customers.Status = 'Regular'
WHERE customers.Status is NULL;

-- nomor 5
use classicmodels;

show create table orders;
show create table payments;

alter table orders drop constraint orders_ibfk_1;
alter table payments drop constraint payments_ibfk_1;

select distinct status from orders;

delete customers from customers 
inner join orders on orders.customerNumber = customers.customerNumber
where status in ("Cancelled");






