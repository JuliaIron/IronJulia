
-- 1:
-- In the table actor, what last names are not repeated? For example if you would sort the data in the table actor by last_name, you would see that there is Christian Arkoyd, Kirsten Arkoyd, and Debbie Arkoyd. 
-- These three actors have the same last name. So we do not want to include this last name in our output. Last name "Astaire" is present only one time with actor "Angelina Astaire", hence we would want this in our output list.


select * from actor order by last_name;

SELECT COUNT(last_name), last_name
FROM actor
GROUP BY last_name
ORDER BY COUNT(last_name) DESC;

-- 2:
-- Which last names appear more than once? We would use the same logic as in the previous question but this time we want to include the last names of the actors where the last name was present more than once

SELECT COUNT(last_name), last_name
FROM actor
GROUP BY last_name
ORDER BY COUNT(last_name) DESC;

-- 3:
-- Using the rental table, find out how many rentals were processed by each employee.

SELECT COUNT(rental_id), staff_id
FROM rental
GROUP BY staff_id
ORDER BY COUNT(staff_id) DESC;

-- 4:
-- Using the film table, find out how many films were released.

SELECT count(film_id), title, release_year
FROM film
GROUP BY release_year
ORDER BY count(film_id);

-- 5:
-- Using the film table, find out how many films there are of each rating.

SELECT COUNT(film_id), title, rating
FROM film
GROUP BY rating;

-- 6:
-- What is the mean length of the film for each rating type. Round off the average lengths to two decimal places

SELECT ROUND(AVG(length),2), title, rating 
from film
GROUP BY rating;

-- 7:
-- Which kind of movies (rating) have a mean duration of more than two hours?

SELECT ROUND(AVG(length),2), rating, length 
FROM film
GROUP BY rating
HAVING AVG(length) > 120;