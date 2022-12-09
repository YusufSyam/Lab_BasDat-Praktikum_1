#Asehpryanto Rari Parinding
#H071211065
#Paket Soal D

-- #SNM0102 (No. 6)
select store_id, avg(amount) as `average_of_payments` from store
join inventory using (store_id)
join rental using (inventory_id)
join payment using (rental_id)
group by store_id
ORDER by avg(amount) desc
limit 1;

-- #AZH0102 (No. 8)
select concat(first_name, ' ', last_name) as `customer_name`, GROUP_CONCAT(' ', title) as `list_film`, count(film_id) as `number_of_film` from customer
join rental using (customer_id)
join inventory using (inventory_id)
join film using (film_id)
group by `customer_name`
order by `list_film` ASC;

-- #FAV0102 (No. 3)
select YEAR(payment_date) as `Tahun`, 
MONTHNAME(payment_date) as `Bulan`, 
sum(amount) as `Keuntungan`, 
count(rental_id) as `Jumlah Rental`,
    CASE
        WHEN sum(amount) > AVG(amount) THEN 'Baik'
        WHEN sum(amount) < AVG(amount) THEN 'Buruk'
        WHEN sum(amount) = (
            select sum(amount) as x from payment
            group by MONTHNAME(payment_date)
            order by x desc limit 1) THEN 'Terbaik'
        WHEN sum(amount) = (
            select sum(amount) as x from payment
            group by MONTHNAME(payment_date)
            order by x asc
            limit 1) THEN 'Terburuk'
    END as `Tingkat Penjualan`
from payment
group by MONTHNAME(payment_date)
order by payment_date;

-- #FAH0202 (No. 9)
select customer_id as `Customer ID`, 
concat(first_name, ' ', last_name) as `Nama Lengkap`, 
count(film_id) as `Jumlah Pembelian`, 
GROUP_CONCAT(' ', title) as `Daftar FILM` from customer
join rental using (customer_id)
join inventory using (inventory_id)
join film using (film_id)
group by `Nama Lengkap`
order by `Jumlah Pembelian` desc
limit 10;


--  #TKH0201 (No. 1)
select count(*) from customer
join rental using (customer_id)
join inventory using (inventory_id)
join film using (film_id)
group by customer_id
having count(film_id) > (
    select avg(x) from (
        select count(film_id) as x from customer
        join rental using (customer_id)
        join inventory using (inventory_id)
        join film using (film_id)
        group by customer_id
    ) as y
)
order by count(*) desc limit 1;

-- #AZM0202 (No. 12)
select concat(first_name, ' ', last_name) as `Nama Lengkap`, 
title as `Judul Film`, 
rental_date as `Tanggal Rental`,
rental_duration as `Deadline (Hari)`,
return_date as `Tanggal Pengembalian`
from rental
join customer using (customer_id)
join inventory using (inventory_id)
join film using (film_id)
where abs(return_date - rental_date) > rental_duration;