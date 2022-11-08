use classicmodels;

-- Nomor 1
select c.customerName as `Nama Pelanggan`, SUM(p.amount) as `Total Belanja`, c.creditLimit as `Batas Kredit`, abs(SUM(p.amount)-c.creditLimit) as `Selisih`
FROM customers c join payments p on c.customerNumber = p.customerNumber
GROUP BY p.customerNumber having `Total Belanja`>`Batas Kredit`
ORDER BY `Selisih` desc;

-- Nomor 2
select CONCAT(c.customerName,' : ',c.contactFirstName,c.contactLastName,' @ ',c.addressLine1) `Pelanggan`, SUM(od.quantityOrdered) `Jumlah Orderan`
from customers c join orders o on c.customerNumber = o.customerNumber
join orderdetails od on o.orderNumber = od.orderNumber
GROUP BY o.customerNumber ORDER BY `Jumlah Orderan` DESC LIMIT 1;

-- Nomor 3
select CONCAT(MONTHNAME(p.paymentDate),' ', YEAR(p.paymentDate)) `Hari Pembayaran`, COUNT(p.customerNumber) `Jumlah Pelanggan`, GROUP_CONCAT(c.customerName ORDER BY c.customerName ASC) `List Pelanggan`,SUM(p.amount) `Jumlah Pembayaran`
from payments p join customers c on p.customerNumber = c.customerNumber
where MONTH(p.paymentDate) = 2
group by YEAR(p.paymentDate);

-- Nomor 4
-- Mencari productCode dari 2001 Ferrari Enzo 
select productCode from products where productName = '2001 Ferrari Enzo';
-- Didapatkan productCode = S12_1108
-- Final Query
select UPPER(p.productName) `Nama Produk`, COUNT(o.orderNumber) `Jumlah Orderan`, GROUP_CONCAT(o.orderDate order by o.orderDate asc separator ', ') `Waktu Orderan`, p.buyPrice `Harga Beli`, od.priceEach `Harga Jual`, SUM(od.quantityOrdered) `Total Jumlah Orderan`, CONCAT(SUM(od.quantityOrdered*od.priceEach),' - ', SUM(od.quantityOrdered*p.buyPrice),' = ', SUM(od.quantityOrdered*od.priceEach-od.quantityOrdered*p.buyPrice)) `Pendapatan - Modal = Keuntungan`
from products p right join orderdetails od on p.productCode = od.productCode left join orders o on o.orderNumber = od.orderNumber
where p.productName = '2001 Ferrari Enzo'
group by o.customerNumber
having SUM(od.quantityOrdered*(od.priceEach-p.buyPrice))>5000
order by SUM(od.quantityOrdered*(od.priceEach-p.buyPrice)) desc;
-- Cek jumlah order 2001 Ferrari Enzo
SELECT SUM(quantityOrdered) FROM orderdetails where `productCode`='S12_1108';

-- Nomor 5
select o.addressLine1 `Alamat`, REPLACE(o.phone, RIGHT(o.phone, 6), '* ****') `Nomor Telp`, COUNT(distinct e.employeeNumber) `Jumlah Karyawan`, COUNT(distinct c.customerNumber) `Jumlah Pelanggan`, ROUND(AVG(p.amount),2) `Rata-Rata Penghasilan`
from offices o right join employees e on o.officeCode = e.officeCode right join customers c on c.salesRepEmployeeNumber = e.employeeNumber right join payments p on p.customerNumber = c.customerNumber
group by e.officeCode
order by `Nomor Telp`;