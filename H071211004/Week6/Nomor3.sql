-- Nomor 3
SELECT UPPER(m.nama) nama_mahasiswa ,DAYNAME(tanggal) hari_seminar
FROM ss_seminar s
INNER JOIN ss_mahasiswa m
ON s.id_mahasiswa = m.id_mahasiswa
WHERE DAYNAME(tanggal) IN('Monday', 'Friday');
SELECT * FROM ss_seminar;
SELECT * FROM ss_mahasiswa;