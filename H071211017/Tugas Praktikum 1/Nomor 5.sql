-- Nomor 5

CREATE DATABASE db_praktikum;

USE db_praktikum;

CREATE TABLE buku(
	id_buku INT NOT NULL	PRIMARY KEY,
	judul VARCHAR(255),
	tahun_terbit INT,
	pengarang VARCHAR(255)
);
CREATE TABLE mahasiswa(
	id_mahasiswa BIGINT NOT NULL PRIMARY KEY,
	nama VARCHAR(255),
	nim VARCHAR(10) UNIQUE,
	jk CHAR(1)
);
CREATE TABLE pinjam(
	id_pinjam INT NOT NULL PRIMARY KEY,
	tgl_pinjam DATETIME,
	id_mahasiswa BIGINT,
	id_buku INT,
	status_pengembalian TINYINT(1) DEFAULT 0,
	FOREIGN KEY (id_mahasiswa) REFERENCES mahasiswa (id_mahasiswa),
	FOREIGN KEY (id_buku) REFERENCES buku (id_buku)
);