#Use classicmodels
# 1. Menggunakan database classicmodels tampilkan nama pelanggan yang total belanjanya melebihi kredit limit, serta tampilkan selisih total belanja dengan kreditlimit, kemudian urutkan berdasarkan selisih tersebut secara menurun.
select c.customerName as 'Nama Pelanggan', 
sum(p.amount) as 'Total Belanja', 
c.creditLimit as 'Batas Kredit', 
(SUM(p.amount) - c.creditLimit) as 'Selisih'
FROM customers as c
inner join payments as p
on c.customerNumber = p.customerNumber
group by c.customerName
having sum(p.amount) > c.creditLimit 
order by (sum(p.amount) - c.creditLimit)  desc 
limit 5;

# 2.  Siapa customer yang total pembelian barangnya terbanyak (dihitung dari quantity bukan price)
select concat(c.customerName, ' : ', c.contactFirstName, ' ', c.contactLastName, '@', c.addressLine1) as 'Pelanggan',
sum(od.quantityOrdered) as 'Jumlah Barang'
from customers as c
inner join orders as o
on c.customerNumber = o.customerNumber
inner join orderdetails as od
on o.orderNumber = od.orderNumber
group by c.customerName 
order by sum(od.quantityOrdered) desc 
limit 1;


# 3. Tampilkan jumlah dan list pelanggan, serta jumlah pembayaran untuk pembayaran yang dilakukan pada bulan februari setiap tahunnya.
select concat(monthname(p.paymentDate), ' ', year(p.paymentDate)) as 'Hari Pembayaran',
count(c.customerName) as 'Jumlah Pelanggan',
group_concat(c.customerName order by customerName asc separator '; ') as 'List Pelanggan',
sum(p.amount) as 'Jumlah Pembayaran'
from customers as c
inner join payments as p
on c.customerNumber = p.customerNumber
where monthname(p.paymentDate) = 'february'
group by year(p.paymentDate) 
order by sum(p.amount) desc;


# 4. Tampilkan informasi jumlah orderan serta keuntungan untuk penjualan 2001 Ferrari Enzo yang keuntungannya lebih besar dari 5000.
select upper(p.productName) as 'nama produk',
count(o.customerNumber) as 'jumlah diorder', 
group_concat(orderDate separator '; ') as 'waktu orderan',
p.buyPrice as 'harga beli',
od.priceEach as 'harga jual', 
sum(od.quantityOrdered) 'Total Jumlah Orderan',
concat((sum(od.quantityOrdered * od.priceEach)), " - ", 
sum(od.quantityOrdered * p.buyprice), " = ", 
(sum(od.quantityOrdered * od.priceEach)) - sum(od.quantityOrdered * p.buyprice))
as "pendapatan - modal = keuntungan"
from products as p
inner join orderdetails as od
on p.productCode = od.productCode
inner join orders as o
on od.orderNumber = o.orderNumber
where p.productName =  '2001 Ferrari Enzo'
group by priceEach
having (sum(od.quantityOrdered * od.priceEach)) - sum(od.quantityOrdered * p.buyprice) > 5000 
order by (sum(od.quantityOrdered * od.priceEach)) - sum(od.quantityOrdered * p.buyprice) desc;

# 5.  Tampilkan alamat pertama dari tiap kantor, no telp yang 5 angka terakhirnya disamarkan, jumlah karyawan, jumlah pelanggan yang pernah dilayani, serta rata-rata penghasilan.
select ofc.addressLine1 as 'Alamat', 
concat(left(ofc.phone, length(ofc.phone)-6), '* ****') as 'Nomor Telp',
count(distinct e.employeeNumber) as 'jumlah karyawan', 
count(distinct c.customerName) as 'Jumlah Pelanggan', 
round(avg(amount), 2) as 'Rata-Rata Penghasilan' 
from offices as ofc
left join employees as e
on e.officeCode = ofc.officeCode
left join customers as c
on c.salesRepEmployeeNumber = e.employeeNumber
left join payments as p
on c.customerNumber = p.customerNumber
group by ofc.officeCode
order by concat(left(ofc.phone, length(ofc.phone)-6), '* **') asc;