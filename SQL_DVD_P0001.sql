-- 1.a. The query will return a list of films from the "film" table,
-- b.showing their "description," "film_id," and "title," 
-- c.with the films sorted first by title in ascending order 
-- d.and then by film_id in descending order.

select description, film_id, title
from film
order by title asc, film_id desc


-- 2.a list of film titles and their corresponding replacement costs,
-- b.but only for films where the replacement cost is less than 15, 
-- c.and the results will be sorted in ascending order based on the replacement cost.

select title, replacement_cost
from film 
where replacement_cost < 15 
order by replacement_cost asc

-- 3.a. The query will return a list of payment amounts, 
-- b. but only for payments where the amount falls within the specified range, 
-- c. and the results will be sorted in descending order based on the payment amount.


select amount from payment
where amount between 0.99 and 1.99
order by amount desc



-- 4. List of film titles for films that have a length greater than or equal to 3 hours.

select title from film 
where length >= 180


--5. films whose titles start with the letter 'M'.

select * from film
where film.title like 'M%'

select distinct rental_rate, replacement_cost
from film
order by rental_rate desc, replacement_cost desc


--6. List of film titles, if they belong to the 'Classics' category


SELECT film.title, category.name AS category_name, film.release_year
FROM film
LEFT JOIN film_category ON film.film_id = film_category.film_id
LEFT JOIN category ON film_category.category_id = category.category_id
WHERE category.name = 'Classics';




--7. Minimum and Max replacement cost 
SELECT MIN(replacement_cost) AS min_cost, MAX(replacement_cost) AS max_cost
FROM film;



--8. the sum of amount
SELECT SUM(amount) AS total_revenue
FROM payment;


--9. the average rental duration 
SELECT AVG(rental_duration) AS average_rd
FROM film;

--10. a summary of the number of inventory items in each store. 
SELECT store_id, COUNT(*) AS store_count
FROM inventory
GROUP BY store_id;


--11. a summary of the number of active and inactive staff members
SELECT active, COUNT(*) AS active_staff
FROM staff
GROUP BY active;



--12. standard deviation and variance of rental rate
SELECT STDDEV(rental_rate) AS std_deviation, VARIANCE(rental_rate) AS variance
FROM film;


--13. the total sales for films categorized by their ratings.
SELECT rating, SUM(rental_rate) AS total_sales
FROM film
GROUP BY rating;


--14.the total sales for films categorized by their ratings and rental duration.
SELECT rating, rental_duration, SUM(rental_rate) AS total_sales
FROM film
GROUP BY rating, rental_duration;



--15.customers who have made payments with an average amount exceeding 5
SELECT customer_id, AVG(amount) AS avg_amount 
FROM payment
GROUP BY customer_id
HAVING AVG(amount) > 5


--16. total count and total amount for Comedy 
SELECT c.category_id, c.name AS category_name, COUNT(1) AS film_count, SUM(p.amount) AS total_amount
FROM category c
JOIN film_category fc ON c.category_id = fc.category_id
JOIN inventory i ON fc.film_id = i.film_id
JOIN rental r ON i.inventory_id = r.inventory_id
JOIN payment p ON r.rental_id = p.rental_id
WHERE c.name = 'Comedy'
GROUP BY c.category_id
ORDER BY total_amount DESC;






