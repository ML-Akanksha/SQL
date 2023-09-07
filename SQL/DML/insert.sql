--- DML 
--- 1) INSERT 

CREATE TABLE user(
	user_id INTEGER PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL
)
 SELECT * FROM yourdb.user;
 
 INSERT INTO yourdb.user (user_id,name,email,password)
 VALUES (NULL,'akanksha','akank@gmail.com',1234);

-- another way
 INSERT INTO yourdb.user
 VALUES (null,'rutu','rutu@gmail.com',421);
 
 INSERT INTO yourdb.user VALUES 
 (NULL,'kabeer','kabeer@outlook.com',2345),
 (NULL,'amit','amit@gmail.com',654),
 (NULL,'shreya','shreya@outlook.com',378);