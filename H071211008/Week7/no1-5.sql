#1. Perhatikan database classic models. Buatlah query untuk menampilkan 
#	data pembayaran (payment) terkecil dan terbesar untuk masing-masing 
# 	pengguna dengan menggunakan subquery.
select customerName, pembayaranTerbesar, pembayaranTerkecil
from 	(select customerNumber, max(amount) as pembayaranTerbesar, 
		min(amount) as pembayaranTerkecil
		from payments
		group by customerNumber) as pay
inner join customers 
using(customerNumber);

#2. Buatlah query untuk menampilkan seluruh employee yang bekerja di 
#	office dengan employee terbanyak (misalnya office A memiliki paling 
#	banyak employee, maka buatkan daftar employee pada office A) 
select concat(firstName, ' ', lastName) as nama, officeCode
from employees
where officeCode in 
(select officeCode from
(select count(employeeNumber) as jumlah, offices.officeCode
from offices
inner join employees
on offices.officeCode = employees.officeCode
group by officeCode
order by jumlah desc
limit 1) as aa);

#3. Buatlah query yang akan menampilkan seluruh product yang di namanya 
#	mengandung kata ‘Ford’ beserta productScale dari product tersebut. 
#	Gunakan subquery untuk menampilkannya. 
select productName, productScale
from products
where productName in 
	(select productName from products
    where productName like '%ford%');

#4. Siapa nama pelanggan, dan nama karyawan serta berapa nomor pesanan 
#	dan biaya pesanan untuk pesanan yang paling mahal?
select customers.customerName, concat(employees.firstName, ' ', employees.lastName) as nama, orders.orderNumber, od.biaya
from customers
inner join employees
on customers.salesRepEmployeeNumber = employees.employeeNumber
natural join orders
inner join (select sum(quantityOrdered * priceEach) as biaya, orderNumber from orderdetails
group by orderNumber
order by biaya desc
limit 1) as od 
on orders.orderNumber = od.orderNumber;


#5. Tampilkan nama negara dan panjang karater negara, dimana 
#	menampilkan dua negara yaitu negara dengan karakter terpanjang dan 
#	negara dengan karakter terpendek
select country, length(country) as karakter
from customers
where length(country) =
	(select max(length(country)) from customers) or
    length(country) = 
    (select min(length(country)) from customers)
group by country;