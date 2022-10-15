/*
-- Nomor 1
INSERT INTO employees VALUES (1, 'Muhammad', 'Arif', 'x69420', 'muharief1234@gmail.com', 5, 1002, 'Guild Master');
INSERT INTO employees VALUES (2, 'Diablo', 'Noir', 'x69420', ' ', 5, 1, 'Adventurer');
INSERT INTO employees VALUES (3, 'Rimuru', 'Tempest', 'x69420', 'muharief1234@gmail.com', 5, 1, 'Adventurer');
-- Nomor 2
INSERT INTO offices VALUES(8, 'Makassar', '+62 812 4090 7134', 'Belibis Street', 'Number 11', 'South Sulawesi', 'Indonesia', 90122, 'NA');
UPDATE employees SET officeCode=8 WHERE officeCode=4 AND jobTitle='Sales Rep';

-- Nomor 3
DELETE FROM payments WHERE amount < 10000;
*/