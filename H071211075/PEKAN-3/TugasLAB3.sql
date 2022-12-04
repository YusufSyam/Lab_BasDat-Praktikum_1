USE classicmodels;

-- Soal 1
SELECT * FROM employees;
INSERT INTO employees (employeeNumber, lastName, firstName, extension, email, officeCode, reportsTo, jobTitle)
VALUE (2671, 'Aradhana', 'Raihan', 'x3277', 'raihan@yahoo.com', 1, 1102, 'Broker');

INSERT INTO employees
VALUE (2721, 'Hendra', 'Muhammad', 'x3322', 'hendra@yahoo.com', 1, 2705, 'Businessman');

INSERT INTO employees
VALUE (2213, 'Hendria', 'Ahmad', 'x3322', 'hendra@yahoo.com', 1, 2705, 'Businessman');

-- Soal 2
SELECT * FROM offices;
INSERT INTO offices (officeCode, city, phone, addressLine1, addressLine2, state, country, postalCode, territory)
VALUE (9, 'West Edgardofort', '+(874) 824-4874', '7316 Keefe Ford', NULL, 'Maryland', 'USA', 80166, 'NA');

SELECT * FROM employees;
UPDATE employees
SET officeCode = 9
WHERE jobTitle = 'Sales Rep' AND officeCode = 4;

-- Soal 3
SELECT * FROM payments;
DELETE FROM payments WHERE amount<10000;