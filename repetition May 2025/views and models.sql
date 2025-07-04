USE flower;
CREATE VIEW full_reviews AS
SELECT title, released_year, genre, rating, first_name, last_name FROM reviews
JOIN series ON series.id = reviews.series_id
JOIN reviewers ON reviewers.id = reviews.reviewer_id;
 
-- NOW WE CAN TREAT THAT VIEW AS A VIRTUAL TABLE 
-- (AT LEAST WHEN IT COMES TO SELECTING)
SELECT * FROM full_reviews;
show tables; -- that virtual table is here 

CREATE VIEW ordered_series AS
SELECT * FROM series ORDER BY released_year; -- simple view

SELECT * FROM ordered_series;
INSERT INTO ordered_series (title, released_year, genre) 
VALUES ('the one', 2020, 'comedy'); -- not all views we can change, 
-- this one we can, bcs it is simple and we do not break any rules, there is no group by or subquery

SELECT * FROM ordered_series;
CREATE OR REPLACE VIEW ordered_series AS
SELECT * FROM series ORDER BY released_year DESC;
 
ALTER VIEW ordered_series AS
SELECT * FROM series ORDER BY released_year;
 
DROP VIEW ordered_series;

SELECT title, AVG(rating), COUNT(rating) AS count
FROM full_reviews
GROUP BY title HAVING COUNT(rating) > 1;

SELECT title, AVG(rating) FROM full_reviews GROUP BY title WITH ROLLUP;
SELECT title, COUNT(rating) FROM full_reviews GROUP BY title WITH ROLLUP;

-- if we group multiple columns: 
SELECT released_year, genre, AVG(rating) FROM full_reviews 
GROUP BY released_year, genre WITH ROLLUP; -- higher level of summary statistics

SELECT @@GLOBAL.sql_mode;
SELECT @@SESSION.sql_mode;
-- strict trans tables: rule on how sql handles missing or invalid data
SET SESSION sql_mode = ''; -- disables all rules for this session only. 
INSERT INTO reviews (rating) VALUES ('hi'); 
SHOW WARNINGS; -- it just warn, bur still inserts
SELECT * FROM reviews;
SET SESSION sql_mode = 'STRICT_TRANS_TABLES';
SET SESSION sql_mode = 'ONLY_FULL_GROUP_BY';
SELECT title, rating FROM series 
JOIN reviews ON reviews.series_id = series.id
GROUP BY title; -- will not work in mode we set up above 

