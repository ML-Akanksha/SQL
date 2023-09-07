-- /* independent subquery : scalar */


SELECT * FROM sql_cx_live.movies
WHERE score = 8.7;

SELECT * FROM sql_cx_live.movies
WHERE score = (SELECT MAX(score) FROM sql_cx_live.movies);


- ### find the movie with highest profit

USE sql_cx_live;

SELECT * FROM movies
WHERE (gross - budget) = (SELECT MAX(gross - budget) FROM movies);

SELECT * FROM movies
ORDER BY (gross - budget) DESC
LIMIT 1;


- ### find how many movies have a rating > the avg of all the movie ratings (find the count of above average movies)

SELECT AVG(score) FROM movies;

SELECT * FROM movies
WHERE score > (SELECT AVG(score) FROM movies);

SELECT COUNT(*)  FROM movies
WHERE score > (SELECT AVG(score) FROM movies);


- ### find the highest rated movie of 2000

SELECT * FROM movies
WHERE year = 2000 AND score = (SELECT MAX(score) FROM movies WHERE year = 2000);


- ### find the highest rated movie among all movies whose number of votes are the dataset average votes














