/*practice window functions: */

Create DATABASE IF NOT exists ORG;
SHOW DATABASES;

USE ORG;

CREATE TABLE Worker(
WORKER_ID INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
FIRST_NAME VARCHAR(25),
LAST_NAME VARCHAR(25),
SALARY INT,
JOINING_DATE DATETIME,
DEPARTMENT CHAR(25)
);

INSERT INTO Worker 
(WORKER_ID, FIRST_NAME, LAST_NAME, SALARY, JOINING_DATE, DEPARTMENT) VALUES
(001, 'Monika', 'Arora', 100000, '14-02-20 09:00:00', 'HR'),
(002, 'Niharika', 'Verma', 80000, '14-06-11 09:00:00', 'Admin'),
(003, 'Vishal', 'Singhal', 300000, '14-02-20 09:00:00', 'HR'),
(004, 'Amitabh', 'Singh', 500000, '14-02-20 09:00:00', 'Admin'),
(005, 'Vivek', 'Bhati', 500000, '14-06-11 09:00:00', 'Admin'),
(006, 'Vipul', 'Diwan', 200000, '14-06-11 09:00:00', 'Account'),
(007, 'Satish', 'Kumar', 75000, '14-01-20 09:00:00', 'Account'),
(008, 'Geetika', 'Chauhan', 90000, '14-04-11 09:00:00', 'Admin');

SELECT * FROM WORKER;


CREATE TABLE IF Not exists Bonus (
WORKER_REF_ID INT,
BONUS_AMOUNT INT,
BONUS_DATE DATETIME,
FOREIGN KEY (WORKER_REF_ID)
REFERENCES Worker (WORKER_ID)
ON DELETE CASCADE
);
INSERT INTO Bonus
(WORKER_REF_ID, BONUS_AMOUNT, BONUS_DATE) VALUES
(001, 5000, '16-02-20'),
(002, 3000, '16-06-11'),
(003, 4000, '16-02-20'),
(001, 4500, '16-02-20'),
(002, 3500, '16-06-11');

CREATE TABLE Title (
WORKER_REF_ID INT,
WORKER_TITLE CHAR(25),
AFFECTED_FROM DATETIME,
FOREIGN KEY (WORKER_REF_ID)
REFERENCES Worker (WORKER_ID)
ON DELETE CASCADE
);

INSERT INTO Title
(WORKER_REF_ID, WORKER_TITLE, AFFECTED_FROM) VALUES
(001, 'Manager', '2016-02-20 00:00:00'),
(002, 'Executive', '2016-06-11 00:00:00'),
(008, 'Executive', '2016-06-11 00:00:00'),
(005, 'Manager', '2016-06-11 00:00:00'),
(004, 'Asst. Manager', '2016-06-11 00:00:00'),
(007, 'Executive', '2016-06-11 00:00:00'),
(006, 'Lead', '2016-06-11 00:00:00'),
(003, 'Lead', '2016-06-11 00:00:00');

-- practicing window functions : row_number, rank, dense_rank : 
-- Certainly! Here are a few SQL queries based on window functions (ROW_NUMBER, RANK, DENSE_RANK) that you can practice with the given schema:
-- answers some of which are incorrect - because you are applying the partition on the wrong things. 

-- 1. Retrieve the row number for each worker based on their salary in descending order:
select row_number() over(order by salary desc) as row_num_each_worker, salary from worker; 

-- 2. Rank workers based on their salary:
select rank() over(partition by salary order by salary desc) as rank_worker_salary, salary from worker; 

-- 3. Assign dense ranks to workers based on their salary:
select dense_rank() over(partition by salary order by salary desc) as dense_rank_worker_salary, salary from worker; 

-- 4. Get the row number for each bonus amount in the Bonus table:
select row_number() over (partition by bonus_amount order by bonus_amount) 
as bonus_row_num, bonus_amount from 
worker w left join bonus b on w.worker_id = b.worker_ref_id; 

-- 5. Rank workers based on their bonus amount:
select rank() over(partition by bonus_amount order by bonus_amount desc) 
as rank_bonus, bonus_amount
from worker w left join bonus b 
on w.worker_id = b.worker_ref_id ; 

-- 
-- 6. Calculate the average salary for each department, along with the rank of each worker's salary within their department:
	
SELECT 
  FIRST_NAME, LAST_NAME, SALARY, DEPARTMENT,
  AVG(SALARY) OVER (PARTITION BY DEPARTMENT) AS AvgSalary,
  RANK() OVER (PARTITION BY DEPARTMENT ORDER BY SALARY DESC) AS rank_department
FROM Worker;
    
-- 7. Determine the dense rank of each worker's salary within their department, considering only workers who joined on 2014-02-20 09:00:00:
-- 
select dense_rank() over(partition by department order by salary,first_name desc) 
as dense_rank_worker_salary, first_name,last_name, salary, department,joining_date 
from worker where joining_date = '2014-02-20 09:00:00'; 

-- correctly done. 
 
-- 8. Calculate the total bonus amount for each worker and display the row number for each bonus amount within the worker's department:
-- 

-- select row_number() over()  from worker w left join bonus b on w.worker_id = b.worker_ref_id; 
-- 



/*
1. ```sql
SELECT 
  FIRST_NAME, LAST_NAME, SALARY,
  ROW_NUMBER() OVER (ORDER BY SALARY DESC) AS RowNumber
FROM Worker;
```
2. ```sql
SELECT 
  FIRST_NAME, LAST_NAME, SALARY,
  RANK() OVER (ORDER BY SALARY DESC) AS Rank
FROM Worker;
```

3.```sql
SELECT 
  FIRST_NAME, LAST_NAME, SALARY,
  DENSE_RANK() OVER (ORDER BY SALARY DESC) AS DenseRank
FROM Worker;
```
4.
```sql
SELECT 
  BONUS_AMOUNT,
  ROW_NUMBER() OVER (ORDER BY BONUS_AMOUNT) AS RowNumber
FROM Bonus;
```
5.
```sql
SELECT 
  W.FIRST_NAME, W.LAST_NAME, B.BONUS_AMOUNT,
  RANK() OVER (PARTITION BY B.WORKER_REF_ID ORDER BY B.BONUS_AMOUNT DESC) AS Rank
FROM Worker W
JOIN Bonus B ON W.WORKER_ID = B.WORKER_REF_ID;
```
6.
```sql
SELECT 
  FIRST_NAME, LAST_NAME, SALARY, DEPARTMENT,
  AVG(SALARY) OVER (PARTITION BY DEPARTMENT) AS AvgSalary,
  RANK() OVER (PARTITION BY DEPARTMENT ORDER BY SALARY DESC) AS Rank
FROM Worker;
```
7.

```sql
SELECT 
  FIRST_NAME, LAST_NAME, SALARY, DEPARTMENT, JOINING_DATE,
  DENSE_RANK() OVER (PARTITION BY DEPARTMENT ORDER BY SALARY DESC) AS DenseRank
FROM Worker
WHERE JOINING_DATE >= '2014-06-01';
```
8.
```sql
SELECT 
  W.FIRST_NAME, W.LAST_NAME, B.WORKER_REF_ID, BONUS_AMOUNT,
  SUM(BONUS_AMOUNT) OVER (PARTITION BY B.WORKER_REF_ID) AS TotalBonus,
  ROW_NUMBER() OVER (PARTITION BY W.DEPARTMENT ORDER BY BONUS_AMOUNT) AS RowNumber
FROM Worker W
JOIN Bonus B ON W.WORKER_ID = B.WORKER_REF_ID;
```
*/

