#Use classicmodels
# 1. Siapa saja customer yang status pemesananya tertahan karena memilebihi batas kredit?
-- select c.customerName, o.comments
-- from customers as c
-- inner join orders as o
-- on c.customerNumber = o.customerNumber
-- where o.status = 'on hold' and o.comments like '%credit limit exceed%'

# 2. siapa saja customrs yang berkomentar untuk menggunakan jasa pengantaran DHL? tampilkan nama mereka, satus order mereka serta komentar yang di maksud.
-- select c.customerName, o.status, o.comments
-- from customers as c
-- inner join orders as o
-- on c.customerNumber = o.customerNumber
-- where o.comments like '%dhl%'

# 3. Tampilkan semua order mobil bermerek ferarri pada database classicmodels! tampilkan pula nama customers, nama mobilnya, status order, serta tanggal pengiriman yang berturut terkini
-- select c.customerName, p.productName, o.status, o.shippedDate
-- from customers as c
-- inner join orders as o
-- on c.customerNumber = o.customerNumber
-- inner join orderdetails as od
-- on o.orderNumber = od.orderNumber
-- inner join products as p
-- on od.productCode = p.productCode
-- where p.productName like '%ferrari%'
-- order by shippedDate desc

# 4. Memasukkan data pemesanan 
-- insert into orders (orderNumber, orderDate, requiredDate, shippedDate, status, comments, customerNumber)
-- value (10426, current_time(), date_add(now(), interval 1 year), null, 'in process', null, 465);
# - Mobil akan dijual kembali dengan harga yang sama dengan harga eceran resmi/Harga retail
-- insert into orderdetails (orderNumber, productCode, quantityOrdered, priceEach, orderLineNumber)
-- select 10426, 'S18_2957', 50, products.MSRP, 1
-- from orderdetails
-- inner join products
-- on orderdetails.productCode = products.productCode
-- where products.productCode = 'S18_2957'