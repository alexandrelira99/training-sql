-- Movie rental data tables

SELECT * FROM actor
SELECT * FROM category
SELECT * FROM payment
SELECT * FROM customer
SELECT * FROM film

---------------- Actors and they category ------------
SELECT 
first_name, 
last_name, 
category.name 
    FROM actor 
    INNER JOIN category ON category.category_id = actor.actor_id;

---------------- Creating a column to full_name actors ------------

SELECT first_name || ' ' || last_name AS full_name
    FROM actor;

---------------- Customer with the most payment (who most spend renting film) ------------------
SELECT 
first_name, 
last_name, 
SUM(amount) AS total_payment
    FROM customer
    INNER JOIN payment ON payment.customer_id = customer.customer_id
    GROUP BY first_name, last_name
    ORDER BY total_payment desc; -- Eleanor Hunt is who most paid renting films --

---------------- Customer with the most rents ----------------

SELECT 
first_name, 
last_name, 
COUNT(rental_id) AS rentals
    FROM customer
    INNER JOIN payment ON payment.customer_id = customer.customer_id
    GROUP BY first_name, last_name
    ORDER BY rentals desc -- Eleanor Hunt is who must rented films --
    LIMIT 10;
                    
---------------- Films with "drama" category ----------------

SELECT 
film_id, 
title,
description
    FROM film
    WHERE description LIKE '%Drama%';

---------------- Films with "murdering" category ----------------

SELECT 
film_id, 
title,
description
    FROM film
    WHERE description LIKE '%Kill%';
    
---------------- Creating a column to show which film is +18 (with 'murdering') ----------------   

SELECT * FROM film

ALTER TABLE film
ADD age_restriction varchar(255)

UPDATE film 
SET age_restriction = CASE WHEN description LIKE '%Kill%' 
    THEN 18 
    ELSE 0 
END;

---------------- Finally, films with +18 ----------------

SELECT age_restriction FROM film
WHERE age_restriction = '18';
