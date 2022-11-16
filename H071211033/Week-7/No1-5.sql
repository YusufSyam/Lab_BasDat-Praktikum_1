-- ------------ N0 1 ------------
SELECT n 'Nama Pelanggan', round(mx) 'Pembayaran Terbesar', round(mn) 'Pembayaran Terkecil'
from (
    SELECT c.`customerName` n, MAX(p.amount) mx, MIN(p.amount) mn
    from customers c
    join payments p
    on c.`customerNumber` = p.`customerNumber`
    GROUP BY c.`customerNumber`
) as t;
-- ------------ N0 2 ------------
SELECT CONCAT(e.`firstName`, ' ', e.`lastName`) 'Nama Karyawan'
from employees e
join offices o
on e.`officeCode` = o.`officeCode`
where o.`officeCode` = (
    SELECT o.`officeCode`
    from offices o
    join employees e
    on o.`officeCode` = e.`officeCode`
    GROUP BY o.`officeCode`
    ORDER BY COUNT(e.`employeeNumber`) desc LIMIT 1
);
-- ------------ N0 3 ------------
SELECT `productName`, `productScale`
from products 
where `productName` in (
    SELECT `productName`
    from products
    WHERE `productName` like '%ford%'
);
-- ------------ N0 4 ------------
SELECT n 'Nama Pelanggan', k 'Nama Karyawan', o 'Nomor Pesanan', m 'Biaya Pesanan Termahal'
from (
    SELECT c.`customerName` n, CONCAT(e.`firstName`, ' ', e.`lastName`) k, 
    group_concat(distinct o.`orderNumber` separator ', ') o
    , MAX(od.`priceEach`) m
    from customers c
    join employees e
    on c.`salesRepEmployeeNumber` = e.`employeeNumber`
    join orders o
    on c.`customerNumber` = o.`customerNumber`
    join orderdetails od
    GROUP BY c.`customerNumber`
) as t;
-- ------------ N0 5 ------------
SELECT c Negara, l 'Panjang Karakter'
from (
    SELECT distinct country c, CHAR_LENGTH(country) l
    from customers
    where CHAR_LENGTH(country) = (SELECT max(CHAR_LENGTH(country)) from customers) or 
    CHAR_LENGTH(country) = (SELECT min(CHAR_LENGTH(country)) from customers)
) as t;
SELECT distinct country c, CHAR_LENGTH(country)
    from customers
    where CHAR_LENGTH(country) = 12 or CHAR_LENGTH(country) = 2