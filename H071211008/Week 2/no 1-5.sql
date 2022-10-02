-- use classicmodels;

-- # 1. Menampilkan semua kolom dari tabel offices yang bersal dari kota san francisco
-- select * from offices where city = "san francisco";

-- # 2. menampilkan kolom dari tabel ordedetails
-- select * from orderdetails where quantityOrdered > 70 order by orderLineNumber asc;

-- # 3. Menampilkan producline tanpa value yang sama pada tabel products
-- select distinct productLine from products;

-- # 4. Menampilkan costomerNumber dan customerNama
-- select customerNumber as nomorPelanggan, customerName as namaPelanggan from customers where customerNumber > 100 and customerNumber < 150;

# 5. Menampilkan data customer yang bukan dari usa yang tidak bisa lagi menarik uang dari rekeningnya
-- select * from customers where creditLimit = 0 and country != "USA" order by customerName asc limit 9,10 

