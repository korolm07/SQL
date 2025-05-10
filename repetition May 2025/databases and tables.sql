DROP DATABASE snake; -- delete 
DROP TABLE age; 
SHOW DATABASES; 
SHOW TABLES; 

CREATE DATABASE petshop; 
USE petshop; 
SELECT database(); -- shows which Im in now 
CREATE TABLE cats ( 
name VARCHAR(50), 
age INT 
); 
CREATE TABLE dogs ( 
name VARCHAR(50), 
breed VARCHAR(50), 
age INT 
);
SHOW COLUMNS FROM cats; 
DESC cats; -- we will get same result as from command above , this one is quicker 
CREATE TABLE pastries ( 
name VARCHAR(50), 
quanitity INT 
);
DESC pastries;
DROP TABLE pastries; 

INSERT INTO cats (name, age) 
VALUES ('Blue Steele', 5);

INSERT INTO cats (name, age) 
VALUES 
('Kate', 7),
('Turkey',1),
('Potato',3);

DESC cats;
SELECT * FROM cats;

CREATE TABLE people ( 
firstname VARCHAR(20), 
lastname VARCHAR(20), 
age INT 
);
DESC people;

INSERT INTO people (firstname, lastname, age) 
VALUES 
('Linka', 'Black', 7),
('Calvin','Blue', 1),
('Filip', 'Rose', 3);
SELECT * FROM people;
DROP TABLE people;

CREATE TABLE cats2 (
name VARCHAR(50) NOT NULL, 
age INT NOT NULL);

INSERT INTO cats2 (name, age) 
VALUES 
('Linka',1);

INSERT INTO cats2 (age) 
VALUES (1); -- because of NOT NULL this will not work with no name
desc cats2;
desc cats;

SELECT name FROM cats WHERE age = 4;
SELECT name AS MyCat FROM cats WHERE age = 4; -- temporary Aliases to change collumn name
UPDATE cats SET age = 5 WHERE name = 'Egg';
USE petshop;
SELECT * FROM cats;
UPDATE people SET age = 30; -- to update all , do carefully!!
UPDATE people SET age = 22 WHERE firstname = 'Filip';
UPDATE cats SET name = 'Miki' WHERE name = 'Kate';
DELETE FROM cats WHERE name = 'Miki';
CREATE TABLE cats3
(
    name VARCHAR(100) DEFAULT 'unnamed', 
    age INT DEFAULT 99
);
INSERT INTO cats3(age) VALUES (2);
SELECT * FROM cats3;

CREATE TABLE unique_cats (
cat_id INT NOT NULL PRIMARY KEY, -- allows to insert to this row only unique numbers 
name VARCHAR(100), 
age INT
);
DESC unique_cats;

CREATE TABLE unique_cats2 (
    cat_id INT AUTO_INCREMENT, -- very useful!!!
    name VARCHAR(100) NOT NULL,
    age INT NOT NULL,
    PRIMARY KEY (cat_id)
);

INSERT INTO unique_cats2 (name,age) VALUES ('sally', 2), ('rod',2);
SELECT * FROM unique_cats2;

CREATE TABLE employees (
    id INT AUTO_INCREMENT PRIMARY KEY,
    last_name VARCHAR(100) NOT NULL,
	middle_name VARCHAR(100) NOT NULL,
    age INT NOT NULL,
    current_status VARCHAR(50) DEFAULT 'employed' NOT NULL
);
SELECT * FROM employees;