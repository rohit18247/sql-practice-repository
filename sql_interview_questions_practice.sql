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

/*
DELETE FROM WORKER;
*/
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

select * from Bonus; 
select * from Title;
select * from Worker; 

/* Top 50 Interview Questions :  

https://www.youtube.com/watch?v=vIq9zkpGWc8

all containts the link to the questions, db schema and notes in the schema; 
*/

/*Answers are by me unless specified as sir's answer : */

 -- 1. Write an sql query to fetch "FIRST_NAME" from Worker table using the alias name as <WORKER_NAME>. 
 -- Answer : 
	select first_name AS WORKER_NAME from worker;

 -- 2. Write an SQL query to fetch "FIRST_NAME" from worker table in upper case. 
 -- Answer : 
	select upper(first_name) from worker; 
    
 -- 3. Write an sql query to fetch unique values of DEPARTMENT from Worker table. 
	select distinct department from worker;
 
 -- 4. Write an sql query to print the first three characteres of first name from worker table. 
	select left(first_name,3) from worker; 
  
 -- 5. write an sql query to find the position of the alphabet ('b') in the first name column 'Amitabh' from worker table. 
	select locate("b","Amitabh") as match_position; /* *works fine. */ 
 
 -- 6. write an sql query to print the FIRST_NAME from worker table after removing white spaces from the right side. 
	select first_name from worker; 
 
 -- 7. write an sql query to print the department from worker table after removing white spaces from the left side. 
	select distinct department from worker; 
    
 -- 8. write an sql query that fetches the unique values of DEPARTMENT from Worker table and prints its length. 
	select distinct department, length(department) as length_department_name from worker;
    
 -- 9. Write an sql query to print the first_name from worker table after replacing 'a' with 'A'. 
	select * from worker; 
	

-- 10. write an sql query to print the FIRST_NAME and LAST_NAME from worker table in a single column COMPLETE_NAME. 
-- a space char should separate these
-- hint : https://stackoverflow.com/questions/22739841/mysql-combine-two-columns-into-one-column
SELECT CONCAT(first_name,' ',last_name) AS full_name from worker; 

-- 11. write an sql query to print all worker details from the worker table order by FIRST_NAME ascending; 
-- answer : 
select * from worker order by first_name asc; 
-- industry coding : 
SELECT * FROM worker ORDER BY first_name ASC; 

-- 12. Write an SQL query to print all Worker details from the Worker table order by FIRST NAME Ascending and DEPARTMENT Descending. 
-- select * from worker order by first_name asc and order by department desc ;  

-- 13. Write an SQL query to print details for Workers with the first name as "Vipul" and "Satish" from Worker table.
 -- answer : 
 select * from worker where first_name in ('Vipul', 'Satish'); 
 
 -- 14 : Write an SQL query to print details of workers excluding first names, “Vipul” and “Satish” from Worker table. 
 -- answer : 
 select * from worker where first_name not in ('Vipul', 'Satish');
 
 -- 15 : Write an SQL query to print details of Workers with DEPARTMENT name as "Admin".
 -- answer : 
 select * from worker where department = 'Admin';
 
 -- 16 : Write an SQL query to print details of the Workers whose FIRST_NAME contains 'a'.
 -- answer : 
 select * from worker where first_name like '%a%';
 
 -- 17 : Write an SQL query to print details of the Workers whose FIRST_NAME ends with 'a'.
 -- answer : 
 select * from worker where first_name like '%a';
 
 -- 18 : Write an SQL query to print details of the Workers whose FIRST_NAME ends with 'h' and contains six alphabets
 -- answer : 
 
 
 
 -- 19 : Write an SQL query to print details of the Workers whose SALARY lies between 100000 and 500000.
 -- answer : 
 select * from worker where salary between 100000 and 500000; 
 
 -- suppose I want only the first_name and salary of the corresponding individuals then : 
 select first_name,salary from worker where salary between 100000 and 500000; 
 
 -- 20 : Write an SQL query to print details of the Workers who have joined in Feb'2014.
 -- answer : 
  select * from worker where joining_date between '2014-02-01' and '2014-02-28'; 
  
-- 21. Write an SQL query to fetch the count of employees working in the department 'Admin'.
-- answer : 
select count(first_name) as count, department from worker where department = 'Admin'; 
select first_name, department from worker where department = 'Admin'; 

-- using primary key : 
select count(worker_id), department from worker where department = 'Admin'; 

-- alternate way : can we use group by? 

-- 22. Write an SQL query to fetch worker full names with salaries >= 50000 and <= 100000.
-- answer :  
select concat(first_name,' ',last_name) as full_name from worker where salary in (50000,100000); 

-- suppose we also want the salary : 
select concat(first_name,' ',last_name) as full_name, salary from worker where salary in (50000,100000); 

-- 23. Write an SQL query to fetch the no. of workers for each department in the descending order.
-- answer: 
select count(first_name), department from worker group by department;-- [output is not descending]

-- not a good idea if the first_name occurs multiple times - so go with the primary key : 
-- so what is the primary key here? 

select * from worker;
-- worker_id : so go with that : 
-- much better and much safer : 

select count(worker_id) as count, 
department from worker group by department 
order by count desc; -- make descending output : [forgot order by and had to look it up]

-- 24. Write an SQL query to print details of the Workers who are also Managers.
-- answer : 

select * from worker as w left join title as t on w.worker_id = t.worker_ref_id
where worker_title = 'Manager';

-- 25. Write an SQL query to fetch number (more than 1) of different titles in the ORG.

-- 26. Write an SQL query to show only odd rows from a table. 
-- answer : 
select * from worker where mod(worker_id,2) = 1; 

-- 27. Write an SQL query to show only even rows from a table.
-- answer : 
select * from worker where mod(worker_id,2) = 0; 

-- 28. Write an SQL query to clone a new table from another table.
-- answer : 
create table clone_worker select * from worker; 
select * from clone_worker;

-- 29. Write an SQL query to fetch intersecting records of two tables.
-- answer : 

-- to find the intersecting records : use the set interseciton operation : 
-- answer : intersection has to be emulated using inner join : 

select distinct * from worker as w inner join title as t on w.worker_id = t.worker_ref_id;

select * from title;
select * from bonus;

/* visualize and remember the syntax : 
select * from worker1
UNION
select * from worker2; 
*/

-- Q-30. Write an SQL query to show records from one table that another table does not have.
-- answer : 
-- hint : emulate using minus and that is done using left_join : 
select * from worker as w left join title as t on w.worker_id = t.worker_ref_id where t.worker_tile IS NULL;

select * from title;

-- Q-31. Write an SQL query to show the current date and time. 
-- answer : 
-- link : https://stackoverflow.com/questions/1233506/how-to-get-current-datetime-in-sql
use org; 

select now();
-- select curdate() as current_date; -- how to alias? 
-- to only get current date : 
select curdate();

-- to only get current time : 
select curtime();

-- Q-32. Write an SQL query to show the top n (say 5) records of a table order by descending salary.
-- answer : 
select * from worker order by salary desc limit 5;

-- Q-33. Write an SQL query to determine the nth (say n=5) highest salary from a table.
-- answer : [needs a deeper understanding of limit - so google. otherwise once you know 
-- that this person has the 5th highest salary extract using their first name ] 
-- example : select * from Employee ORDER BY `sal` DESC limit 5,1; // will return 6th highest 
select * from worker order by salary desc limit 4,1;

-- Q-34. Write an SQL query to determine the 5th highest salary without using LIMIT keyword.


-- Q-35. Write an SQL query to fetch the list of employees with the same salary.
-- answer : 
select * from worker as w inner join worker as w1 where w.salary = w1.salary;

-- Q-36. Write an SQL query to show the second highest salary from a table.
-- answer : 
select * from worker order by salary desc limit 2,1;

-- Q-37. Write an SQL query to show one row twice in results from a table.

-- Q-38. Write an SQL query to list worker_id who does not get bonus.
-- answer : 

select * from worker; 
select * from bonus; 

-- use minus set operation : 
select * from worker as w inner join bonus as b on w.worker_id = b.worker_ref_id 
where b.worker_ref_id IS NULL ; 

-- not in method: 
select worker_id from worker where worker_id not in (select worker_ref_id from bonus); 

-- Q-39. Write an SQL query to fetch the first 50% records from a table.
 
 -- Q-40. Write an SQL query to fetch the departments that have less than 4 people in it.
 
select * from worker; 
CREATE TABLE count_worker_table select count(*) as count , department as count_worker from worker group by department;
select * from count_worker_table where count < 4; 

-- alternate way -- compress the above two queries into a single query : 

-- Q-41. Write an SQL query to show all departments along with the number of people in there.
select count(worker_id) as number_of_workers , department from worker group by department;

-- Q-42. Write an SQL query to show the last record from a table.
select * from worker order by worker_id desc limit 1;

-- alternate way via function would be? 
select * from worker;
 
-- Q-43. Write an SQL query to fetch the first row of a table.
select * from worker limit 1;

-- Q-44. Write an SQL query to fetch the last five records from a table.
-- use sort function and limit to retrieve 

select * from worker order by worker_id desc limit 5; 

-- Q-45. Write an SQL query to print the name of employees having the highest salary in each department.
-- not correct: 

create table max_salary select department, max(salary) as salary from worker group by department;
select * from max_salary; 
select first_name from worker as w left join max_salary as m using(salary); 

-- sir solution : 
select w.department, w.first_name, w.salary from
 (select max(salary) as maxsal, department from worker group by department) temp
inner join worker w on temp.department = w.department and temp.maxsal = w.salary;

-- Q-46. Write an SQL query to fetch three max salaries from a table using co-related subquery 

-- DRY RUN AFTER REVISING THE CORELATED SUBQUERY CONCEPT FROM LEC-9.

-- Q-47. Write an SQL query to fetch three min salaries from a table using co-related subquery

-- Q-48. Write an SQL query to fetch nth max salaries from a table.

-- Q-49. Write an SQL query to fetch departments along with the total salaries paid for each of them.
-- answer : 

select sum(salary) as department_wise_expenditure , department from worker group by department;

-- Q-50. Write an SQL query to fetch the names of workers who earn the highest salary.
-- answer : 
select * from worker order by salary desc;
select * from worker order by salary desc limit 2; 

-- alternate way -- above is probably not the right approach. 



-- Number of questions unanswered so far : 10. probably. 
  /*
  HINTS : 
  -- 4 : Google : use left function : left(column_name, number_of_characters_extract)
  */
  
  
 