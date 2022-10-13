-- TUGAS PRAKTIKUM 4
-- nomor 1
USE classicmodels;
SELECT o.orderDate, p.productName FROM orders AS o -- Menampilkan data yang diperlukan
INNER JOIN customers AS c ON c.customerNumber = o.customerNumber -- Menghubungkan cutomerNumber pada tabel customers dan tabel orders
INNER JOIN orderdetails AS od ON o.orderNumber = od.orderNumber -- Menghubungkan orderNumber pada tabel orders dan tabel orderdetails
INNER JOIN products AS p ON od.productCode = p.productCode -- Menghubungkan productCode pada tabel orderdetails dan tabel products
WHERE p.productName = '1940 Ford Pickup Truck' -- Syarat produk yang ditampilkan
ORDER BY o.orderDate DESC; -- Mengurutkan menurut orerDate secara menurun (DESC)

-- nomor 2
SELECT p.productName, p.buyPrice, p.MSRP FROM products AS p -- Menampilkan data yang diperlukan
WHERE buyPrice < (0.8 * MSRP); -- Syarat untuk menampilkan data yaitu buyPrice harus 80% dari MSRP


-- nomor 4
-- Membuat kolom baru pada tabel customers bernama status
ALTER TABLE customers
ADD `status` VARCHAR (255);
SELECT * FROM customers;

-- Mengisi Tabel yang customers dengan "VIP bagi customer yang pembayarannya pernah di atas 100.000 atau yang pernah order 50 barang ke atas
UPDATE customers AS c
INNER JOIN payments AS pay ON c.customerNumber = pay.customerNumber -- Menghubungkan customerNumber pada tabel customers dan tabel payments
INNER JOIN orders AS o ON c.customerNumber = o.customerNumber -- Menghubungkan customerNumber pada tabel cutomers dan tabel orders
INNER JOIN orderdetails AS od ON o.orderNumber = od.orderNumber -- Menghubungkan orderNumber pada tabel orders dan tabel orderdetails
SET c.`status` = "VIP" 
WHERE pay.amount >= 100000 or od.quantityOrdered >= 50; -- Status akan diubah menjadi `VIP` dengan syarat di samping

-- Mengisi kolom value yang tersisa dengan "regular"
UPDATE customers AS c
SET c.`status` = "Reqular"
WHERE c.`status` IS NULL; -- Kolom tersisa yang bernilai Null diisi dengan status Regular
SELECT * FROM customers; -- Mengecek apakah kolom `status` sudah berubah sesuai arahan soal

-- noomor 5
-- Pengecekan apakah data yang ingin dihapus sudah sesuai dengan syarat (WHERE)
SELECT c.customerName, o.`status` FROM customers AS c
INNER JOIN orders AS o ON c.customerNumber = o.customerNumber
WHERE o.`status` = "Cancelled";

SHOW CREATE TABLE payments; -- Untuk melihat constraint pada tabel payments
SHOW CREATE TABLE orders; -- Untuk melihat constraint pada tabel orders

ALTER TABLE payments DROP CONSTRAINT payments_ibfk_1; -- Menghapus constraint pada tabel payments yang menghubungkannya dengan tabel customers
ALTER TABLE orders DROP CONSTRAINT orders_ibfk_1; -- Menghapus constraint pada tabel orders yang menghubungkannya dengan tabel customers

-- Penghapusan tabel jika syarat sudah sesuai
DELETE c FROM customers AS c
INNER JOIN orders AS o ON c.customerNumber = o.customerNumber
WHERE o.`status` = "Cancelled";

-- Mengecek kembali syarat (WHERE)-nya, outputnya harusnya kosong
SELECT * FROM customers AS c
INNER JOIN orders AS o ON c.customerNumber = o.customerNumber
WHERE o.`status` = "Cancelled";
