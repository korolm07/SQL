USE flower;
CREATE TABLE account(
user_id SERIAL PRIMARY KEY,
username VARCHAR(50) UNIQUE NOT NULL,
password VARCHAR(50) NOT NULL,
email VARCHAR(250) UNIQUE NULL, 
created_on TIMESTAMP NOT NULL,
last_login TIMESTAMP
);
SELECT DATABASE ();
SHOW TABLES;
DESCRIBE account;

CREATE TABLE job(
job_id SERIAL PRIMARY KEY,
job_name VARCHAR(200) UNIQUE NOT NULL
);

CREATE TABLE account_job(
user_id INTEGER REFERENCES account(user_id),
job_id INTEGER REFERENCES job(job_id),
hire_date TIMESTAMP
);

SELECT * FROM account;
INSERT INTO account (username,password,email,created_on)
VALUES
('Jose','password','jose@mail.com',current_timestamp());

INSERT INTO job(job_name)
VALUES
('Astronaut');
SELECT * FROM job;
INSERT INTO job(job_name)
VALUES
('President');

INSERT INTO account_job(user_id,job_id,hire_date)
VALUES 
(1,1,current_timestamp());

SELECT * FROM  account_job;
-- based on another column: 
UPDATE account 
SET last_login = created_on;
SELECT * FROM account;

UPDATE account 
SET last_login = current_timestamp();
-- update join: 
UPDATE account_job
JOIN account ON account_job.user_id = account.user_id
SET account_job.hire_date = account.created_on;
SELECT * FROM account_job;

-- returning keyword, works in PostgreSQL: 
UPDATE account
SET last_login = current_timestamp()
RETURNING email,created_on,last_logiin;

-- for mySQL:
-- Update the record
UPDATE account
SET last_login = current_timestamp();
-- WHERE username = 'Jose'; condition can be sued

-- Retrieve the updated data
SELECT email, created_on, last_login
FROM account;

INSERT INTO job(job_name)
VALUES 
('Cowboy');
SELECT * FROM job;
DELETE FROM job
WHERE job_name = 'Cowboy';

CREATE TABLE information(
info_id SERIAL PRIMARY KEY,
title VARCHAR(500) NOT NULL,
person VARCHAR(50) NOT NULL UNIQUE);

SELECT * FROM information;
ALTER TABLE information
RENAME TO new_info;

ALTER TABLE new_info
RENAME COLUMN person TO people;

-- works in postgre: 
ALTER TABLE new_info
ALTER COLUMN people DROP NOT NULL;

ALTER TABLE new_info
MODIFY people VARCHAR(50);

INSERT INTO new_info(title)
VALUES 
('some new title');
SELECT * FROM new_info;

ALTER TABLE new_info
DROP COLUMN people;

ALTER TABLE new_info
DROP COLUMN IF EXISTS people;

CREATE TABLE students(
student_id SERIAL PRIMARY KEY,
first_name VARCHAR(50) NOT NULL,
last_name VARCHAR(50) NOT NULL,
homeroom_number INT,
phone VARCHAR(20) UNIQUE,
email VARCHAR(250) UNIQUE, 
graduation_year INT
);

CREATE TABLE teachers(
teacher_id SERIAL PRIMARY KEY,
first_name VARCHAR(50) NOT NULL,
last_name VARCHAR(50) NOT NULL
);

ALTER TABLE teachers
ADD COLUMN homeroom_number INT,
ADD COLUMN department VARCHAR(50) NOT NULL,
ADD COLUMN email VARCHAR(250) UNIQUE, 
ADD COLUMN phone VARCHAR(20) UNIQUE;

INSERT INTO students(first_name,last_name, homeroom_number,phone,graduation_year)VALUES ('Mark','Watney',5,'7755551234',2035);
INSERT INTO teachers(first_name,last_name, homeroom_number,department,email,phone)VALUES ('Jonas','Salk',5,'Biology','jsalk@school.org','7755554321');

SELECT * FROM students;
SELECT * FROM teachers;