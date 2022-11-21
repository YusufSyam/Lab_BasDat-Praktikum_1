USE appseminar;

#no.1
#tampilkan nama, nama program studi, dan nim/nip dari dosen dan mahasiswa ilmu komputer
SELECT ss_mahasiswa.nama, ss_mahasiswa.nim AS 'Nim/Nip', ss_prodi.nama AS 'Prodi', 'Mahasiswa' AS 'Type'
FROM ss_mahasiswa
INNER JOIN ss_prodi
ON ss_mahasiswa.id_prodi = ss_prodi.id_prodi
WHERE ss_prodi.nama = 'Ilmu Komputer'
UNION 
SELECT ss_dosen.nama, ss_dosen.nip, ss_prodi.nama, 'Dosen'
FROM ss_dosen
INNER JOIN ss_prodi
ON ss_dosen.id_prodi = ss_prodi.id_prodi
WHERE ss_prodi.nama = 'Ilmu Komputer' ;

#no.2
#tampilkan nama, prodi, dan riwayat status yang pernah dijalani
#(pembimbing utama, pem.pertama, penguji 1, penguji 2) dari setiap dosen
#kemudian diurutkan berdasrkan nama DESC
SELECT dosen.nama, ss_prodi.nama AS 'Prodi', GROUP_CONCAT(RiwayatStatus) AS 'Riwayat Status'
FROM (SELECT ss_dosen.nama AS 'Nama', CONCAT('Pembimbing Utama') AS 'RiwayatStatus'
		FROM ss_dosen
		INNER JOIN ss_pembimbing
		ON ss_dosen.id_dosen = ss_pembimbing.id_pembimbing_utama
		UNION 
		SELECT ss_dosen.nama AS 'Nama', CONCAT('Pembimbing Pertama') AS 'RiwayatStatus'
		FROM ss_dosen
		INNER JOIN ss_pembimbing
		ON ss_dosen.id_dosen = ss_pembimbing.id_pembimbing_pertama
		UNION 
		SELECT ss_dosen.nama AS 'Nama', CONCAT('Penguji 1') AS 'RiwayatStatus'
		FROM ss_dosen
		INNER JOIN ss_penguji
		ON ss_dosen.id_dosen = ss_penguji.id_penguji_1
		UNION 
		SELECT ss_dosen.nama AS 'Nama', CONCAT('Penguji 2') AS 'RiwayatStatus'
		FROM ss_dosen
		INNER JOIN ss_penguji
		ON ss_dosen.id_dosen = ss_penguji.id_penguji_2) AS dosen
INNER JOIN ss_dosen
ON ss_dosen.nama = dosen.nama
INNER JOIN ss_prodi
ON ss_dosen.id_prodi = ss_prodi.id_prodi
GROUP BY dosen.nama
ORDER BY dosen.nama DESC;



	

	