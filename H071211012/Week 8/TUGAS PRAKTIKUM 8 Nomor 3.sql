USE classicmodels;

-- Nomor 3
-- Menampilkan data yang diperlukan dari tabel baru yang telah dibuat
SELECT 
new_tabel.city `Kota`,
COUNT(new_tabel.Nama) `Jumlah orang`
FROM
( -- Membuat tabel baru yang berisi kota dan nama customer atau pegawai yang namanya diawali huruf L
SELECT c.city, c.customerName `Nama`
FROM customers c
WHERE c.customerName LIKE 'L%'
UNION
SELECT o.city, CONCAT(e.firstName, ' ', e.lastName) `Nama`
FROM employees e
INNER JOIN offices o ON e.officeCode = o.officeCode
HAVING `Nama` LIKE 'L%'
) `new_tabel`
GROUP BY `Kota`
ORDER BY `Jumlah Orang` DESC 
LIMIT 1;