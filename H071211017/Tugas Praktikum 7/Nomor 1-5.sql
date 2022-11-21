use classicmodels;

-- Nomor 1
select * from payments where amount = (select MAX(amount) from payments) OR amount = (select MIN(amount) from payments);

-- Nomor 2
select e.* from employees e, (select officeCode, count(employeeNumber) `Jumlah employee`
                            from employees group by officeCode order by `Jumlah employee` desc limit 1) t
                            where e.officeCode = t.officeCode;
select officeCode, count(employeeNumber) `Jumlah employee` from employees group by officeCode order by `Jumlah employee` desc limit 1;


-- Nomor 3
select productName, productScale from products where productName like '%Ford%';
select t.productName, t.productScale from (select productName, productScale from products where productName like '%Ford%') t;

-- Nomor 4
-- Mencari nama pelanggan dengan biaya pesanan paling mahal
select orderNumber, max(quantityOrdered*priceEach) harga from orderdetails;
select o.customerNumber, t.orderNumber from orders o
join (select orderNumber, max(quantityOrdered*priceEach) harga from orderdetails) t on o.orderNumber = t.orderNumber;

-- Mencari nama karyawan
select c.customerName `pelanggan`, CONCAT(e.firstName,' ',e.lastName) `karyawan`, c.salesRepEmployeeNumber `no_karyawan`
from customers c join employees e on c.salesRepEmployeeNumber = e.employeeNumber
where c.customerNumber =    (select o.customerNumber from orders o
                            join (select orderNumber, max(quantityOrdered*priceEach) harga from orderdetails) t
                            on o.orderNumber = t.orderNumber);
-- query final
select k1.pelanggan, k1.karyawan, k2.orderNumber, k2.harga from (select c.customerName `pelanggan`, CONCAT(e.firstName,' ',e.lastName) `karyawan`
        from customers c join employees e on c.salesRepEmployeeNumber = e.employeeNumber
        where c.customerNumber =    (select o.customerNumber from orders o
                                    join (select orderNumber, max(quantityOrdered*priceEach) harga from orderdetails) t
                                    on o.orderNumber = t.orderNumber)) k1 join
        (select orderNumber, max(quantityOrdered*priceEach) harga from orderdetails) k2;

-- Nomor 5
select country, LENGTH(country) panjang from customers order by panjang desc limit 1;
select country, LENGTH(country) panjang from customers order by panjang asc limit 1;
select t1.country `Country`, t1.panjang `Panjang Karakter`, t2.country `Country`, t2.panjang `Panjang Karakter` from (select country, LENGTH(country) panjang from customers order by panjang desc limit 1) t1 join (select country, LENGTH(country) panjang from customers order by panjang asc limit 1) t2;