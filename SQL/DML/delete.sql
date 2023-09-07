--- DML
--- 4) DELETE
--  ( will selectively delete rows)

SELECT * FROM yourdb.smartphones_cleaned_v6
WHERE price > 200000;

- ### delete all phone whose price > 2 lakh

DELETE FROM yourdb.smartphones_cleaned_v6
WHERE price > 200000;


- ### delete samsung phones whose primary camera rear > 150 mega pixel

DELETE FROM yourdb.smartphones_cleaned_v6
WHERE primary_camera_rear > 150 AND brand_name = 'samsung';

SELECT primary_camera_rear,brand_name FROM yourdb.smartphones_cleaned_v6
WHERE primary_camera_rear > 150 AND brand_name = 'samsung';

SELECT * FROM yourdb.smartphones_cleaned_v6
WHERE primary_camera_rear > 150;
