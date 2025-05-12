USE flower;
CREATE TABLE books 
	(
		book_id INT NOT NULL AUTO_INCREMENT,
		title VARCHAR(100),
		author_fname VARCHAR(100),
		author_lname VARCHAR(100),
		released_year INT,
		stock_quantity INT,
		pages INT,
		PRIMARY KEY(book_id)
	);

INSERT INTO books (title, author_fname, author_lname, released_year, stock_quantity, pages)
VALUES
('The Namesake', 'Jhumpa', 'Lahiri', 2003, 32, 291),
('Norse Mythology', 'Neil', 'Gaiman',2016, 43, 304),
('American Gods', 'Neil', 'Gaiman', 2001, 12, 465),
('Interpreter of Maladies', 'Jhumpa', 'Lahiri', 1996, 97, 198),
('A Hologram for the King: A Novel', 'Dave', 'Eggers', 2012, 154, 352),
('The Circle', 'Dave', 'Eggers', 2013, 26, 504),
('The Amazing Adventures of Kavalier & Clay', 'Michael', 'Chabon', 2000, 68, 634),
('Just Kids', 'Patti', 'Smith', 2010, 55, 304),
('A Heartbreaking Work of Staggering Genius', 'Dave', 'Eggers', 2001, 104, 437),
('Coraline', 'Neil', 'Gaiman', 2003, 100, 208),
('What We Talk About When We Talk About Love: Stories', 'Raymond', 'Carver', 1981, 23, 176),
("Where I'm Calling From: Selected Stories", 'Raymond', 'Carver', 1989, 12, 526),
('White Noise', 'Don', 'DeLillo', 1985, 49, 320),
('Cannery Row', 'John', 'Steinbeck', 1945, 95, 181),
('Oblivion: Stories', 'David', 'Foster Wallace', 2004, 172, 329),
('Consider the Lobster', 'David', 'Foster Wallace', 2005, 92, 343);

-- CONCAT combines text together
SELECT CONCAT('h','e','l','l','o');
SELECT CONCAT (author_fname, ' ', author_lname) AS fullname FROM books;
SELECT * FROM books;
SELECT CONCAT_WS('-',title, author_fname, author_lname) FROM books; -- WS add first element as separator

-- SUBSTRING - for part of text
SELECT SUBSTRING('Hello World', 1, 4); -- start at 1 and go 4 characters length
SELECT SUBSTRING('Hello World', 7); -- from 7 to the end
SELECT SUBSTRING('Hello World', -3); -- from -3 from the end and then it goes to the end
SELECT SUBSTRING(title, 1, 10) AS 'short title' FROM books;
SELECT SUBSTR(title, 1, 10) AS 'short title' FROM books; -- Substring func is same as Substr
SELECT CONCAT(SUBSTR(title,1,10), '...') AS 'short title' FROM books;
SELECT CONCAT(SUBSTR(author_fname,1,1), '.', SUBSTR(author_lname,1,1), '.') AS shortcuts FROM books;

SELECT REPLACE('Hello World', 'Hell', '%$#@');
SELECT REPLACE('Hello World', 'l', '7');
SELECT REPLACE('HellO World', 'o', '*');
SELECT
  REPLACE('cheese bread coffee milk', ' ', ' and ');
SELECT REPLACE(title, 'e ', '3') FROM books;
SELECT REPLACE(title, ' ', '-') FROM books; -- does not change original table! just retriew needed data and replace it.
SELECT * FROM books;
SELECT REVERSE ('chicken');
SELECT REVERSE (title) FROM books; -- does not change original table! just retriew needed data and reverse it.
SELECT LENGTH ('Hej!!!'); -- returns bites
SELECT CHAR_LENGTH ('Hej!!!'); -- returns real char length
SELECT CHAR_LENGTH (title) AS 'Length' FROM books;
SELECT UPPER('Hello World');
SELECT LOWER('Hello World');
SELECT UPPER(title) FROM books;
SELECT CONCAT('MY FAVORITE BOOK IS ', UPPER(title)) FROM books;
SELECT CONCAT('MY FAVORITE BOOK IS ', LOWER(title)) FROM books;
SELECT INSERT('Hello Bobby', 6, 0, 'There'); -- start at 6 position, 0 how man characters to replace
SELECT LEFT('omghahalol!', 3); -- selects 3 most characters from the left
SELECT RIGHT('omghahalol!', 4); -- selects 3 most characters from the right
SELECT REPEAT('ha', 4); -- repeats 4 times
SELECT TRIM('  pickle  '); -- removes spaces
SELECT REVERSE (UPPER('why does my cat look at me?'));
SELECT REPLACE (title, ' ', '->') AS title FROM books;
SELECT CONCAT(UPPER(author_fname), ' ', UPPER (author_lname)) 

AS 'full name in caps' FROM books;
SELECT CONCAT(title, 'was released in', released_year) AS 'blurb' FROM books;
SELECT title, CHAR_LENGTH(title) AS 'character count' FROM books;
SELECT CONCAT(SUBSTRING(title,1,8), '...') AS 'short title', 
CONCAT (author_lname, ',', author_fname) AS 'author', 
CONCAT (stock_quantity, ' in stock') AS 'quanity'
FROM books;