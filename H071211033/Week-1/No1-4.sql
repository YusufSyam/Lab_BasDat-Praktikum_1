-- no 1

CREATE DATABASE praktikum1;

USE praktikum1;
CREATE TABLE offices(
	officeCode VARCHAR(10) NOT NULL,
	city VARCHAR(50) NOT NULL,
	phone VARCHAR(50) NOT NULL,
	addresline1 VARCHAR(50) NOT NULL,
	addresline2 VARCHAR(50),
	state VARCHAR(50),
	country VARCHAR(50) NOT NULL,
	PRIMARY KEY(officeCode)
);

-- no 2
DESC offices;

-- no 3
ALTER TABLE offices
MODIFY COLUMN phone INT(20);

 -- no 4
ALTER TABLE offices
DROP COLUMN addresline2;

