# 3. Tampilkan pembimbing utama dari mahasiswa bernama sulaiman
-- use appseminar;
-- select ss_mahasiswa.nama as NamaMahasiswa, ss_dosen.nama as PembimbingUtama
-- from ss_mahasiswa
-- inner join ss_pembimbing
-- on ss_mahasiswa.id_mahasiswa = ss_pembimbing.id_mahasiswa
-- inner join ss_dosen
-- on ss_pembimbing.id_pembimbing_utama = ss_dosen.id_dosen
-- where ss_mahasiswa.nama = 'Sulaeman'