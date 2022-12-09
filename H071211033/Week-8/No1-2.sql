use appseminar;
-- -------------- No 1 --------------
SELECT m.nama, p.nama, m.nim
from ss_mahasiswa m
join ss_prodi p
on m.id_prodi = p.nama
WHERE m.id_prodi = 'H07'
union
SELECT d.nama, p.nama, d.nip
from ss_dosen d
JOIN ss_prodi p
on d.id_prodi = p.id_prodi
WHERE d.id_prodi = 'H07'
;
-- -------------- No 2 --------------
select t.nama AS Nama, ss_prodi.nama as Prodi, group_concat(riwayatStatus separator', ') as "Riwayat Status"
from 
(select ss_dosen.nama as nama, 'Pembimbing Utama' as 'riwayatStatus'
from ss_dosen
inner join ss_pembimbing
on ss_dosen.id_dosen = ss_pembimbing.id_pembimbing_utama
union
select ss_dosen.nama as nama, 'Pembimbing Pertama' as 'riwayatStatus'
from ss_dosen
inner join ss_pembimbing
on ss_dosen.id_dosen = ss_pembimbing.id_pembimbing_pertama
union
select ss_dosen.nama as nama, 'Penguji 1' as 'riwayatStatus'
from ss_dosen
inner join ss_penguji
on ss_dosen.id_dosen = ss_penguji.id_penguji_1
union
select ss_dosen.nama as nama, 'Penguji 2' as 'riwayatStatus'
from ss_dosen
inner join ss_penguji
on ss_dosen.id_dosen = ss_penguji.id_penguji_2) AS t
inner join ss_dosen
on ss_dosen.nama = t.nama
inner join ss_prodi
on ss_dosen.id_prodi = ss_prodi.id_prodi
group by t.nama
order by t.nama DESC
;
