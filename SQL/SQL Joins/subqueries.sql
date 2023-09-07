---- /* SQL Subqueries */

- ### find the movie with highest rating

SELECT MAX(score) FROM sql_cx_live.movies;

SELECT * FROM sql_cx_live.movies
WHERE score = 8.7;

SELECT * FROM sql_cx_live.movies
WHERE score = (SELECT MAX(score) FROM sql_cx_live.movies);

