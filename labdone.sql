USE sakila;
SELECT 
    MAX(duration) AS max_duration,
    MIN(duration) AS min_duration
FROM movies;
SELECT 
    FLOOR(AVG(duration) / 60) AS avg_hours,
    ROUND(AVG(duration) % 60) AS avg_minutes
FROM movies;

SELECT 
    DATEDIFF(MAX(rental_date), MIN(rental_date)) AS days_operating
FROM rental;

SELECT 
    rental_id, 
    rental_date, 
    EXTRACT(MONTH FROM rental_date) AS rental_month,
    EXTRACT(DAYOFWEEK FROM rental_date) AS rental_weekday
FROM rental
LIMIT 20;

SELECT 
    rental_id, 
    rental_date, 
    EXTRACT(MONTH FROM rental_date) AS rental_month,
    EXTRACT(DAYOFWEEK FROM rental_date) AS rental_weekday,
    CASE 
        WHEN EXTRACT(DAYOFWEEK FROM rental_date) IN (1, 7) THEN 'weekend'
        ELSE 'workday'
    END AS DAY_TYPE
FROM rental
LIMIT 20;
SELECT 
    film_title,
    IFNULL(rental_duration, 'Not Available') AS rental_duration
FROM 
    movies
ORDER BY 
    film_title ASC;
SELECT 
    COUNT(*) AS total_films
FROM 
    film;
SELECT 
    rating,
    COUNT(*) AS film_count
FROM 
    film
GROUP BY 
    rating;
SELECT 
    rating,
    COUNT(*) AS film_count
FROM 
    film
GROUP BY 
    rating
ORDER BY 
    film_count DESC;
SELECT 
    rating,
    ROUND(AVG(duration), 2) AS mean_duration
FROM 
    film
GROUP BY 
    rating
ORDER BY 
    mean_duration DESC;
SELECT 
    rating,
    ROUND(AVG(duration), 2) AS mean_duration
FROM 
    film
GROUP BY 
    rating
HAVING 
    AVG(duration) > 120
ORDER BY 
    mean_duration DESC;
