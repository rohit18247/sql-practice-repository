Create DATABASE IF NOT exists UBER3;
SHOW DATABASES;

USE UBER3;

-- Create Employees Table
CREATE TABLE Employees (
  employee_id INT PRIMARY KEY,
  first_name VARCHAR(50),
  last_name VARCHAR(50),
  department VARCHAR(50),
  job_title VARCHAR(50)
);

-- Insert sample data into Employees table
INSERT INTO Employees (employee_id, first_name, last_name, department, job_title)
VALUES
  (1, 'John', 'Doe', 'Sales', 'Sales Manager'),
  (2, 'Jane', 'Doe', 'Sales', 'Sales Rep'),
  (3, 'Bob', 'Smith', 'Marketing', 'Marketing Manager'),
  (4, 'Alice', 'Jones', 'Marketing', 'Marketing Coordinator');

-- Create Salaries Table
CREATE TABLE Salaries (
  employee_id INT,
  salary INT,
  start_date DATE,
  end_date DATE
);

-- Insert sample data into Salaries table
INSERT INTO Salaries (employee_id, salary, start_date, end_date)
VALUES
  (1, 100000, '2020-01-01', '2020-12-31'),
  (2, 60000, '2020-01-01', '2020-12-31'),
  (3, 90000, '2020-01-01', '2020-12-31'),
  (4, 50000, '2020-01-01', '2020-12-31');
  
  -- display info : 
  
  select * from Employees;
  select * from Salaries;
  
  SELECT
  s.start_date,
  e.department,
  e.job_title,
  s.salary,
  SUM(s.salary) OVER (PARTITION BY e.department, e.job_title ORDER BY s.start_date) AS running_total_salary
FROM employees e
JOIN salaries s ON e.employee_id = s.employee_id
ORDER BY e.department, e.job_title, s.start_date;

-- window functions 
USE ORG;

-- to see the power of dense rank : 
select worker_id,first_name,last_name,salary, 
dense_rank() over (order by salary desc) as dense_ranking
from worker ;

-- to see the power of rank : 
select worker_id, first_name, last_name,salary,
rank() over (order by salary desc) as normal_ranking
from worker;

-- to see the row number 1
select worker_id,first_name,last_name,salary,
row_number() over (order by salary desc) as row_numbering
from worker;

-- effects of partitioning (grouping based on a specific attributes - yet not loosing the individual rows) : 
-- to see the row number 2
select worker_id,first_name,last_name,salary,
row_number() over (partition by salary order by salary desc) as row_numbering
from worker; 

select worker_id,first_name,last_name,salary,
rank() over (partition by salary order by salary desc) as rank_numbering
from worker; 

select worker_id,first_name,last_name,salary,
dense_rank() over (partition by salary order by salary desc) as dense_rank_numbering
from worker; 









