-- Active: 1665132094564@@127.0.0.1@3306@classicmodels
set autocommit = 0;
-- ------------- No 1 -------------
begin work;
INSERT into orders
value (10426, '2022-11-22', '2022-11-23', NULL, 'In Process', null, 157)
;
INSERT into orders
value (10427, '2022-11-22', '2022-11-23', NULL, 'In Process', null, 157)
;
INSERT into orders
value (10428, '2022-11-22', '2022-11-23', NULL, 'In Process', null, 157)
;
INSERT into orderdetails
VALUE (10426, 'S32_1268', 12, 83.79, 11)
;
INSERT into orderdetails
VALUE (10427, 'S32_1268', 13, 83.79, 11)
;
INSERT into orderdetails
VALUE (10428, 'S32_1268', 14, 83.79, 11)
;
COMMIT;
-- ------------- No 2 -------------
begin work;
DELETE from orderdetails
;
ROLLBACK;
SELECT *
from orderdetails
-- order by `orderNumber`DESC