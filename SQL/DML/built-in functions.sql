--- Types of functions in SQL
# ---- built-in : aggegate functions >>> max, min, avg, sum, count, sd, variance


SELECT * FROM yourdb.smartphones_cleaned_v6;

SELECT MAX(price) FROM yourdb.smartphones_cleaned_v6;

SELECT Min(price) FROM yourdb.smartphones_cleaned_v6;

SELECT AVG(ram_capacity) FROM yourdb.smartphones_cleaned_v6;

- ### find the price of the costliest samsung phone

SELECT MAX(price) FROM yourdb.smartphones_cleaned_v6
WHERE brand_name = 'samsung';

SELECT * FROM yourdb.smartphones_cleaned_v6
WHERE brand_name = 'samsung' AND price = 110999;

- ### find rating average of all apple phones

SELECT AVG(rating) FROM yourdb.smartphones_cleaned_v6
WHERE brand_name = 'apple';

SELECT SUM(price) FROM yourdb.smartphones_cleaned_v6;

- ### find the number of one plus phones

SELECT COUNT(*) FROM yourdb.smartphones_cleaned_v6
WHERE brand_name = 'oneplus';

- ### find the number of brand available

SELECT DISTINCT(brand_name) FROM yourdb.smartphones_cleaned_v6;

SELECT COUNT(DISTINCT(brand_name)) FROM yourdb.smartphones_cleaned_v6;

SELECT COUNT(DISTINCT(brand_name)) AS 'total_brands' FROM yourdb.smartphones_cleaned_v6;

SELECT STD(screen_size) FROM yourdb.smartphones_cleaned_v6;

SELECT VARIANCE(screen_size) FROM yourdb.smartphones_cleaned_v6;

# ---- built-in : scalar functions >>> abs, round, ceil, floor, 

SELECT price FROM yourdb.smartphones_cleaned_v6;

SELECT (price - 200000) AS 'temp' FROM yourdb.smartphones_cleaned_v6;

SELECT ABS(price - 200000) AS 'temp' FROM yourdb.smartphones_cleaned_v6;

SELECT model, 
SQRT(resolution_width*resolution_width + resolution_height*resolution_height)/screen_size AS 'ppi' 
FROM yourdb.smartphones_cleaned_v6;

SELECT model, 
ROUND(SQRT(resolution_width*resolution_width + resolution_height*resolution_height)/screen_size) AS 'ppi' 
FROM yourdb.smartphones_cleaned_v6;

SELECT model, 
ROUND(SQRT(resolution_width*resolution_width + resolution_height*resolution_height)/screen_size,2) AS 'ppi' 
FROM yourdb.smartphones_cleaned_v6;

SELECT screen_size FROM yourdb.smartphones_cleaned_v6;

SELECT CEIL(screen_size) FROM yourdb.smartphones_cleaned_v6;

SELECT FLOOR(screen_size) FROM yourdb.smartphones_cleaned_v6;
