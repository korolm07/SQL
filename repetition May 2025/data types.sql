USE flower;
CREATE TABLE products (price DECIMAL(5,2)); -- 5 digits in total, 2 from it will come in decimals
INSERT INTO products (price) VALUES (4.50);
INSERT INTO products (price) VALUES (456.99);
INSERT INTO products (price) VALUES (4569.9); -- will give error, 5 digits- 2 of each should be in decimals
SELECT * FROM products;
INSERT INTO products (price) VALUES (45.979); -- will give not error, but warning. It will still insert value, just will round it. 
SHOW WARNINGS;
-- FLOAT and double - less space and less precision.
CREATE TABLE numbers (x FLOAT, y DOUBLE); -- float is less precise
INSERT INTO numbers (x,y) VALUES (1.12345678, 1.12345678);
SELECT * FROM numbers;

CREATE TABLE people (
	name VARCHAR (100),
    birthdate DATE,
    birthtime TIME,
    birthdt DATETIME
);

INSERT INTO people (name, birthdate, birthtime, birthdt) 
VALUES ('Elton', '2000-12-25', '15:00:00', '2000-12-25 15:00:00');

SELECT * FROM people;
INSERT INTO people (name, birthdate, birthtime, birthdt) 
VALUES ('Kate', '1999-12-25', '11:00:00', '1999-12-25 11:00:00');

INSERT INTO people (name, birthdate, birthtime, birthdt) 
VALUES ('John', '1996-12-24', '11:00:00', '1996-12-24 11:00:00');

SELECT CURTIME();
SELECT CURDATE();
SELECT NOW();

INSERT INTO people (name, birthdate, birthtime, birthdt) 
VALUES ('Hazel', CURDATE(), CURTIME(), NOW());

SELECT birthdate FROM people;
SELECT birthdate, DAY(birthdate), DAYOFWEEK (birthdate), DAYOFYEAR(birthdate) FROM people; -- date functions
SELECT birthdate, MONTHNAME(birthdate), YEAR(birthdate) FROM people; 
SELECT name, birthtime, HOUR(birthtime), MINUTE(birthtime) FROM people; 
SELECT name, birthdt, DATE(birthdt), TIME(birthdt) FROM people; 
SELECT CONCAT(MONTH(birthdate), ' ', DAY (birthdate), ' ', YEAR (birthdate)) FROM people;

SELECT birthdate, DATE_FORMAT(birthdate, '%b') FROM people;
SELECT birthdate, DATE_FORMAT(birthdate, '%a %b %e %D') FROM people;
SELECT birthdt, DATE_FORMAT(birthdt, '%H %i') FROM people;
SELECT birthdt, DATE_FORMAT(birthdt, 'Born on: %r') FROM people;

-- Date math func: 
-- Funkcja DATEDIFF służy do obliczania różnicy między dwiema datami. 
-- Zwraca liczbę interwałów czasu (np. dni, miesięcy, lat) między dwiema podanymi datami. 
SELECT DATEDIFF(CURDATE(), birthdate) FROM people; 
SELECT TIMEDIFF('2000-01-01 00:00:00', '2020-01-01 00:00:00'); -- difference in time interval
SELECT TIMEDIFF(CURTIME(), '07:00:00'); 
SELECT DATE_ADD('2018-05-01', INTERVAL 1 DAY); -- add interval to date
SELECT DATE_ADD(CURDATE(), INTERVAL 12 YEAR); -- plus
SELECT DATE_SUB(CURDATE(), INTERVAL 12 YEAR); -- minus
SELECT 3-4;
SELECT NOW() - INTERVAL 18 YEAR; -- not years but year
SELECT name, birthdate, YEAR(birthdate + INTERVAL 21 YEAR) AS will_be_21 FROM people;
-- timestamps combine date and time. timestamps takes less storage then datetime. Support smaller range of dates
SELECT TIMESTAMP ('2022-10-05 17:53:28');

CREATE TABLE captions (
  text VARCHAR(150),
  created_at TIMESTAMP default CURRENT_TIMESTAMP
);
 
CREATE TABLE captions2 (
  text VARCHAR(150),
  created_at TIMESTAMP default CURRENT_TIMESTAMP,
  updated_at TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

INSERT INTO captions2 (text) VALUES ('hi world'); 
SELECT * FROM captions2; 
UPDATE captions2 SET text ='i love life'; -- updated at column wil change. 

SELECT DAYOFWEEK(CURDATE()); -- sunday is 1
SELECT DAYNAME(CURDATE());
SELECT DATE_FORMAT(CURDATE(), '%m/%d/%Y') AS date;

SELECT DATE_FORMAT(NOW(), '%M %D at %k:%i');
 
CREATE TABLE tweets(
    content VARCHAR(140),
    username VARCHAR(20),
    created_at TIMESTAMP DEFAULT NOW()
);
 
INSERT INTO tweets (content, username) VALUES('this is my first tweet', 'coltscat');
SELECT * FROM tweets;
 
INSERT INTO tweets (content, username) VALUES('this is my second tweet', 'coltscat');
SELECT * FROM tweets;


