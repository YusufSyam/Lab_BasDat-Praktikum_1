use appseminar;

-- Nomor 3
SELECT m.nama 'Nama', d.nama 'Pembimbing Utama' FROM ss_mahasiswa m
JOIN ss_pembimbing p ON m.id_mahasiswa = p.id_mahasiswa
JOIN ss_dosen d ON p.id_pembimbing_utama = d.id_dosen
WHERE m.nama = 'Sulaeman'; 