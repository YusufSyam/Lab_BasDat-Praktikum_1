#nomor 5

#CREATE DATABASE DB_PRAKTIKUM

USE DB_PRAKTIKUM;

CREATE TABLE buku (
	judul VARCHAR (255) ,
	tahun_terbit INT ,
	pengarang VARCHAR (255) ,
	id_buku INT AUTO_INCREMENT,
    primary key (id_buku)
	);
DESC BUKU;

CREATE TABLE mahasiswa (
	nama VARCHAR (255) ,
    id_mahasiswa BIGINT UNSIGNED primary key AUTO_INCREMENT ,
    nim VARCHAR (10) NOT NULL,
    jk CHAR (1) ,
    unique (nim)
    );
DESC mahasiswa ;

CREATE TABLE pinjam (
	tgl_pinjam DATETIME ,
    id_mahasiswa BIGINT UNSIGNED AUTO_INCREMENT,
    id_buku INT ,
    status_pengembalian TINYINT (1) DEFAULT 0 ,
    id_pinjam INT UNSIGNED , 
    foreign key (id_mahasiswa) references mahasiswa (id_mahasiswa),
    foreign key (id_buku) references buku (id_buku)
);
DESC pinjam;


    
    
    
    
	





