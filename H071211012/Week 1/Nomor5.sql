CREATE DATABASE  db_praktikum;
USE db_praktikum;

CREATE TABLE buku(
id_buku INT AUTO_INCREMENT,
judul VARCHAR(255),
tahun_terbit INT,
pengarang VARCHAR(255),
PRIMARY KEY (id_buku));


CREATE TABLE mahasiswa(
id_mahasiswa BIGINT UNSIGNED AUTO_INCREMENT,
nama VARCHAR(255),
nim VARCHAR(10) NOT NULL,
jk CHAR(1),
PRIMARY KEY (id_mahasiswa),
UNIQUE (nim));

CREATE TABLE pinjam(
id_pinjam INT UNSIGNED AUTO_INCREMENT,
tgl_pinjam DATETIME,
status_pengembalian TINYINT(1) DEFAULT 0,
id_mahasiswa BIGINT UNSIGNED,
id_buku INT,
PRIMARY KEY (id_pinjam),
CONSTRAINT pinjam_mahasiswa FOREIGN KEY (id_mahasiswa) REFERENCES mahasiswa(id_mahasiswa),
CONSTRAINT pinjam_buku FOREIGN KEY (id_buku) REFERENCES buku(id_buku));

DESC buku;
DESC mahasiswa;
DESC pinjam;