-- Active: 1667760124683@@127.0.0.1@3306@appseminar
USE appseminar;

-- Nomor 1
SELECT m.`Nama`, p.`nama` AS `Nama Prodi`, m.`nim`, 'MAHASISWA' AS `Status` FROM ss_mahasiswa m
INNER JOIN ss_prodi p USING (id_prodi)
WHERE p.nama = "Ilmu Komputer"
UNION
SELECT d.`Nama`, p.`nama` AS `Nama Prodi`, d.`nip`, 'PEGAWAI' FROM ss_dosen d 
INNER JOIN ss_prodi p USING (id_prodi)
WHERE p.nama = "Ilmu Komputer";

-- Nomor 2
SELECT tabel_dosen.nama, sprod.nama, GROUP_CONCAT(`Status` ORDER BY `Status` DESC) AS `Riwayat Status` -- Menampilkan data dari tabel baru yang telah dibuat
FROM
( -- Membuat tabel baaru yang berisi id dosen, nama dosen dan statusnya
SELECT sd1.id_dosen, sd1.nama, 'Pembimbing Utama' AS `Status` 
FROM ss_dosen sd1
JOIN ss_pembimbing spem1 ON sd1.id_dosen = spem1.id_pembimbing_utama
UNION
SELECT sd2.id_dosen, sd2.nama, 'Pembimbing Pertama' AS `Status` 
FROM ss_dosen sd2
JOIN ss_pembimbing spem2 ON sd2.id_dosen = spem2.id_pembimbing_pertama
UNION
SELECT sd3.id_dosen, sd3.nama, 'Penguji 1' AS `Status` 
FROM ss_dosen sd3
JOIN ss_penguji speng3 ON sd3.id_dosen = speng3.id_penguji_1
UNION
SELECT sd4.id_dosen, sd4.nama, 'Penguji 2' AS `Status` 
FROM ss_dosen sd4
JOIN ss_penguji speng4 ON sd4.id_dosen = speng4.id_penguji_2
) AS `tabel_dosen`
JOIN ss_dosen sd ON tabel_dosen.id_dosen = sd.id_dosen
LEFT JOIN ss_prodi sprod ON sd.id_prodi = sprod.id_prodi
GROUP BY tabel_dosen.nama
ORDER BY tabel_dosen.nama DESC;