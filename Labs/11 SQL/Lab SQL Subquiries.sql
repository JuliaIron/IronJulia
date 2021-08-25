-- HAVING only for GROUB BY, WHEN only on the solution of the subquery
-- HAVING is filtering the results of GROUB BY

USE sakila;
-- 1: 
-- How many copies of the film Hunchback Impossible exist in the inventory system?

 select count(inventory_id) as `copies in inventory system`
 from inventory
 where film_id = (
	select film_id
    from film
    where title = "Hunchback Impossible"
    );
    
-- 2:
-- List all films whose length is longer than the average of all the films.

select film_id, title, length
from film 
where length > (
	select avg(length)
    from film
    where film_id
    )
    order by length desc;

-- 3.
-- Use subqueries to display all actors who appear in the film Alone Trip.

select actor_id, first_name, last_name
from actor
where actor_id in (
	select actor_id
    from film_actor
    where film_id in (
		select film_id
		from film
		where title = "Alone Trip"
		)
    );
   
-- 4:
-- Sales have been lagging among young families, and you wish to target all family movies for a promotion. 
-- Identify all movies categorized as family films.
   
# If a subquery returns more than one value, you can use other operators such as IN or NOT IN operator in the WHERE clause.
   
select film_id, title
from film
where film_id in (
	select film_id
	from film_category
	where category_id in (
		select category_id
		from category
		where name = 'Family'
		)
);

-- 5.
-- Get name and email from customers from Canada using subqueries. 
-- Do the same with joins. Note that to create a join, you will have to identify the correct tables with their primary keys and foreign keys, that will help you get the relevant information.
    
    select first_name, last_name, email
    from customer 
    where address_id in (
		select address_id
        from address
        where city_id in (
			select city_id
            from city
            where country_id in (
				select country_id
                from country
                where country = "Canada"
                ))); 
    
    -- join:
    
    select first_name, last_name, email
    from customer 
    inner join address
    on customer.address_id = address.address_id
    inner join city
    on address.city_id = city.city_id
    inner join country
    on city.country_id = country.country_id
    where country = "Canada"
    order by last_name asc;
    
    
-- 6:
-- Which are films starred by the most prolific actor? Most prolific actor is defined as the actor that has acted in the most number of films. 
-- First you will have to find the most prolific actor and then use that actor_id to find the different films that he/she starred.
    
-- 7.
-- Films rented by most profitable customer. You can use the customer table and payment table to find the most profitable customer ie the customer that has made the largest sum of payments
    
-- 8:
-- Customers who spent more than the average payments.

select customer_id, amount
from payment
where amount > (
	select avg(amount)
    from payment 
    where customer_id 
    )
    order by amount desc;
