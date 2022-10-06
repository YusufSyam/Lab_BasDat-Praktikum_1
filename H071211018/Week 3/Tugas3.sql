SELECT * FROM employees;
SELECT * FROM offices;
SELECT * FROM payments;

#No 1
INSERT INTO employees
VALUE (1210, 'Wulan', 'Astrina', 'x1234', 'astrinawulanputri48@gmail.com', 4, 1102, 'VP Marketing'),
	  (2002, 'Kahfi', 'Muhammad', 'x4321', 'muhammadkahfims@gmail.com', 3, 1088, 'VP Sales'),
      (0202, 'Kairo', 'Muhammad', 'x5678', 'muhammadkairo@gmail.com', 4, 1102, 'Sales Rep');

#No 2
INSERT INTO offices
VALUE (8, 'Makassar', '+6208235678', 'Jl.Pk 7', 'Pondok Rezky', 'Sulsel', 'Indonesia', 20521, 'Sulawesi') ;

UPDATE employees
SET OfficeCode=8
WHERE officeCode=4 and jobtitle='Sales Rep' ;

#No 3
DELETE FROM payments 
WHERE amount < 10000



