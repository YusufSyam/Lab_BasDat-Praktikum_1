-- Nomor 1
/*
use appseminar;
SELECT ds.nip 'NIM/NIP', ds.nama, pr.nama 'Prodi' FROM ss_dosen ds
INNER JOIN ss_prodi pr
ON ds.id_prodi = pr.id_prodi
WHERE pr.nama = 'Ilmu Komputer'
UNION
SELECT ms.nim, ms.nama, ms.nama FROM ss_mahasiswa ms 
INNER JOIN ss_prodi pr
ON pr.id_prodi = ms.id_prodi
WHERE pr.nama = 'Ilmu Komputer';

-- Nomor 2

SELECT test.nama, pr.nama, GROUP_CONCAT(Riwayat_Status, ' ; ') FROM
(SELECT ds.nama 'nama', 
CONCAT('Pembimbing utama') AS 'Riwayat_Status'
FROM ss_dosen ds
INNER JOIN ss_pembimbing pm
ON ds.id_dosen = pm.id_pembimbing_utama
UNION
SELECT ds.nama 'nama', 
CONCAT('Pembimbing pertama') AS 'Riwayat_Status'
FROM ss_dosen ds
INNER JOIN ss_pembimbing pm
ON ds.id_dosen = pm.id_pembimbing_pertama
UNION
SELECT ds.nama 'nama', 
CONCAT('Penguji 1') AS 'Riwayat_Status'
FROM ss_dosen ds
INNER JOIN ss_penguji pn
ON ds.id_dosen = pn.id_penguji_1
UNION
SELECT ds.nama 'nama', 
CONCAT('Penguji 2') AS 'Riwayat_Status'
FROM ss_dosen ds
INNER JOIN ss_penguji pn
ON ds.id_dosen = pn.id_penguji_2) AS test
INNER JOIN ss_dosen ds
ON ds.nama = test.nama
INNER JOIN ss_prodi pr
ON pr.id_prodi = ds.id_prodi
GROUP BY test.nama
ORDER BY test.nama DESC;

-- Nomor 3
use classicmodels;

SELECT COUNT(city), city FROM (
SELECT ofc.city ,CONCAT(em.firstName, ' ', em.lastName) AS 'Nama'
FROM employees em
INNER JOIN offices ofc
ON ofc.officeCode = em.officeCode
HAVING LEFT(Nama, 1) = 'L'
UNION
SELECT c.city, c.customerName AS 'Nama' FROM customers c WHERE LEFT(c.customerName, 1) = 'L') AS test
GROUP BY city
ORDER BY COUNT(city) DESC LIMIT 1;
*/