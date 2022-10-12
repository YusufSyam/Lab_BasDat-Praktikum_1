-- Nomor 1
CREATE DATABASE tugaspraktikum1;

USE tugaspraktikum1;

CREATE TABLE offices(
	officeCode VARCHAR(10) NOT null,
	city VARCHAR(50),
	phone VARCHAR(50),
	addressline1 VARCHAR(50),
	addressline2 VARCHAR(50),
	state VARCHAR(50),
	country VARCHAR(50),
	PRIMARY KEY (officeCode)
);

-- Nomor 2
DESCRIBE offices;

-- Nomor 3
ALTER TABLE offices MODIFY phone INT(20);

-- Nomor 4
ALTER TABLE offices DROP addressline2;