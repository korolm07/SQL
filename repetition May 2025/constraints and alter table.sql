USE flower;
CREATE TABLE contacts (
	NAME VARCHAR(100) NOT NULL,
	phone VARCHAR(15)  NOT NULL UNIQUE);
INSERT INTO contacts (name, phone) 
VALUES ('billybob','87811123');
INSERT INTO contacts (name, phone) 
VALUES ('caroline','87811123'); -- will not work with same tel number 
CREATE TABLE users (
    name VARCHAR(50) NOT NULL,
    age INT CHECK (age > 18)
);
INSERT INTO users (name, age) 
VALUES ('bluethecat', 50);
INSERT INTO users (name, age) 
VALUES ('mik', 11);
SELECT * FROM users;
CREATE table palindromes(
	word VARCHAR(100) CHECK(REVERSE(word)=word)
 ); -- under check we can put different checks as we want
 INSERT INTO palindromes (word) VALUES ('racecar');
 INSERT INTO palindromes (word) VALUES ('car'); -- will fail 
 CREATE TABLE users2 (
    name VARCHAR(50) NOT NULL,
    age INT,
    CONSTRAINT age_not_negative CHECK (age >=0) -- if wrong insert - we will get nicer explanation of error 
);
INSERT INTO users2 (name, age)
VALUES ('cherry', -10);
CREATE TABLE companies (
    name VARCHAR(255) NOT NULL,
    address VARCHAR(255) NOT NULL,
    CONSTRAINT name_address UNIQUE (name , address) -- unique as a combination
);
CREATE TABLE houses (
  purchase_price INT NOT NULL,
  sale_price INT NOT NULL,
  CONSTRAINT sprice_gt_pprice CHECK(sale_price >= purchase_price)
);

ALTER TABLE companies 
ADD COLUMN phone VARCHAR(15);
 
ALTER TABLE companies
ADD COLUMN employee_count INT NOT NULL DEFAULT 1;
ALTER TABLE companies DROP COLUMN phone;
SELECT * FROM companies; 
INSERT INTO houses (purchase_price,sale_price) VALUES (100,200);
INSERT INTO houses (purchase_price,sale_price) VALUES (700,200); -- will give error
SELECT * FROM companies;
ALTER TABLE companies ADD COLUMN phone VARCHAR (15);
ALTER TABLE companies ADD COLUMN employee_count INT NOT NULL DEFAULT 1;
ALTER TABLE companies DROP COLUMN phone;
SHOW TABLES;
RENAME TABLE companies TO supploers;
ALTER TABLE supploers RENAME TO companies; -- alternative to above
ALTER TABLE companies RENAME COLUMN name TO company_name;
DESC companies;
ALTER TABLE companies MODIFY company_name VARCHAR(100) DEFAULT "unknown"; -- to modify type
ALTER TABLE companies CHANGE address employee_address VARCHAR(50); -- to modyfy column name and type
ALTER TABLE houses ADD CONSTRAINT positive_pprice CHECK (sale_price >= 0);
INSERT INTO houses (purchase_price, sale_price) VALUES (7,-4); -- will give error. 
ALTER TABLE houses DROP CONSTRAINT positive_pprice;
SELECT * FROM houses;
