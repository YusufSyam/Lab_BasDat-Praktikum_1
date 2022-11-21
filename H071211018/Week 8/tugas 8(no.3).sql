USE classicmodels;

#no.3
#tampilkan kota apa yang paling banyak karyawan atau pelanggan yang namanya diawali huruf L
#note(kota karyawan berdasarkan kota tempat dia bekerja) 
SELECT COUNT(city) AS 'Jumlah', city AS 'Kota'
FROM (SELECT o.city, CONCAT(e.firstName, ' ', e.lastName) AS 'Nama'
		FROM employees AS e
		INNER JOIN offices AS o
		ON o.officeCode = e.officeCode
		HAVING nama LIKE 'L%' 
		UNION
		SELECT c.city, c.customerName AS 'Nama' 
		FROM customers AS c 
		WHERE c.customerName LIKE 'L%') as nama
GROUP BY city
ORDER BY COUNT(city) DESC LIMIT 1;