#1 #YUE0101

CREATE DATABASE ujian;
USE ujian;

CREATE TABLE type (
	id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL
);

CREATE TABLE buku (
	id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    summary TEXT DEFAULT NULL,
    availability ENUM('available', 'unavailable'),
    total INT NOT NULL,
    type_id INT,
    FOREIGN KEY (type_id) REFERENCES type(id)
);

#2 #YUEO201

INSERT INTO type (id, name)
VALUES (1, 'Novel'), (2, 'TextBook'), (3, 'Tesis');

INSERT INTO buku (name, availability, total, type_id)
VALUES ('Harry Potter', 'available', 100, 1),
	   ('Photoshop Tutorial', 'unavailable', 0, 2);
       
INSERT INTO buku (name, summary, total, type_id)
VALUES ('Linear Algebra', 'Book Written by Prof Alief Einstein for Linear Algebra', 35, 2);

INSERT INTO buku (name, summary,availability, total, type_id)
VALUES ('AI for Image Captioning', 'AI for Image Captioning', 'unavailable', 0, 3),
	   ('Percy Jackson', 'Story of Percy Jackson', 'available', 73, 1);
       
#3 #YUE0301

DELETE FROM buku WHERE type_id = 1;
DROP DATABASE ujian;


#4 #ALM0101

SELECT concat(first_name, " ", last_name) AS fullname, city, country
FROM customer
JOIN address USING (address_id)
JOIN city USING (city_id)
JOIN country USING  (country_id)   
WHERE country LIKE "ind%" OR "%na";

#5 #AZM0201

SELECT concat(first_name, " ", last_name) AS fullname, title, rental_date, return_date, datediff(return_date, rental_date) AS Deadline
FROM customer
JOIN rental USING (customer_id)
JOIN inventory USING (inventory_id)
JOIN film USING (film_id)
WHERE (SELECT datediff(return_date, rental_date) AS Deadline) > rental_duration;

#6 #AWM0201

SELECT customer.first_name,country.country, film.title from film 
JOIN inventory
USING (film_id)
JOIN rental
USING (inventory_id)
JOIN customer
USING (customer_id)
JOIN address
USING (address_id)
JOIN city
USING (city_id)
JOIN country
USING (country_id)
WHERE year(rental_date) = year(curdate() - interval 16 YEAR) AND rating in ("G") ORDER BY country;

#8 #TKM0101

SELECT DISTINCT concat(customer.first_name," ",customer.last_name) "Nama Lengkap" FROM customer
JOIN rental
USING (customer_id)
JOIN Inventory
USING (Inventory_id)
JOIN film
USING (film_id)
JOIN film_category
USING (film_id)
JOIN category
USING (category_Id)
WHERE category.name <> "Horror";

#10 #SNH0201

SELECT actor.actor_id, actor.first_name, actor.last_name from actor
JOIN film_actor
USING (actor_id)
JOIN film
USING(film_id)
JOIN film_category
USING (film_id)
join category
using(category_id)
GROUP BY actor.actor_id
HAVING count(DISTINCT category.name) = "13";

#15 #TKV0101

SELECT DISTINCT film.title, category.name category from actor
JOIN film_actor
USING (actor_id)
JOIN film
USING(film_id)
JOIN film_category
USING (film_id)
join category
using(category_id)
where category.name IN (SELECT category.name from actor
JOIN film_actor
USING (actor_id)
JOIN film
USING(film_id)
JOIN film_category
USING (film_id)
join category
using(category_id)
where film.title like "pulp%") AND 
actor.actor_id in (SELECT actor.actor_id from actor
JOIN film_actor
USING (actor_id)
JOIN film
USING(film_id)
JOIN film_category
USING (film_id)
join category
using(category_id)
where film.title like "pulp%") AND film.title <> 'PULP BEVERLY' ORDER BY film.title LIMIT 1;


