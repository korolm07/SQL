USE flower;
INSERT INTO books
    (title, author_fname, author_lname, released_year, stock_quantity, pages)
    VALUES ('10% Happier', 'Dan', 'Harris', 2014, 29, 256), 
           ('fake_book', 'Freida', 'Harris', 2001, 287, 428),
           ('Lincoln In The Bardo', 'George', 'Saunders', 2017, 1000, 367);
SELECT DISTINCT author_lname FROM books;
SELECT DISTINCT CONCAT(author_fname,' ', author_lname) FROM books; 
SELECT DISTINCT author_lname, author_fname FROM books; -- selects distinct combinations. ame as above but shorter
SELECT * FROM books ORDER BY author_lname; ---- ASC is default
SELECT * FROM books ORDER BY author_lname DESC;
SELECT title, pages FROM books ORDER BY pages;
SELECT book_id, author_fname, author_lname, pages FROM books ORDER BY 2 desc; -- order by 2nd selected element
SELECT book_id, author_fname, author_lname, pages FROM books ORDER BY author_lname, author_fname; -- first order by lname and then by fname
SELECT title, released_year FROM books ORDER BY released_year DESC LIMIT 14;
SELECT title, released_year FROM books ORDER BY released_year DESC LIMIT 0,5;
SELECT title, author_fname, author_lname, pages 
FROM books WHERE author_fname LIKE '%da%';
SELECT title, author_fname, author_lname, pages FROM books WHERE title LIKE '%:%';
SELECT * FROM books WHERE author_fname LIKE '____';
SELECT * FROM books WHERE author_fname LIKE '_a_'; -- _ means 1 char.
-- To select books with '%' in their title:
SELECT * FROM books WHERE title LIKE '%\%%';
 
-- To select books with an underscore '_' in title:
SELECT * FROM books WHERE title LIKE '%\_%';

SELECT title FROM books WHERE title LIKE '%Stories%';
SELECT title, CHAR_LENGTH(title) AS length FROM books ORDER by length DESC;
SELECT title, pages FROM books ORDER by pages DESC LIMIT 1;
SELECT CONCAT(title, ' - ', released_year) AS summary FROM books ORDER BY released_year DESC LIMIT 3;
SELECT title, author_lname FROM books WHERE author_lname LIKE '% %';
SELECT title, released_year, stock_quantity FROM books ORDER BY stock_quantity LIMIT 3;
SELECT title, author_lname FROM books ORDER by author_lname,title;
SELECT UPPER(CONCAT('MY FAVORITE AUTHOR IS ', author_fname, ' ', author_lname, '!')) AS 'yell' FROM books ORDER BY author_lname;

