-- lab-sql-8

-- 1. Write a query to display for each store its store ID, city, and country.
SELECT * FROM sakila.store;
SELECT * FROM sakila.city;
SELECT * FROM sakila.country;
SELECT * FROM sakila.address;

SELECT s.store_id, ci.city_id, ci.country_id
FROM sakila.store s
JOIN sakila.address a USING (address_id)
JOIN sakila.city ci USING (city_id);

-- 2. Write a query to display how much business, in dollars, each store brought in.
SELECT * FROM sakila.sales_by_store;

-- 3. Which film categories are longest?
SELECT name, length
FROM sakila.film f
JOIN sakila.film_category fc USING (film_id)
JOIN sakila.category c USING (category_id)
group by name;

-- 4. Display the most frequently rented movies in descending order.
SELECT distinct(count(film_id)) as 'films_rental_count', title
FROM sakila.rental r
JOIN sakila.payment p USING (rental_id)
JOIN sakila.inventory i USING (inventory_id)
JOIN sakila.film f USING (film_id)
group by title
order by 'films_rental_count' desc;

-- 5. List the top five genres in gross revenue in descending order.
SELECT distinct((count(category_id))*(rental_rate)) as 'total_revenue', category_id, name
FROM sakila.film f
JOIN sakila.film_category fc USING (film_id)
JOIN sakila.category c USING (category_id)
group by name
order by 'total_revenue' desc
limit 5;

-- 6. Is "Academy Dinosaur" available for rent from Store 1?
SELECT *
FROM sakila.inventory i
JOIN sakila.film f USING (film_id)
JOIN sakila.rental r USING (inventory_id)
where title = "Academy Dinosaur" and return_date is not null;

-- 7. Get all pairs of actors that worked together.
SELECT *
FROM sakila.film_actor fa1
JOIN sakila.film_actor fa2
on (fa1.actor_id <> fa2.actor_id) and (fa1.film_id = fa2.film_id)
order by fa1.film_id;

-- 8. Get all pairs of customers that have rented the same film more than 3 times.
SELECT *
FROM sakila.rental r
JOIN sakila.inventory i using (inventory_id) 
join sakila.payment p1 using (rental_id);




-- 9. For each film, list actor that has acted in more films.

