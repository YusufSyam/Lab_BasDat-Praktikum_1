-- create database db_praktikum;
-- use db_praktikum;

-- create table buku(
-- id_buku INT unique auto_increment,
-- judul VARCHAR (225),
-- tahun_terbit INT,
-- pengarang VARCHAR (225),
-- primary key (id_buku)
-- );

-- desc buku;


-- create table mahasiswa(
-- id_mahasiswa bigint unsigned unique auto_increment,
-- nama varchar (225),
-- nim varchar (10) unique NOT NULL,
-- jk char (1),
-- primary key (id_mahasiswa)
-- );

-- desc mahasiswa;

-- create table pinjam(
-- id_pinjam int unsigned unique auto_increment,
-- tgl_pinjam datetime,
-- id_mahasiswa bigint unsigned unique,
-- id_buku int unique,
-- status_pengembalian tinyint (1),
-- primary key (id_pinjam),
-- foreign key(id_mahasiswa) references mahasiswa(id_mahasiswa),
-- foreign key (id_buku) references buku (id_buku)
-- );

-- desc pinjam;