USE flower;
CREATE TABLE employees (
    emp_no INT PRIMARY KEY AUTO_INCREMENT,
    department VARCHAR(20),
    salary INT
);
 
INSERT INTO employees (department, salary) VALUES
('engineering', 80000),
('engineering', 69000),
('engineering', 70000),
('engineering', 103000),
('engineering', 67000),
('engineering', 89000),
('engineering', 91000),
('sales', 59000),
('sales', 70000),
('sales', 159000),
('sales', 72000),
('sales', 60000),
('sales', 61000),
('sales', 61000),
('customer service', 38000),
('customer service', 45000),
('customer service', 61000),
('customer service', 40000),
('customer service', 31000),
('customer service', 56000),
('customer service', 55000);
SELECT department, AVG(salary) FROM employees GROUP BY department WITH ROLLUP;
SELECT emp_no, department, salary, AVG(salary) OVER() FROM employees; -- over should come after aggregate func. OVER () = include all rows
SELECT emp_no, department, salary, MIN(salary) OVER(),MAX(salary) OVER() FROM employees;
SELECT emp_no, department, salary, MIN(salary), MAX(salary) FROM employees;
SELECT emp_no, department, salary, AVG(salary) OVER(PARTITION BY department) FROM employees;

SELECT emp_no, department, salary, AVG(salary) OVER(PARTITION BY department) AS dept_avg, AVG(salary) OVER() AS company_avg
FROM employees;
 
SELECT emp_no, department, salary, COUNT(*) OVER(PARTITION BY department) as dept_count
FROM employees;
 
SELECT emp_no, department, salary, SUM(salary) 
OVER(PARTITION BY department) AS dept_payroll, 
SUM(salary) OVER() AS total_payroll
FROM employees;
 
SELECT author_lname, COUNT(*) 
FROM books GROUP BY author_lname;

SELECT emp_no, department, salary,  
SUM(salary) OVER(PARTITION BY department ORDER BY salary) AS rolling_dept_salary, -- will sum each row together one by one
SUM(salary) OVER(PARTITION BY department) AS total_dept_salary
FROM employees;
 
SELECT emp_no, department, salary, MIN(salary) 
OVER(PARTITION BY department ORDER BY salary DESC) as rolling_min -- it will just show always data from first row in group 
FROM employees;

SELECT emp_no, department, salary,
    ROW_NUMBER() OVER(PARTITION BY department ORDER BY SALARY DESC) as dept_row_number,
    RANK() OVER(PARTITION BY department ORDER BY SALARY DESC) as dept_salary_rank,
    RANK() OVER(ORDER BY salary DESC) as overall_rank,
    DENSE_RANK() OVER(ORDER BY salary DESC) as overall_dense_rank, -- return results with no gaps. gaps appear when there are same values
    ROW_NUMBER() OVER(ORDER BY salary DESC) as overall_num
FROM employees ORDER BY overall_rank;

SELECT 
    emp_no, 
    department, 
    salary,
    NTILE(4) OVER(PARTITION BY department ORDER BY salary DESC) AS dept_salary_quartile,
	-- NTILE(4): To funkcja analityczna, która dzieli dane na cztery równe części (kwarty). 
    -- Używając tej funkcji, możemy zobaczyć, w którym kwartylu znajduje się dane wynagrodzenie
	NTILE(4) OVER(ORDER BY salary DESC) AS salary_quartile
FROM employees;

SELECT emp_no, department, salary,
    FIRST_VALUE(emp_no) OVER(PARTITION BY department ORDER BY salary DESC) as highest_paid_dept,
    FIRST_VALUE(emp_no) OVER(ORDER BY salary DESC) as highest_paid_overall
FROM employees;

SELECT emp_no, department, salary,
LAG (salary) OVER(ORDER BY salary DESC)
-- LAG pozwala na dostęp do wartości z poprzedniego wiersza w ramach zestawu wyników. 
-- Umożliwia to porównanie bieżącego wiersza z wierszem, który znajduje się przed nim.
FROM employees;

SELECT emp_no, department, salary,
salary - LEAD (salary) OVER(ORDER BY salary DESC) as salary_diff -- gives difference this row and previous
FROM employees;

SELECT emp_no, department, salary,
salary - LAG (salary) OVER(PARTITION BY department ORDER BY salary DESC) as dept_salary_diff  
FROM employees;