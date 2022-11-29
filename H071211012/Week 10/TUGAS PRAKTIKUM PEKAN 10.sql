-- Active: 1667760124683@@127.0.0.1@3306@classicmodels
USE classicmodels;

SELECT t1.`Nama`,
CASE
    WHEN t1.`Total` > 0 THEN 'You Are Save'
    WHEN t1.`Total` < 0 THEN 'You Are in Debt'
    WHEN t1.`Total` = 0 THEN'You are Running Out of credits'
    END 
    AS `Status`,
t1.`Total`
FROM
(
    SELECT 
    c.`customerName` `Nama`, 
    (c.`creditLimit` - SUM(od.`quantityOrdered` * od.`priceEach`)) AS `Total`
    FROM customers c
    JOIN orders o ON c.`customerNumber` = o.`customerNumber`
    RIGHT JOIN orderdetails od ON o.`orderNumber` = od.`orderNumber`
    GROUP BY c.`customerNumber`) t1;