USE classicmodels;
USE appseminar;

-- no 1
SELECT products.productName, products.productcode, orders.orderDate FROM products
INNER JOIN orderdetails
ON products.productCode = orderdetails.productCode 
INNER JOIN orders
ON  orderdetails.orderNumber = orders.orderNumber
WHERE products.productName = "1940 Ford Pickup Truck" ORDER BY orders.orderDate DESC;

--  no 2
SELECT products.productName, orderdetails.priceEach, products.MSRP FROM products
INNER JOIN orderdetails
ON products.productCode = orderdetails.productCode 
WHERE orderdetails.priceEach < 80/100* Products.MSRP;

-- no 3
SELECT ss_mahasiswa.Nama, ss_mahasiswa.id_mahasiswa , ss_pembimbing.id_pembimbing_utama, ss_dosen.nama FROM ss_mahasiswa
INNER JOIN ss_pembimbing
ON ss_mahasiswa.id_mahasiswa = ss_pembimbing.id_mahasiswa
INNER JOIN ss_dosen
ON ss_pembimbing.id_pembimbing_utama = ss_dosen.id_dosen
WHERE ss_mahasiswa.Nama = 'Sulaeman';