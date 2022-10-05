-- Tugas Praktikum 3
USE classicmodels;

-- Nomor 1
INSERT INTO employees
VALUE 
-- Menambahkan data pertama
	(1010, 'Mukram', 'Muhammad', 'x3909', 'mukrammuhammad@gmail.com', '1', 1002, 'HRD'),
-- Menambahkan data kedua
	(1005, 'Habib', 'Kadzab', 'x4030', 'alkadzab@gmail.com', '1', 1143, 'Secretary'),
-- Menambahkan data ketiga
	(1290, 'Jone', 'Addeh', 'x909', 'Addeh09@gmail.com', '5', 1056, 'Janitor');
	
-- Cek apakah data yang dimasukkan sudah ada dalam tabel
SELECT * FROM employees WHERE lastName IN ('Mukram','Habib','Jone') ORDER BY employeeNumber;


-- Nomor 2
Membuat officeCode baru
INSERT INTO offices
VALUE ('8', 'Makassar', '+62 85087976534', 'Jl.Perintis Kemerdekaan', 'Gedung PBT', '', 'Indonesia', '90254', 'Asian');

-- UPDATE officeCode lama manjadi officeCode baru yang telah dibuat dengan ketentuan soal;
UPDATE employees
SET officeCode='8'
WHERE officeCode='4' AND jobTitle='Sales Rep';
-- Cek apakah data yang sudah di update masuh ada atau tidak
SELECT * FROM employees WHERE officeCode='4' AND jobTitle='Sales Rep';

-- Nomor 3
SELECT * FROM payments;
-- Mengecek `WHERE`-nya sebelum di-DELETE
SELECT * FROM payments WHERE amount < 10000;
-- Hapus jika `WHERE` sudah sesuai
DELETE FROM payments WHERE amount < 10000;
-- Cek apakah data yang sudah di update masuh ada atau tidak
SELECT * FROM payments WHERE amount < 10000;;