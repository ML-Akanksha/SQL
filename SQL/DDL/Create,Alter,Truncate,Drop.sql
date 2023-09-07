--- DDL 
--- DDL command for database : create, drop 

CREATE DATABASE db_1;

CREATE DATABASE IF NOT EXISTS db_1;

DROP DATABASE db_1;

--- DDL command for table : create, alter (add,drop,modify), truncate, drop

CREATE DATABASE db;

USE db;

CREATE TABLE student(
	student_id INTEGER,
    name VARCHAR(255),
    email VARCHAR(255),
    password VARCHAR(255)
);

SELECT * FROM db.student;

ALTER TABLE student ADD COLUMN pan_number VARCHAR(255);

ALTER TABLE student ADD COLUMN surname VARCHAR(255) AFTER name;

ALTER TABLE student DROP COLUMN password;

ALTER TABLE student MODIFY surname VARCHAR(255) NULL;

TRUNCATE TABLE student;

DROP TABLE student;