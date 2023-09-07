-------- Sorting



SELECT * FROM yourdb.smartphones_cleaned_v6;

- ### find top 5 samsung phones with biggest screen size

SELECT screen_size,brand_name FROM yourdb.smartphones_cleaned_v6
WHERE brand_name = 'samsung';

SELECT model, screen_size FROM yourdb.smartphones_cleaned_v6
WHERE brand_name = 'samsung'
ORDER BY screen_size DESC 
LIMIT 5;

- ### sort all the phones in descending order of number of total camera

SELECT model,num_rear_cameras,num_front_cameras FROM yourdb.smartphones_cleaned_v6;

SELECT model,num_rear_cameras + num_front_cameras AS 'total_cameras' FROM yourdb.smartphones_cleaned_v6
ORDER BY total_cameras DESC;

- ### sort data on the basis of ppi in decreasing order

SELECT model,
ROUND(SQRT(resolution_width*resolution_width + resolution_height*resolution_height)/screen_size) AS 'ppi'
FROM yourdb.smartphones_cleaned_v6
ORDER BY ppi DESC;

- ### find the phone with 2nd largest battery

SELECT model,battery_capacity FROM yourdb.smartphones_cleaned_v6
ORDER BY battery_capacity DESC
LIMIT 1,1;

- ### find the name and rating of the worst rated apple phone

SELECT rating, model FROM yourdb.smartphones_cleaned_v6
WHERE brand_name = 'apple'
ORDER BY rating ASC
LIMIT 1;

- ### sort phones alphabetically and then on the basis of rating in asc order

SELECT model, brand_name, price FROM yourdb.smartphones_cleaned_v6;

SELECT model, brand_name, price FROM yourdb.smartphones_cleaned_v6
ORDER BY brand_name ASC, price ASC;




------- Grouping 

- ### group smartphones by brand and get the count, average price, max rating, avg screen size and avg battery capacity

SELECT DISTINCT(brand_name),model FROM yourdb.smartphones_cleaned_v6;

SELECT brand_name, COUNT(*) AS 'num_phones',
ROUND(AVG(price)) AS 'avg_price',
MAX(rating) AS 'max_rating',
ROUND(AVG(screen_size),2) AS 'avg screen_size',
ROUND(AVG(battery_capacity)) AS 'avg battery_capacity'
FROM yourdb.smartphones_cleaned_v6
GROUP BY brand_name
ORDER BY num_phones DESC
LIMIT 10;

- ### group smartphones by whether they have an NFC and get the average price and rating

SELECT brand_name,model,has_nfc,price,rating FROM yourdb.smartphones_cleaned_v6;

SELECT has_nfc,
AVG(price) AS 'avg_price',
AVG(rating) AS 'avg_rating'
FROM yourdb.smartphones_cleaned_v6
GROUP BY has_nfc;

- ### group smartphones by the extended memory available and get the average price

SELECT model, extended_memory_available, price FROM yourdb.smartphones_cleaned_v6;

SELECT extended_memory_available,
AVG(price) AS 'avg_price'
FROM yourdb.smartphones_cleaned_v6
GROUP BY extended_memory_available;

- ### group smartphones by the brand and processor brand and get the count of models and the average primary camera resolution(rear)

SELECT model,brand_name,processor_brand,primary_camera_rear FROM yourdb.smartphones_cleaned_v6;

SELECT brand_name,
processor_brand,os,
COUNT(*) AS 'number_of_phones',
AVG(primary_camera_rear) AS 'avg_primary_camera_rear'
FROM yourdb.smartphones_cleaned_v6
GROUP BY brand_name ,processor_brand,os;

- ### find top 5 most costly phone brands

SELECT brand_name,price FROM yourdb.smartphones_cleaned_v6;

SELECT brand_name,ROUND(AVG(price)) AS 'avg_price' FROM yourdb.smartphones_cleaned_v6
GROUP BY brand_name
ORDER BY avg_price DESC
LIMIT 5;

- ### which brand makes the smallest screen smartphones

SELECT brand_name, AVG(screen_size) AS 'avg_screen_size'
FROM yourdb.smartphones_cleaned_v6
GROUP BY brand_name
ORDER BY avg_screen_size ASC
LIMIT 1;

- ### avg price of 5g phones v/s avg price of non 5g phones
- ### group smartphones by the brand, and find the brand with the highest number of models that have both NFC and an IR blaster

SELECT model,brand_name,has_nfc,has_ir_blaster FROM yourdb.smartphones_cleaned_v6;

SELECT brand_name, COUNT(*) AS 'count'
FROM yourdb.smartphones_cleaned_v6
WHERE has_nfc = 'TRUE' AND has_ir_blaster = 'TRUE'
GROUP BY brand_name
ORDER BY count DESC
LIMIT 1;

- ### find all samsung 5g enabled smartphones and find out the avg price for NFC and non-NFC phones

SELECT model,brand_name,price,has_5g,has_nfc FROM yourdb.smartphones_cleaned_v6;

SELECT has_nfc, 
AVG(price) AS 'avg_price'
FROM yourdb.smartphones_cleaned_v6
WHERE brand_name = 'samsung'
GROUP BY has_nfc;

- ### find the phone name,price of the costliest phone

SELECT model,price FROM yourdb.smartphones_cleaned_v6
ORDER BY price DESC
LIMIT 1;

SELECT COUNT(*) FROM yourdb.smartphones_cleaned_v6;




---------- Having Clause


SELECT brand_name,
COUNT(*) AS 'count',
AVG(price) AS 'avg_price'
FROM yourdb.smartphones_cleaned_v6
GROUP BY brand_name
ORDER BY avg_price DESC;

SELECT brand_name,
COUNT(*) AS 'count',
AVG(price) AS 'avg_price'
FROM yourdb.smartphones_cleaned_v6
GROUP BY brand_name
HAVING count > 40;

- ### find the top 3 brands with the highest avg RAM that have a refresh rate of at least 90 Hz and fast charging available and consider brands which have less than 10 phones

SELECT brand_name,
AVG(ram_capacity) AS 'avg_ram'
FROM yourdb.smartphones_cleaned_v6
WHERE refresh_rate > 90 AND fast_charging_available = 1
GROUP BY brand_name
HAVING COUNT(*) > 10 
ORDER BY 'avg_ram' 
DESC LIMIT 3;

- ### find the avg price of all phone brands with avg rating > 70 and num_phones more than 10 among all 5g enabled phones

SELECT brand_name,
AVG(price) AS 'avg_price'
FROM yourdb.smartphones_cleaned_v6
WHERE has_5g = 'TRUE'
GROUP BY brand_name
HAVING AVG(rating) > 70 AND COUNT(*) > 10;