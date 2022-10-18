-- Nomor 3
SELECT m.nama nama_mahasiswa, d.nama nama_dosen FROM ss_mahasiswa AS m 
INNER JOIN ss_pembimbing AS p 
ON p.id_mahasiswa = m.id_mahasiswa 
INNER JOIN ss_dosen AS d
ON p.id_pembimbing_utama = d.id_dosen 
WHERE m.nama="Sulaeman";
