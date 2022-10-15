USE db_praktikum;

-- ALTER TABLE mahasiswa
-- ADD No_telp VARCHAR(20) NOT NULL;
-- ADD Alamat VARCHAR(100);
-- ADD Email VARCHAR(50) NOT NULL;
-- ADD Keterangan VARCHAR(20);
 
-- DELETE FROM pinjam WHERE id_buku='1';

-- Soal 3
-- SELECT * FROM mahasiswa;
-- INSERT INTO mahasiswa (nama, nim, jk, No_telp, Alamat, Email, Keterangan)
-- VALUE
-- (17, 'Reza Hasan', 'H071211010', 'L', '+1-729-333-2022', 'Jln.Pandang Raya, Compleks Chrysant','jonesazarya123@gmail.com','Semester 3')
-- ,(18, 'Dhiyaa Unnisa','H071211079','P','0887435587359', 'Jl Andi Nurdin Sanrima No 80/54, Maros','unnisadhiyaa25@gmail.com','Semester 3')
-- ,(19, 'Isra Nirwana Nur', 'H071211036', 'P','082147121111', 'Jl. Veteran Utara', 'isranirwana2409@gmail.com', 'Semester 3')
-- ,(20, 'Arjuna Ribal','H071211032','L','082187482003', 'Jl. Telkom 5, Blok C2, No. 132, Taman Telkomas','arjuna.ribal@gmail.com', 'Semester 3')
-- ,(21, 'Muhammad Erwin Arif','H071211059','L','081254498373','Jl Manyampa, Desa Bontoala Kec Pallanga','muherwinarif31@gmail.com','Semester 3')
-- ,(22, 'Muchtar Adam','H071211040','L','0895398304141','Jl Yusuf Bauti Blok C/27, Gowa','muchtaradamm2002@gmail.com','Semester 3')
-- ,(23, 'Andi Raja Zulfaqar','H071211057','L','089503906266','Jl Bandang','andiraja@gmail.com','Semester 3')
-- ,(24, 'Nur Aisyah S.','H071211054','P','085256223076','Ramsis Unhas','aisyahsahar03@gmail.com','Semester 3')
-- ,(25, 'Firmansyah','H071211070','L','085931042162','Pinrang','frmnsyah33@gmail.com', 'Semester 3')
-- ,(26, 'Michiko Tjiang', 'H071211013', 'P', '0823-3536-8793', 'Jln.Batua Raya', 'michiko.tjiang14@gmail.com', 'Semester 3')
-- ,('Edgar Silvanus', 'H071211026', 'L', '08881223', 'Antang', 'edgarsilvanus.yahoo.com', 'Semester 3')
-- ,('Shofwan', 'H07120090', 'L', '085321323', 'Unhas', 'shofwan@gmail.com' , 'Semester 5');


-- Soal 4
-- SELECT * FROM buku;
-- INSERT INTO buku
-- VALUE ('001','Garis Waktu', '2016', 'Fiersa Besari')
-- ,('002', 'Marmut Merah Jambu', '2010', 'Raditya Dika')
-- ,('003', 'Ngenest', '2013', 'Ernest Prakasa')
-- ,('004', 'Bumi', '2014', 'Tere Liye')
-- ,('005', 'Ayah', '2015', 'Andrea Hirata');

-- SELECT * FROM pinjam;
-- INSERT INTO pinjam
-- VALUE ('006', '2023-02-04', '17', '001', '1')
-- ,('007', '2023-01-28', '18', '002', '1')
-- ,('008', '2023-03-07', '19', '003', '0')
-- ,('009', '2023-01-15', '20', '004', '1')
-- ,('010', '2023-11-19', '21', '005', '0');
-- 
-- Soal 5
--  SELECT * FROM mahasiswa;
-- INSERT INTO mahasiswa
-- VALUE (98, '', 'H071211098', 'P', '(207) 846-7653', '812 Fay Roads Apt. 052', 'sunny.rath@hotmail.com', NULL)
-- ,99, 'Data Baru', 'H071211099', 'L', '1-224-616-1963 x21337', '6847 Yost Roads', 'charlene.kreiger@hotmail.com', NULL);

-- INSERT INTO mahasiswa (nama, nim, jk, No_telp, Email, Keterangan)
-- VALUE ('Hasan', 'H07121081', 'L', '085321323', 'shofwan@gmail.com' , 'Semester 5');
-- SELECT * FROM mahasiswa;

