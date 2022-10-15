-- ----------- No 3 ---------------------

SELECT m.nama, d.nama
FROM ss_mahasiswa m
JOIN ss_pembimbing p
ON m.id_mahasiswa = p.id_mahasiswa
JOIN ss_dosen d
ON d.id_dosen = p.id_pembimbing_utama
WHERE m.id_mahasiswa=288;