-- No 1

INSERT INTO employees
VALUE(1324, 'Johnson', 'John', 'x4103', 'johnjohnson@classicmodels.com', 1, 1002, 'Sales Rep'); 
INSERT INTO employees
VALUE(1325, 'Jackson', 'Jack', 'x4104', 'jackjackson@classicmodels.com', 1, 1002, 'Sales Rep'); 
INSERT INTO employees
VALUE(1326, 'Fudhail', 'Al', 'x4105', 'johnjohnson@classicmodels.com', 1, 1002, 'Sales Rep'); 

-- No 2

INSERT INTO offices
VALUE('8', 'Jakarta', '+62 87847135315', 'Jl. Pahlawan', NULL, NULL, 'Indonesia', '9900', 'NA');
UPDATE employees
SET officecode='8'
WHERE officecode='4' AND jobtitle='sales rep';

-- No 3

DELETE FROM payments
WHERE amount<10000
