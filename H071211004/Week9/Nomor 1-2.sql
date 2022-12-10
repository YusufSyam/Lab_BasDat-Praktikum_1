/*
SET autocommit=0;
-- NOMOR 1
START TRANSACTION;
SELECT @maxOrderNumber:=MAX(orderNumber)+1 FROM orderdetails;

INSERT INTO `orders`(`orderNumber`, `orderDate`, `requiredDate`, 
`shippedDate`, `status`, `comments`, `customerNumber`) 
VALUES (@maxOrderNumber,'2003-01-06','2003-01-06',
'2003-01-06','Shipped','Its good',141);

INSERT INTO `orderdetails`(`orderNumber`, `productCode`, `quantityOrdered`, `priceEach`, `orderLineNumber`) 
VALUES (@maxOrderNumber,'S18_4409', 50 ,75.46,4);

SELECT @maxOrderNumber:=MAX(orderNumber)+1 FROM orderdetails;

INSERT INTO `orders`(`orderNumber`, `orderDate`, `requiredDate`, 
`shippedDate`, `status`, `comments`, `customerNumber`) 
VALUES (@maxOrderNumber,'2003-01-06','2003-01-06',
'2003-01-06','Shipped','Its good',141);

INSERT INTO `orderdetails`(`orderNumber`, `productCode`, `quantityOrdered`, `priceEach`, `orderLineNumber`) 
VALUES (@maxOrderNumber,'S18_4409', 50 ,75.46,4);

SELECT @maxOrderNumber:=MAX(orderNumber)+1 FROM orderdetails;

INSERT INTO `orders`(`orderNumber`, `orderDate`, `requiredDate`, 
`shippedDate`, `status`, `comments`, `customerNumber`) 
VALUES (@maxOrderNumber,'2003-01-06','2003-01-06',
'2003-01-06','Shipped','Its good',141);

INSERT INTO `orderdetails`(`orderNumber`, `productCode`, `quantityOrdered`, `priceEach`, `orderLineNumber`) 
VALUES (@maxOrderNumber,'S18_4409', 50 ,75.46,4);

COMMIT;
*/
-- Nomor 2
/*
START TRANSACTION;
SET FOREIGN_KEY_CHECKS=0;
DELETE FROM `orders`;
SET FOREIGN_KEY_CHECKS=1;
ROLLBACK;
SELECT * FROM orders;
*/