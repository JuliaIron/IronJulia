use sakila; 

-- query 1:
-- Write a query to display for each store its store ID, city, and country.
select store.store_id, city.city, country.country
from country
inner join city
on country.country_id = city.country_id
inner join  address
on city.city_id = address.city_id 
inner join store
on address.address_id = store.address_id;

-- query 2:
-- Write a query to display how much business, in dollars, each store brought in.
select store.store_id, sum(payment.amount)
from payment
inner join customer
on payment.customer_id = customer.customer_id
inner join store
on customer.store_id = store.store_id
group by store_id;

-- query 3:
-- What is the average running time of films by category?
select avg(film.length), category.`name`
from film
inner join film_category
on film.film_id = film_category.film_id
inner join category
on film_category.category_id = category.category_id
group by category.`name`;

-- query 4:
-- Which film categories are longest?
select
from
inner join
on
inner join 
on

-- query 5:
-- Display the most frequently rented movies in descending order.
select film.rental_rate, film.film_id
from rental
inner join inventory
on rental.inventory_id = inventory.inventory_id
inner join film
on inventory.film_id = film.film_id
group by film_id
order by rental_rate desc;

-- query 6:
-- List the top five genres in gross revenue in descending order.
select
from
inner join
on
inner join
on

-- query 7:
-- Is "Academy Dinosaur" available for rent from Store 1?
select
from
inner join
on
inner join
on