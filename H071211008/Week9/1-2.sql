#1. Dengan menggunakan database “classicmodels”, tambahkan 3 data ke 
#	dalam tabel orders dan orderdetails setelah itu lakukan perintah commit:
set autocommit = off; 
start transaction;
#tabel order
insert into orders(orderNumber, orderDate, requiredDate, shippedDate, status, customerNumber)
values
(1, '2005-05-31', '2005-06-10', '2005-06-11', 'In Process', 145),
(2, '2022-11-21', '2022-11-21', '2022-11-21', 'in Process', 181),
(3, '2022-11-21', '2022-11-21', '2022-11-21', 'in Process', 121);
commit;

#tabel orderdetails
insert into orderdetails(orderNumber, productCode, quantityOrdered, priceEach, orderLineNumber)
values
(1, 'S10_2016', 20, 10.2, 2), 
(2, 'S10_1949', 10, 122.2, 4),
(3, 'S10_4962', 23, 111.2, 5); 
commit;


#2. Hapus seluruh data dari tabel orders details dan gunakan perintah 
#	ROLLBACK untuk mengembalikan data tersebut
start transaction;
# Mengecek constraint
show create table orders;
show create table orderdetails;
# menghapus foreing key
alter table orders drop constraint orders_ibfk_1;
alter table orderdetails drop constraint orderdetails_ibfk_1;
#hapus tabel
delete from orders;
#mengembalikkan tabel
rollback;


