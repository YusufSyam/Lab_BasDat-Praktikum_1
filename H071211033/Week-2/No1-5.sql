-- No 1

SELECT * FROM offices WHERE city='san francisco';

-- No 2

SELECT * FROM orderdetails WHERE quantityordered >70 ORDER BY orderlinenumber ASC;

-- No 3

SELECT distinct productline FROM products WHERE quantityinstock != 0;

-- No 4

SELECT customernumber AS 'Nomor Pelanggan', customername AS 'Nama Pelanggan' 
from customers WHERE customernumber >= 100 and customernumber <= 150;

-- No 5

SELECT * FROM customers 
WHERE country != 'usa' AND creditlimit = 0 ORDER BY customername ASC LIMIT 9,10