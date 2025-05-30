USE flower;
SELECT COUNT(*) FROM books; -- result is one value
SELECT title, author_fname, COUNT (*) FROM books; -- will not work, as we asked for 1 value + titles, fname.
SELECT COUNT(DISTINCT author_fname) FROM books;
SELECT COUNT(DISTINCT released_year) FROM books;
SELECT COUNT(DISTINCT author_lname) FROM books;
SELECT COUNT(*) AS 'num' FROM books WHERE title LIKE '%the%';

SELECT author_lname AS 'books written', COUNT(title) FROM books GROUP BY author_lname;
SELECT released_year, COUNT(*) AS books_amount FROM books GROUP BY released_year; -- group by always come with some aggregate func
SELECT title FROM books GROUP BY author_lname; -- no aggregate func, no chance to work

SELECT MIN(released_year) FROM books; 
SELECT MIN(author_lname), MAX(author_lname) FROM books;
SELECT title, pages FROM books WHERE pages = (SELECT MAX(pages) FROM books); -- this is subquery: query inside query
INSERT INTO books(title, pages) VALUES ('my life in wors', 634);

SELECT title, released_year FROM books WHERE released_year = (SELECT MIN(released_year) FROM books);
SELECT author_lname, MIN(released_year) FROM books GROUP BY author_lname;
 
SELECT author_lname, MAX(released_year), MIN(released_year) FROM books GROUP BY author_lname;
 
SELECT 
	author_lname, 
	COUNT(*) as books_written, 
	MAX(released_year) AS latest_release,
	MIN(released_year)  AS earliest_release,
      MAX(pages) AS longest_page_count
FROM books GROUP BY author_lname;
 
 
SELECT 
	author_lname, 
        author_fname,
	COUNT(*) as books_written, 
	MAX(released_year) AS latest_release,
	MIN(released_year)  AS earliest_release
FROM books GROUP BY author_lname, author_fname;
SELECT * FROM books;
SELECT COUNT(title) FROM books;
SELECT COUNT(title) AS books_num, released_year FROM books GROUP BY released_year;
SELECT SUM(stock_quantity) FROM books;
SELECT AVG(released_year), author_lname, author_fname FROM books GROUP BY author_lname, author_fname;
SELECT 
    CONCAT(author_lname, author_fname) AS full_name, pages
    FROM books 
    ORDER BY pages DESC LIMIT 2;
    
-- alternative way:
SELECT CONCAT(author_lname, ' ', author_fname) AS full_name FROM books
WHERE pages = (SELECT MAX(pages) FROM books);

SELECT
    released_year AS year, COUNT(DISTINCT title) AS '# books', AVG (pages) AS 'avg pages'
    FROM books
    GROUP BY year
    ORDER BY year;
    