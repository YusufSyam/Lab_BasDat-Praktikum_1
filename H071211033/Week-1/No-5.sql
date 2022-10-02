-- no 5
CREATE DATABASE db_praktikum;

CREATE TABLE pinjam(
	tgl_pinjam DATETIME,
	id_mahasiswa BIGINT UNSIGNED,
	id_buku INT,
	status_pengembalian TINYINT(1) DEFAULT'0',
	id_pinjam INT UNSIGNED AUTO_INCREMENT,
	PRIMARY KEY(id_pinjam),
	CONSTRAINT fk_pinjam_buku FOREIGN KEY(id_buku) REFERENCES buku(id_buku),
	CONSTRAINT fk_pinjam_mahasiswa FOREIGN KEY(id_mahasiswa) REFERENCES mahasiswa(id_mahasiswa)
);

CREATE TABLE buku(
	judul VARCHAR(225) NOT NULL,
	tahun_terbit INT NOT NULL,
	pengarang VARCHAR(225) NOT NULL,
	id_buku INT AUTO_INCREMENT,
	PRIMARY KEY(id_buku)
);

CREATE TABLE mahasiswa(
	nama VARCHAR(255) NOT NULL,
	nim VARCHAR(10) NOT NULL,
	jk CHAR(1) NOT NULL,
	id_mahasiswa BIGINT UNSIGNED AUTO_INCREMENT,
	PRIMARY KEY(id_mahasiswa),
	UNIQUE(nim)
)