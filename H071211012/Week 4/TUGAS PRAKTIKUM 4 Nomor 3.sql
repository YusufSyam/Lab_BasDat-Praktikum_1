-- nomor 3
USE appseminar;

-- Perintah ini digunakan untuk mengecek tabel mana yang saling terhubung agar dapat dihubungkan untuk mencari data
SHOW CREATE TABLE ss_dosen;
SHOW CREATE TABLE ss_mahasiswa;
SHOW CREATE TABLE ss_pembimbing;

-- Menampilkan mahasiswa bernama `Sulaeman` dan nama dosen pembimbing utamanya
SELECT d.nama, mhs.nama FROM ss_dosen AS d
INNER JOIN ss_pembimbing AS pmb ON d.id_dosen = pmb.id_pembimbing_utama
INNER JOIN ss_mahasiswa AS mhs ON pmb.id_mahasiswa = mhs.id_mahasiswa
WHERE mhs.nama = "Sulaeman";
