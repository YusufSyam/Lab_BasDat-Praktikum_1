/* Nomor 1 */
-- SELECT * FROM offices WHERE city='San Francisco';

/* Nomor 2 */
-- SELECT * FROM orderdetails WHERE quantityOrdered > 70 ORDER BY orderLineNumber;

/* Nomor 3 */
-- SELECT DISTINCT productLine FROM products;

/* Nomor 4 */
-- SELECT customerNumber 'Number', customerName 'Nama' FROM customers LIMIT 99, 50;

/* Nomor 5 */
-- SELECT * FROM customers WHERE Country!='USA' AND creditLimit='0' ORDER BY customerName LIMIT 9, 10;
