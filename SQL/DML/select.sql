--- DML
--- 2) SELECT

-- select all
SELECT * FROM yourdb.smartphones_cleaned_v6;
SELECT * FROM yourdb.smartphones_cleaned_v6 WHERE 1;

-- filter columns
SELECT model,price,rating FROM yourdb.smartphones_cleaned_v6;
SELECT model,battery_capacity,os FROM yourdb.smartphones_cleaned_v6;

-- alias (renaming columns)
SELECT os AS 'Operating Sysytem',model,battery_capacity AS mAh FROM yourdb.smartphones_cleaned_v6;

-- create expression using columns
SELECT model, SQRT(resolution_width*resolution_width + resolution_height*resolution_height)/screen_size AS 'ppi' FROM yourdb.smartphones_cleaned_v6;
SELECT model,rating/10 FROM yourdb.smartphones_cleaned_v6;

-- constant column (all smartphones)
SELECT model, 'smartphone' AS 'TYPE' FROM yourdb.smartphones_cleaned_v6;

-- distinct (unique values from columns)
SELECT DISTINCT brand_name AS 'All brands' FROM yourdb.smartphones_cleaned_v6;
SELECT DISTINCT (brand_name) AS 'All brands' FROM yourdb.smartphones_cleaned_v6;
SELECT DISTINCT (processor_brand) AS 'all_processor' FROM yourdb.smartphones_cleaned_v6;

-- distinct combination
SELECT brand_name, processor_brand FROM yourdb.smajrtphones_cleaned_v6;
SELECT DISTINCT brand_name, processor_brand FROM yourdb.smartphones_cleaned_v6;


-- filter rows (WHERE Clause)
- ### find all samsung phones

SELECT * FROM yourdb.smartphones_cleaned_v6
WHERE brand_name = 'samsung';

- ### find all phones with price > 50000

SELECT * FROM yourdb.smartphones_cleaned_v6
WHERE price > 50000;

SELECT * FROM yourdb.smartphones_cleaned_v6
WHERE price > 10000 AND price < 20000;

--- between ---
SELECT * FROM yourdb.smartphones_cleaned_v6
WHERE price BETWEEN 10000 AND 20000;

- ### find all phones with rating > 80 and price < 25000

SELECT * FROM yourdb.smartphones_cleaned_v6
WHERE price < 25000 AND rating > 80;

SELECT model,price,rating,processor_brand FROM yourdb.smartphones_cleaned_v6
WHERE price < 25000 AND rating > 80 AND processor_brand = 'snapdragon';

- ### find all samsung phones with RAM > 8 GB

SELECT * FROM yourdb.smartphones_cleaned_v6
WHERE brand_name = 'samsung' AND ram_capacity > 8;

SELECT * FROM yourdb.smartphones_cleaned_v6
WHERE brand_name = 'samsung' AND processor_brand = 'snapdragon';

----- Order of query execution
----- FROM      JOIN     WHERE     GROUP BY     HAVING    SELECT     DISTINCT      ORDER BY

- ###  find brands who sell phones with price > 50000

SELECT DISTINCT brand_name FROM yourdb.smartphones_cleaned_v6
WHERE price > 50000;

-- IN AND NOT IN
- ### find phones whose processor brand is either snapdragon or exynos or bionic

SELECT * FROM yourdb.smartphones_cleaned_v6
WHERE processor_brand = 'snapdragon' OR
processor_brand = 'exynos' OR
processor_brand = 'bionic';

SELECT * FROM yourdb.smartphones_cleaned_v6
WHERE processor_brand IN ('snapdragon','exynos','bionic');

SELECT brand_name,model,processor_brand FROM yourdb.smartphones_cleaned_v6
WHERE processor_brand NOT IN ('snapdragon','exynos','bionic');
