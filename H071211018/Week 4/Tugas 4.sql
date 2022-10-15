USE classicmodels;
SELECT*FROM orders;
SELECT*FROM products;
SELECT*FROM orderdetails;

#NO1 
#tampilkan kolom tanggal pemesanan product dalam urutan menurun untuk pesanan Ford Pickup Truck 1940
SELECT products.productName,products.productCode,orders.orderDate
FROM products
JOIN orderdetails
ON products.productCode=orderdetails.productCode
JOIN orders
ON orderdetails.orderNumber=orders.orderNumber
WHERE productName='1940 ford pickup truck'
ORDER BY orderdate DESC;

#NO2
#tampilkan daftar nama produk yang dijual dengan harga kurang dari 80% dari MSRP
SELECT p.productName, p.MSRP, od.priceEach
FROM products AS p
JOIN orderdetails AS od
ON p.productCode=od.productCode
WHERE priceEach < 0.8 * MSRP;

#NO3
USE appseminar;
#tampilkan pembimbing utama dari mahasiswa bernama sulaeman 
SELECT * FROM  ss_mahasiswa;
SELECT * FROM  ss_dosen;
SELECT * FROM ss_pembimbing;

SELECT ss_mahasiswa.nama AS NamaMahasiswa, ss_dosen.nama AS PembimbingUtama
FROM ss_mahasiswa
INNER JOIN ss_pembimbing
ON ss_mahasiswa.id_mahasiswa = ss_pembimbing.id_mahasiswa
INNER JOIN ss_dosen
ON ss_pembimbing.id_pembimbing_utama = ss_dosen.id_dosen
WHERE ss_mahasiswa.nama = 'Sulaeman';

#NO 4
USE classicmodels;
#buatlah kolom baru dengan nama status yang bertipe data varchar pada tabel customers 
-- ALTER TABLE customers
-- DROP STATUS;

-- ALTER TABLE customers
-- ADD `status` VARCHAR (200);

DESC customers;

#isi dengan nilai 'VIP' untuk pelanggan yang jumlah pembayarannya pernah diatas 100.000 atau yang pernah mengorder barang dengan kuantitas 50 keatas
-- update customers as c
-- inner join orders as o
-- on c.customernumber = o.customernumber
-- inner join orderdetails as od
-- on od.ordernumber = o.ordernumber
-- inner join payments as p
-- on c.customernumber = p.customernumber
-- set c.status='vip'
-- where p.amount > 100000 or od.quantityordered > 50;

UPDATE customers c
SET c.`status`='Regular'
WHERE c.`status` IS NULL ;


-- No. 5
ALTER TABLE orders DROP CONSTRAINT orders_ibfk_1;
ALTER TABLE payments DROP CONSTRAINT payments_ibfk_1;

DELETE c from customers c
INNER JOIN orders AS o
ON c.customerNumber = o.customerNumber
WHERE o.`status`= 'cancelled';