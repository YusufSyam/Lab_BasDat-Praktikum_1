-- CREATE DATABASE tugas1;

-- soal 1
-- USE tugas1;
-- 
-- CREATE TABLE offices (
-- 	officeCode VARCHAR(10) NOT NULL,
-- 	city VARCHAR(50) NOT NULL,
-- 	phone VARCHAR(50) NOT NULL,
-- 	addresline1 VARCHAR(50) NOT NULL,
-- 	addresline2 VARCHAR(50),
-- 	state VARCHAR(50),
-- 	country VARCHAR(50) NOT NULL,
-- 	PRIMARY KEY (officeCode)
-- );	

-- ALTER TABLE offices
-- MODIFY phone INT(20) NOT NULL;

-- ALTER TABLE offices
-- DROP addresline2;

-- DESC offices

-- soal 2 
-- USE db_praktikum;
-- 
-- CREATE TABLE buku (
-- 	judul VARCHAR(255),
-- 	'tahun terbit' INT,
-- 	pengarang VARCHAR(255),
-- 	id_buku INT AUTO_INCREMENT PRIMARY KEY
-- );
-- 
-- CREATE TABLE mahasiswa (
-- 	id_mahasiswa BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
-- 	nama VARCHAR(255),
-- 	nim VARCHAR(10) NOT NULL UNIQUE,
-- 	jk CHAR(1)
-- );
-- 
-- 
-- CREATE TABLE pinjam (
-- 	id_pinjam INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
-- 	tgl_pinjam DATETIME,
-- 	id_mahasiswa BIGINT UNSIGNED,
-- 	id_buku INT,
-- 	status_pengembalian TINYINT(1) DEFAULT 0,
-- 	FOREIGN KEY (id_mahasiswa) REFERENCES mahasiswa (id_mahasiswa),
-- 	FOREIGN KEY (id_buku) REFERENCES buku (id_buku)
-- );
-- 
-- DESC buku;
-- DESC mahasiswa;
-- DESC pinjam;