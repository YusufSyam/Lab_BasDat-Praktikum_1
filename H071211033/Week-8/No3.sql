use classicmodels;
-- -------------- No 3 --------------
SELECT COUNT(city), city FROM (
SELECT ofc.city, CONCAT(em.firstName, '', em.lastName) AS 'Nama'
FROM employees em
INNER JOIN offices ofc
ON ofc.officeCode = em.officeCode
HAVING Nama like 'L%'
UNION
SELECT c.city, c.customerName AS 'Nama' FROM customers c WHERE LEFT(c.customerName, 1) = 'L') as m
GROUP BY city
ORDER BY COUNT(city) DESC LIMIT 1;