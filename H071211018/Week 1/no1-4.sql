CREATE DATABASE DATABASE1;

USE DATABASE1;

#nomor 1
CREATE TABLE offices (
	officeCode VARCHAR (10) NOT NULL,
    city VARCHAR (50) NOT NULL,
    phone VARCHAR (50) NOT NULL,
    addressline1 VARCHAR (50) NOT NULL,
    addressline2 VARCHAR (50),
    state VARCHAR (50),
    country VARCHAR (50) NOT NULL,
    PRIMARY KEY (officeCode)
); 
SHOW DATABASES;

SHOW TABLES;

#nomor 2
DESCRIBE offices;

#nomor 3
ALTER TABLE offices
MODIFY phone int (20) NOT NULL;

DESC offices;

#nomor 4
ALTER TABLE offices
DROP addressline2;

DESC offices;



