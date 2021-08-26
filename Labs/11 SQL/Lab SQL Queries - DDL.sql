use sakila;

-- 1:
-- Get release years.

select distinct release_year from film;

-- 2:
-- Get all films with ARMAGEDDON in the title.

select title as "title with armageddon"
from film
where title like '%ARMAGEDDON%';

-- 3:
-- Get all films which title ends with APOLLO.

select title
from film
where title like '%APOLLO%';

-- 4:
-- Get 10 the longest films.

select length, title
from film
order by length desc
limit 10;

-- 5:
-- How many films include Behind the Scenes content?

select special_features, title
from film
where special_features like '%Behind the Scenes%';

-- 6:
-- Drop column picture from staff.

alter table staff
drop column picture;

-- 7:
-- A new person is hired to help Jon. Her name is TAMMY SANDERS, and she is a customer. Update the database accordingly.
-- step 1: get all data about customer TAMMY SANDERS
select *
from customer 
where first_name = "Tammy" and last_name = "Sanders";

-- step 2: insert values in staff table
insert into staff (first_name, last_name, address_id, email, store_id, `active`, username, `password`, last_update)
values ("Tammy", "Sanders", 79, "TAMMY.SANDERS@sakilacustomer.org", 2, 1, " ", null, curdate());
select * from staff;

-- 8:
-- Add rental for movie "Academy Dinosaur" by Charlotte Hunter from Mike Hillyer at Store 1. You can use current date for the rental_date column in the rental table. 
-- Hint: Check the columns in the table rental and see what information you would need to add there. You can query those pieces of information. 
-- For eg., you would notice that you need customer_id information as well. To get that you can use the following query:

-- step 1: gather data that is needed for rental table values
select * from customer where first_name = 'CHARLOTTE' and last_name = 'HUNTER';   # customer_id = 130	

select staff_id from staff where first_name="Jon";    #staff_id of Jon is 2

select inventory_id from inventory           ##### HOW TO GET THE RENTAL_ID? 
INNER JOIN film
ON inventory.film_id = film.film_id
inner join rental
on rental.inventory_id = inventory.inventory_id
where title = "Academy Dinosaur";

-- step 2: insert values in rental table

insert into rental (rental_date, inventory_id, customer_id, return_date, staff_id, last_update)
values (curdate(),"2", 130 , curdate() + 5, 2, curdate()); ###WORKS; BUT NEED CORRECT RENTAL_ID HERE

select * from rental where customer_id = 130;

-- 9.
-- Delete non-active users, but first, create a backup table deleted_users to store customer_id, email, and the date for the users that would be deleted. Follow these steps:
	-- Check if there are any non-active users
	-- Create a table backup table as suggested
    -- Insert the non active users in the table backup table
    -- Delete the non active users from the table customer

-- step 1: back up chart 
create table deleted_users (
id_deleted_users INT PRIMARY KEY AUTO_INCREMENT,
customer_id VARCHAR(255),
email VARCHAR(255),
create_date VARCHAR(255)
);

-- step 2: insert copied values in new chart 
insert into deleted_users (customer_id, email, create_date) 
select customer_id, email, create_date
from customer where active=0;

-- step 3: delete values from origin table 
delete from customer where active=0;
## HAVE TO DISABLE SAFE MODE IN ORDER TO DELETE 