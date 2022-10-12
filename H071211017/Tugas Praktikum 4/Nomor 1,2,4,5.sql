use classicmodels;

--------------------------------------------------------------------------------------------------------------

-- Nomor 1
SELECT od.orderNumber, o.orderDate, p.productName
FROM orders AS o
JOIN orderdetails AS od
ON o.orderNumber = od.orderNumber
JOIN products as p
ON p.productCode = od.productCode
WHERE p.productName = "1940 Ford Pickup Truck" ORDER BY orderDate DESC;

--------------------------------------------------------------------------------------------------------------

-- Nomor 2
SELECT od.orderNumber 'No.', p.productName 'Produk', od.priceEach 'Harga', p.MSRP 'HET', p.MSRP*0.8 '80% HET'
FROM orderdetails AS od
JOIN products AS p
ON od.productCode = p.productCode
WHERE od.priceEach < (p.MSRP*0.8);

--------------------------------------------------------------------------------------------------------------

-- Nomor 4

-- Menambah kolom status
ALTER TABLE customers
ADD status VARCHAR(32)
AFTER creditLimit;

-- Mereset nilai kolom status
-- UPDATE customers AS c
-- SET c.status = NULL;

-- Update status VIP (amount>100000)
UPDATE customers AS c
JOIN payments AS p
ON c.customerNumber = p.customerNumber
SET c.status = 'VIP' 
WHERE p.amount > 100000;

-- Update status VIP (quantity>=50)
UPDATE customers c JOIN (
    SELECT c.customerName, c.customerNumber, tq2
    FROM customers c LEFT JOIN (
        SELECT o.customerNumber, SUM(dt.tq) tq2
        FROM orders o JOIN (
            SELECT od.orderNumber, SUM(od.quantityOrdered) tq
            FROM orderdetails od 
            GROUP BY od.orderNumber) dt
        ON o.orderNumber = dt.orderNumber
        GROUP BY o.customerNumber) dt2
    ON c.customerNumber = dt2.customerNumber) ft
ON c.customerNumber = ft.customerNumber
SET c.status = 'VIP' 
WHERE ft.tq2 >= 50;

-- Update status Regular
UPDATE customers c 
SET c.status = 'Regular'
WHERE c.status IS NULL;


-- Cek data
-- SELECT * FROM (
--     SELECT c.customerName, c.customerNumber, tq2
--     FROM customers c LEFT JOIN (
--         SELECT o.customerNumber, SUM(dt.tq) tq2
--         FROM orders o JOIN (
--             SELECT od.orderNumber, SUM(od.quantityOrdered) tq
--             FROM orderdetails od 
--             GROUP BY od.orderNumber) dt
--         ON o.orderNumber = dt.orderNumber
--         GROUP BY o.customerNumber) dt2
--     ON c.customerNumber = dt2.customerNumber) ft
-- WHERE ft.tq2 >= 50;


-- Total kuantitas / OrderNumber
-- SELECT od.orderNumber, SUM(od.quantityOrdered) 'Total Quantity'
-- FROM orderdetails od
-- GROUP BY od.orderNumber;

-- Total kuantitas / customerNumber
-- SELECT o.customerNumber, SUM(dt.tq) 'Total Quantity'
-- FROM orders o JOIN
--     (SELECT od.orderNumber, SUM(od.quantityOrdered) tq
--     FROM orderdetails od 
--     GROUP BY od.orderNumber) dt
-- ON o.orderNumber = dt.orderNumber
-- GROUP BY o.customerNumber;

-- JOIN tabel total kuantitas dan tabel customers (Final table)
-- SELECT c.customerName, c.customerNumber, tq2
-- FROM customers c LEFT JOIN
--     (SELECT o.customerNumber, SUM(dt.tq) tq2
--     FROM orders o JOIN
--         (SELECT od.orderNumber, SUM(od.quantityOrdered) tq
--         FROM orderdetails od 
--         GROUP BY od.orderNumber) dt
--         ON o.orderNumber = dt.orderNumber
--     GROUP BY o.customerNumber) dt2
-- ON c.customerNumber = dt2.customerNumber;

--------------------------------------------------------------------------------------------------------------

-- Nomor 5

-- Hapus constraint
ALTER TABLE orders   
DROP CONSTRAINT orders_ibfk_1;
ALTER TABLE payments   
DROP CONSTRAINT payments_ibfk_1;

-- Menghapus data
DELETE c FROM customers c
JOIN orders o ON c.customerNumber = o.customerNumber
WHERE o.status = 'Cancelled';

-- Cek data yang berelasi (Cancelled)
-- SELECT * from customers
-- join orders on customers.customerNumber = orders.customerNumber
-- WHERE orders.status = 'Cancelled';