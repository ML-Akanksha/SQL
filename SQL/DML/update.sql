--- DML
--- 3) UPDATE

SELECT * FROM yourdb.smartphones_cleaned_v6;

SELECT DISTINCT processor_brand FROM yourdb.smartphones_cleaned_v6;

- ### find all phones whose processor_brand is dimensity

SELECT brand_name,model,processor_brand FROM yourdb.smartphones_cleaned_v6
WHERE processor_brand = 'dimensity';

- ### whereever processor brand is dimensity replace it with mediatek

UPDATE yourdb.smartphones_cleaned_v6
SET processor_brand = 'mediatek'
WHERE processor_brand = 'dimensity';
-- (Can't update bcoz there might not be a primary key but if you disable safe mode from mysql workbench it will work)
-- disable safe mode : edit >> preferences >> sql editor >> safe updates (uncheck) >> ok

UPDATE yourdb.smartphones_cleaned_v6
SET processor_brand = 'mediatek'
WHERE processor_brand = 'dimensity';

SELECT brand_name,model,processor_brand FROM yourdb.smartphones_cleaned_v6
WHERE processor_brand = 'dimensity';

- ### change email address domain gmail.com to yahoo.com
SELECT * FROM yourdb.user;

UPDATE yourdb.user
SET email = 'rutu@yahoo.com', password = '7648095'
WHERE name = 'rutu';
