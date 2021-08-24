use sakila;

-- query 1:
-- How many films are there for each of the categories in the category table. 

Select category.name, count(film_category.film_ID)
from category
Inner join film_category
on film_category.category_id = category.category_id
group by category.name


-- SELECT Orders.OrderID, Customers.CustomerName
-- FROM Orders
-- INNER JOIN Customers ON Orders.CustomerID = Customers.CustomerID;

-- query 2:
-- Which actor has appeared in the most films?
select count(film_actor.actor_id), actor.first_name, actor.last_name
from actor
inner join film_actor
on film_actor.actor_id = actor.actor_id
group by film_actor.actor_id
order by count(film_actor.actor_id) desc;

-- query 3:
-- Most active customer (the customer that has rented the most number of films)
select count(rental.rental_id), customer.last_name, customer.first_name
from customer
inner join rental
on customer.customer_id=rental.customer_id
group by customer.customer_id
order by count(rental.rental_id) desc
limit 10;


-- query 4:
-- List number of films per category.


-- query 5:
-- Display the first and last names, as well as the address, of each staff member.
Select staff.first_name, staff.last_name, address.address
from address
inner join staff
on staff.address_ID = address.address_ID;


-- query 6:
-- Display the total amount rung up by each staff member in August of 2005.
Select staff.first_name, staff.last_name, sum(payment.amount)
from staff
inner join payment
on payment.staff_ID = staff.staff_ID
where payment.payment_date >= "2005-08-01" and payment.payment_date <= "2005-08-31"
group by staff.first_name
order by sum(payment.amount)
desc;


-- query 7:
-- List each film and the number of actors who are listed for that film.
SELECT film.title, count(film_actor.actor_id) as numb_of_act
from film
inner join film_actor
on film_actor.film_id = film.film_id
group by film.title
order by count(film_actor.actor_id) desc;


-- query 8:
-- Using the tables payment and customer and the JOIN command, list the total paid by each customer. List the customers alphabetically by last name. 
select customer.first_name, customer.last_name, sum(payment.amount)
from customer
inner join payment
on payment.customer_id = customer.customer_id
group by customer.customer_id
order by customer.last_name;


-- query bonus:
-- Which is the most rented film? The answer is Bucket Brotherhood This query might require using more than one join statement. Give it a try.
Select film.title, count(rental.rental_ID) as times_rented
from film
inner join inventory
on film.film_id = inventory.film_id
inner join rental
on inventory.inventory_id = rental.inventory_id
group by film.film_id
order by times_rented
desc;
