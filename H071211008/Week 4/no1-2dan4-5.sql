-- use classicmodels
# 1. Tampilkan kolom tanggal pemesanan produk dalam urutan menurun untuk pesanan 1940 ford pickup truck 
-- select o.orderDate, o.orderNumber
-- from products as p
-- join orderdetails as od
-- on p.productCode = od.productCode
-- inner join orders as o
-- on od.orderNumber = o.orderNumber
-- where productName = '1940 ford pickup truck'
-- order by orderDate desc

#....................................................................................
# 2. Tampilkan daftar nama produk yang dijual dengan harga kurang dari 80% dari MSRP
-- select p.productName, P.MSRP * 0.8 as '80% dari MSRP', od.priceEach
-- from products as p
-- inner join orderdetails as od
-- on p.productCode = od.productCode
-- where priceEach < 0.8 * MSRP;

#..................................................................................
# 4................
# - Membuat kolom baru dengan nama status yang bertipe data varchar pada tabel customers
-- alter table customers
-- add status varchar(200);
# - Mengisi kolom baru dengan nilai 'VIP' untuk pelanggan yang jumlah pembayarannya pernah diatas 100.000 atau yang pernah mengorder barang dengan kuantitas 50 keatas.
-- select customers.customerNumber, payments.customerNumber, orderdetails.orderNumber
-- from customers
-- update customers
-- inner join  payments
-- on customers.customerNumber = payments.customerNumber
-- inner join orders
-- on payments.customerNumber = orders.customerNumber
-- inner join orderdetails
-- on orders.orderNumber = orderdetails.orderNumber
-- set customers.status = 'VIP'
-- where payments.amount > 100000 or orderdetails.quantityOrdered > 50
# - sisanya isi dengan nilai 'Regular' 
-- update customers
-- set status = 'Reguler'
-- where status is null

#.........................................................................
# 5. Menghapus semua data pelanggan dengan status cencelled
# Mengecek constraint
-- show create table payments
-- show create table orders
# - menghapus foreing key
-- alter table payments drop constraint payments_ibfk_1;
-- alter table orders drop constraint orders_ibfk_1;
# - Menghapus data dengan status cenceled
-- delete customers
-- from customers 
-- inner join orders 
-- on customers.customerNumber = orders.customerNumber
-- where orders.status = 'Cancelled'
