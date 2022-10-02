-- Nomor 5
/* CREATE TABLE buku (
	judul varchar(255),
	tahun_terbit int,
	pengarang varchar(255),
	id_buku int PRIMARY KEY AUTO_INCREMENT
)

CREATE TABLE pinjam (
    nama varchar(255),
    nim varchar(10) UNIQUE,
    jk char(1),
    id_buku bigint unsigned AUTO_INCREMENT PRIMARY KEY
)

CREATE TABLE pinjam (
    tgl_pinjam datetime,
    id_mahasiswa bigint unsigned NOT NULL,
    id_buku int NOT NULL,
    FOREIGN KEY (id_mahasiswa) REFERENCES mahasiswa(id_mahasiswa),
    FOREIGN KEY (id_buku) REFERENCES buku(id_buku),
    id_pinjam int unsigned AUTO_INCREMENT PRIMARY KEY
) */