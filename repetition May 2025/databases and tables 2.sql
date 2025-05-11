DROP TABLE shirts;
CREATE DATABASE shirts_db;
USE shirts_db;
CREATE table shirts (
shirt_id INT AUTO_INCREMENT PRIMARY KEY,
article VARCHAR(100) NOT NULL,
color VARCHAR(50) NOT NULL,
shirt_size VARCHAR(5) NOT NULL,
last_worn INT NOT NULL
);
INSERT INTO shirts (article, color, shirt_size, last_worn) 
VALUES 
('t-shirt', 'white', 'S', 10),
('t-shirt', 'green', 'S', 200),
('polo shirt', 'black', 'M', 10),
('tank top', 'blue', 'S', 50),
('t-shirt', 'pink', 'S', 0),
('polo shirt', 'red', 'M', 5),
('tank top', 'white', 'S', 200),
('tank top', 'blue', 'M', 15);
DESC shirts;
SELECT * FROM shirts;
INSERT INTO shirts (article, color, shirt_size, last_worn) 
VALUES 
('polo shirt','purple','M',50);
SELECT article, color FROM shirts;
SELECT article, color, shirt_size, last_worn FROM shirts WHERE shirt_size = 'M';
UPDATE shirts SET last_worn = 0 WHERE last_worn = 15;
UPDATE shirts SET shirt_size = 'XS', color = 'off white' WHERE color = 'white';
DELETE FROM shirts WHERE last_worn = 200;
DELETE FROM shirts;
DROP TABLE shirts;
