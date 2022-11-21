#1. (database appseminar) Tampilkan nama, nama program studi, dan nim/nip
#	dari dosen dan mahasiswa Ilmu Komputer!
use appseminar;
select ss_mahasiswa.nama, ss_mahasiswa.nim, ss_prodi.nama as Prodi, "Mahasiswa" as Type 
from ss_mahasiswa
inner join ss_prodi
on ss_mahasiswa.id_prodi = ss_prodi.id_prodi
where ss_prodi.id_prodi = 'H07'
union
select ss_dosen.nama, ss_dosen.nip, ss_prodi.nama, "Dosen"
from ss_dosen
inner join ss_prodi
on ss_dosen.id_prodi = ss_prodi.id_prodi
where ss_prodi.id_prodi = 'H07';

#2. (database appseminar) Tampilkan nama, prodi, dan riwayat status yang
#	pernah dijalani (pembimbing utama, pertama, penguji 1, penguji 2) dari setiap
#	dosen, kemudian urutkan berdasarkan nama DESC.
select aa.nama, ss_prodi.nama as prodi, group_concat(RiwayatStatus) as 'Riwayat Status'
from 
(select ss_dosen.nama as nama, concat('Pembimbing Utama') as 'RiwayatStatus'
from ss_dosen
inner join ss_pembimbing
on ss_dosen.id_dosen = ss_pembimbing.id_pembimbing_utama
union
select ss_dosen.nama as nama, concat('Pembimbing Pertama') as 'RiwayatStatus'
from ss_dosen
inner join ss_pembimbing
on ss_dosen.id_dosen = ss_pembimbing.id_pembimbing_pertama
union
select ss_dosen.nama as nama, concat('Penguji 1') as 'RiwayatStatus'
from ss_dosen
inner join ss_penguji
on ss_dosen.id_dosen = ss_penguji.id_penguji_1
union
select ss_dosen.nama as nama, concat('Penguji 2') as 'RiwayatStatus'
from ss_dosen
inner join ss_penguji
on ss_dosen.id_dosen = ss_penguji.id_penguji_2) as aa
inner join ss_dosen
on ss_dosen.nama = aa.nama
inner join ss_prodi
on ss_dosen.id_prodi = ss_prodi.id_prodi
group by aa.nama
order by aa.nama desc;

#3. (classicmodels) buatlah query untuk menampilkan, kota apa yang paling
#	banyak karyawan atau pelanggan yang namanya diawali huruf L.
#	note (kota karyawan berdasarkan kota tempat dia bekerja)
select count(city) ss, city
from (select offices.city, concat(employees.firstName, ' ', employees.lastName) as nama
from employees 
inner join offices
on offices.officeCode = employees.officeCode
having nama like 'L%'
union
select customers.city, customers.customerName as nama 
from customers
where customerName like 'L%') as a
group by city
order by ss desc
limit 1;

