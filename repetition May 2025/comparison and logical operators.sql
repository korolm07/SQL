USE flower;
SELECT * FROM books WHERE released_year != 2017;
SELECT * FROM books WHERE author_lname != 'Gaiman';
SELECT title FROM books WHERE title LIKE '% %';
SELECT title FROM books WHERE title NOT LIKE '% %';
SELECT title, author_fname FROM books WHERE author_fname LIKE 'da%';
SELECT title, author_fname FROM books WHERE author_fname NOT LIKE 'da%';
SELECT title FROM books WHERE title LIKE '%e%';
SELECT * FROM books WHERE released_year > 2005;
SELECT 100>40; -- we will get 1 meaning true
SELECT 100>1000; -- we will get 0 meaning false
SELECT title, released_year FROM books WHERE released_year >=2010;
SELECT * FROM books WHERE author_lname = 'Eggers' AND released_year> 2010;

SELECT title, pages FROM books WHERE pages < 200 OR title LIKE '%stories%';
SELECT title, released_year FROM books WHERE released_year BETWEEN 2004 AND 2015;
SELECT title, released_year FROM books WHERE released_year NOT BETWEEN 2004 AND 2015;

SELECT title, author_lname FROM books 
WHERE author_lname = 'Carver' 
OR author_lname = 'Lahiri'
OR author_lname = 'Smith'; -- we need to write many times author_lname , alternative nicer way: 
SELECT title, author_lname FROM books 
WHERE author_lname IN ('Carver','Lahiri','Smith');
SELECT title, author_lname FROM books 
WHERE author_lname NOT IN ('Carver','Lahiri','Smith');

SELECT title, author_lname, released_year FROM books 
WHERE released_year  NOT IN (2008,2002,2004,2006) AND released_year > 2000;

SELECT 17 % 6;

SELECT title, author_lname, released_year FROM books 
WHERE released_year%2 != 0  AND released_year > 2000; -- only odd num years

SELECT title, released_year,
CASE
	WHEN released_year >= 2000 THEN 'modern lit'
    ELSE '20th century lit' 
END AS genre
FROM books;
 
 
SELECT 
    title,
    stock_quantity,
    CASE
        WHEN stock_quantity BETWEEN 0 AND 40 THEN '*'
        WHEN stock_quantity BETWEEN 41 AND 70 THEN '**'
        WHEN stock_quantity BETWEEN 71 AND 100 THEN '***'
        WHEN stock_quantity BETWEEN 101 AND 140 THEN '****'
        ELSE '*****'
    END AS stock
FROM
    books;
 
 
SELECT 
    title,
    stock_quantity,
    CASE
        WHEN stock_quantity <= 40 THEN '*'
        WHEN stock_quantity <= 70 THEN '**'
        WHEN stock_quantity <= 100 THEN '***'
        WHEN stock_quantity <= 140 THEN '****'
        ELSE '*****'
    END AS stock
FROM
    books;
    
SELECT * FROM books WHERE title IS NULL;

SELECT title, author_lname,
CASE
    WHEN title LIKE '%stories%' THEN 'Short Stories'
    WHEN title = 'Just Kids' THEN 'Memoir' 
    WHEN title = 'A Heartbreaking Work of Staggering Genius' THEN 'Memior'
    ELSE 'Novel'
END AS type
FROM books;

SELECT author_fname, author_lname,
	CASE
        WHEN COUNT(*) = 1 THEN '1 book'
        ELSE CONCAT(COUNT(*), ' books')
	END AS count
FROM books
WHERE author_lname IS NOT NULL
GROUP BY author_fname, author_lname;

SELECT title, author_lname
FROM books WHERE SUBSTR(author_lname, 1, 1) in ('C', 'S');