USE appseminar;

#Nomor1
#Tampilkan nama, nama program studi, dan nim/nip dari dosen dan mahasiswa Ilmu Komputer
SELECT ss_dosen.nama, ss_dosen.nip AS 'nip/nim', ss_prodi.nama AS 'nama prodi', 'Dosen' AS `Keterangan`
FROM ss_dosen 
JOIN ss_prodi
ON ss_dosen.id_prodi = ss_prodi.id_prodi
WHERE ss_prodi.nama = 'Ilmu Komputer'
UNION 
SELECT ss_mahasiswa.nama, ss_mahasiswa.nim, ss_prodi.nama, 'Mahasiswa'
FROM ss_mahasiswa 
JOIN ss_prodi
ON ss_mahasiswa.id_prodi = ss_prodi.id_prodi
WHERE ss_prodi.nama = 'Ilmu Komputer';

#Nomor 2
#Tampilkan nama, prodi, dan riwayat status yang pernah dijalani (pembimbing utama, pertama, penguji 1, penguji 2) 
#dari setiap dosen, kemudian urutkan berdasarkan nama DESC.
SELECT `Nama Dosen`, `Nama Prodi`, GROUP_CONCAT(stat) AS `Riwayat Status`
FROM 
	(SELECT DISTINCT ss_dosen.nama AS `Nama Dosen`, ss_prodi.nama AS `Nama Prodi`, 
		(SELECT 'Penguji 1' WHERE ss_penguji.id_penguji_1 = ss_dosen.id_dosen) AS stat
	FROM ss_dosen LEFT JOIN ss_prodi USING(id_prodi), ss_penguji
	UNION 
	SELECT DISTINCT ss_dosen.nama AS `Nama Dosen`, ss_prodi.nama AS `Nama Prodi`,
		(SELECT 'Penguji 2' WHERE ss_penguji.id_penguji_2 = ss_dosen.id_dosen) AS stat
	FROM ss_dosen LEFT JOIN ss_prodi USING(id_prodi), ss_penguji
	UNION 
	SELECT DISTINCT ss_dosen.nama AS `Nama Dosen`, ss_prodi.nama AS `Nama Prodi`,
		(SELECT 'Penguji 3' WHERE ss_penguji.id_penguji_3 = ss_dosen.id_dosen) AS stat
	FROM ss_dosen LEFT JOIN ss_prodi USING(id_prodi), ss_penguji
	UNION 
	SELECT DISTINCT ss_dosen.nama AS `Nama Dosen`, ss_prodi.nama AS `Nama Prodi`,
		(SELECT 'Pembimbing Utama' WHERE ss_pembimbing.id_pembimbing_utama = ss_dosen.id_dosen) AS stat
	FROM ss_dosen LEFT JOIN ss_prodi USING(id_prodi), ss_pembimbing
	UNION 
	SELECT DISTINCT ss_dosen.nama AS `Nama Dosen`, ss_prodi.nama AS `Nama Prodi`,
		(SELECT 'Pembimbing Pertama' WHERE ss_pembimbing.id_pembimbing_pertama = ss_dosen.id_dosen) AS stat
	FROM ss_dosen LEFT JOIN ss_prodi USING(id_prodi), ss_pembimbing
	UNION 
	SELECT DISTINCT ss_dosen.nama AS `Nama Dosen`, ss_prodi.nama as `Nama Prodi`,
		(SELECT 'Pembimbing Kedua' WHERE ss_pembimbing.id_pembimbing_kedua = ss_dosen.id_dosen) AS stat
	FROM ss_dosen LEFT JOIN ss_prodi USING(id_prodi), ss_pembimbing) AS riwayat
GROUP BY `Nama Dosen`
HAVING `Riwayat Status` IS NOT NULL 
ORDER BY `Nama Dosen` DESC;

#Nomor 3
USE classicmodels;
#Buatlah query untuk menampilkan, kota apa yang paling banyak karyawan atau pelanggan yang namanya diawali huruf L.
#note (kota karyawan berdasarkan kota tempat dia bekerja)
SELECT A.firstName, city, COUNT(A.firstName)
FROM 
	(SELECT employees.firstName, offices.city FROM employees 
	JOIN offices
	ON employees.officeCode = offices.officeCode 
	WHERE employees.firstName LIKE 'L%'
	UNION 
	SELECT customerName, city 
	FROM customers
	WHERE customerName LIKE 'L%') AS A
GROUP BY city
ORDER BY COUNT(city) DESC LIMIT 3;