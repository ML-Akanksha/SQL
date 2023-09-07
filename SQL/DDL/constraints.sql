--- Constraints : not null, unique, primary key, auto_increment, check, default, foreign key
USE db;

CREATE TABLE student(
	roll_no INTEGER PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    gender CHAR(1),
    cgpa FLOAT,
    email VARCHAR(255) UNIQUE,
    password VARCHAR(255),
    age INTEGER CHECK (age > 6 AND age < 25),
    travel_date DATETIME DEFAULT CURRENT_TIMESTAMP
);

SELECT * FROM db.student;

CREATE TABLE customer(
	c_id INTEGER AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL
);

SELECT * FROM db.customer;

CREATE TABLE orders(
	o_id INTEGER AUTO_INCREMENT PRIMARY KEY,
    c_id INTEGER,
    orders_date DATETIME,
    CONSTRAINT orders_c_id_foreignkey FOREIGN KEY (c_id) REFERENCES customer(c_id)
);

SELECT * FROM db.orders;


