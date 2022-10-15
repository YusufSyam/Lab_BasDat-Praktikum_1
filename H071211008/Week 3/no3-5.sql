#mengubah atribut tabel mahasiswa
-- alter table mahasiswa
-- modify no_telp varchar (20) not null,
-- modify email varchar (50) not null,
-- modify alamat varchar (100),
-- modify keterangan varchar (20); 

# 3. menambahkan data pada tabel mahasiswa
-- insert into mahasiswa (id_mahasiswa, nama, nim, jk, no_telp, email, alamat, keterangan)
-- value
-- (1, 'Besse Sahriyuni', 'H071211008', 'P', '081234567','bessesahriyuni@gmail.com', 'Jl. Tanjyng Raya', 'Semester 3'),
-- (2, 'Astrina Wulan Putri', 'H071211018', 'P', '09988765', 'astrinawulanputri@gmail.com', 'Jl. Perintis Kemerdekaan', 'Semester 3'),
-- (3, 'Muhammad Mukram Mustamin', 'H071211012', 'L', '098766798', 'muhmukrammustamin@gmail.com', 'Jl. Perintis Kemerdekaan', 'Semester 3'),
-- (4, 'Muhammad Al Fudhail', 'H071211033', 'L', '0990876555', 'muhalfudhail@gmail.com', 'Jl. Perintis Kemerdekaan', 'Semester 3'),
-- (5, 'Muhammad Reza Hasan', 'H071211010', 'L', '009887766', 'rezahasan@gmail.com', 'Jl. Sultan Alauddin', 'Semester 3'),
-- (6, 'Muhammad Arif', 'H071211004', 'L', '7452886482', 'muharif@gmail.com', 'Jl. Sultan Alauddin', 'Semester 3'),
-- (7, 'Fitrah Ramadhan', 'H071211017', 'L', '083937464', 'fitrarmd@gmail.com', 'Jl. Andi Tonro', 'Semester 3'),
-- (8, 'Asehpryanto Rari Parinding', 'H071211065', 'L', '7274918397', 'asehpryanto@gmail.com', 'Jl. Andi Tonro','Semester 3'),
-- (9, 'Muhammad Raihan ARADHANA', 'H071211075', 'L', '137878489', 'Raihan@gmail.com', 'Jl. Urip Sumarjo', 'Semester 3'),
-- (10, 'Andi Muh.Noval Fahresi B', 'H081211088', 'L', '67238344', 'andimuhnoval@gmail.com', 'Jl. UripSumarjo', 'Semester 3'),
-- (11, 'Hafiedz Hasmy Hamid', 'H071211085', 'L', '66284992724', 'hafiedz@gmail.com', 'Jl. Pendidikam', 'Semester 3'),
-- (12, 'Dewa Rescue Virgiawansyah', 'H071211072', 'L', '647872378317', 'dewa@gmail.com', 'Jl. Pendidikan', 'Semester 3');

# 4. Menambahkan 5 data pada tabel buku
-- insert into buku
-- values
-- (1, 'Sesuatu', null, 'Seseorang'),
-- (2, 'No Longer Human', 1948, 'Osamu Dazai'),
-- (3, 'The Singularity Is Near', 2008, 'Ray Warzwalski'),
-- (4, 'Crime and Punishment', 1866, 'Fyodor Dostoevsky'),
-- (5, 'Filosofi Teras', 2018, 'Hendry Manampiring');

# 5. Menambahkan 2 data. terdapat blank dan nilai null
insert into mahasiswa
value
(13, 'Adelia Puspita Hilal', 'H071211044', 'P', '882397479239', ' ','Antang', 'Semester 3'),
(14, 'Andi Maghfirah Inzani', 'H07121105', 'P', '9747278434', 'Fira@gmail.com', null, 'Semester 3');