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
	

 -- 2. Write an SQL query to fetch "FIRST_NAME" from worker table in upper case. 
 -- Answer : 
	
    
 -- 3. Write an sql query to fetch unique values of DEPARTMENT from Worker table. 
	
 -- 4. Write an sql query to print the first three characteres of first name from worker table. 
	
  
 -- 5. write an sql query to find the position of the alphabet ('b') in the first name column 'Amitabh' from worker table. 
	
 
 -- 6. write an sql query to print the FIRST_NAME from worker table after removing white spaces from the right side. 
	
 -- 7. write an sql query to print the department from worker table after removing white spaces from the left side. 
	 
    
 -- 8. write an sql query that fetches the unique values of DEPARTMENT from Worker table and prints its length. 
	 
 -- 9. Write an sql query to print the first_name from worker table after replacing 'a' with 'A'. 
	
	

-- 10. write an sql query to print the FIRST_NAME and LAST_NAME from worker table in a single column COMPLETE_NAME. 
-- a space char should separate these
-- hint : https://stackoverflow.com/questions/22739841/mysql-combine-two-columns-into-one-column


-- 11. write an sql query to print all worker details from the worker table order by FIRST_NAME ascending; 
-- answer : 


-- 12. Write an SQL query to print all Worker details from the Worker table order by FIRST NAME Ascending and DEPARTMENT Descending. 


-- 13. Write an SQL query to print details for Workers with the first name as "Vipul" and "Satish" from Worker table.
 -- answer : 

 
 -- 14 : Write an SQL query to print details of workers excluding first names, “Vipul” and “Satish” from Worker table. 
 -- answer : 
 
 
 -- 15 : Write an SQL query to print details of Workers with DEPARTMENT name as "Admin".
 -- answer : 
 
 
 -- 16 : Write an SQL query to print details of the Workers whose FIRST_NAME contains 'a'.
 -- answer : 
 
 
 -- 17 : Write an SQL query to print details of the Workers whose FIRST_NAME ends with 'a'.
 -- answer : 
 
 -- 18 : Write an SQL query to print details of the Workers whose FIRST_NAME ends with 'h' and contains six alphabets
 -- answer : 
 
 
 -- 19 : Write an SQL query to print details of the Workers whose SALARY lies between 100000 and 500000.
 -- answer : 
 
 -- 20 : Write an SQL query to print details of the Workers who have joined in Feb'2014.
 -- answer : 
  
  
-- 21. Write an SQL query to fetch the count of employees working in the department 'Admin'.
-- answer : 

-- using primary key : 


-- 22. Write an SQL query to fetch worker full names with salaries >= 50000 and <= 100000.
-- answer :  


-- 23. Write an SQL query to fetch the no. of workers for each department in the descending order.
-- answer: 

-- 24. Write an SQL query to print details of the Workers who are also Managers.
-- answer : 

-- 25. Write an SQL query to fetch number (more than 1) of different titles in the ORG.

-- 26. Write an SQL query to show only odd rows from a table. 

-- 27. Write an SQL query to show only even rows from a table.
-- answer : 

-- 28. Write an SQL query to clone a new table from another table.
-- answer : 


-- 29. Write an SQL query to fetch intersecting records of two tables.
-- answer : 


-- Q-30. Write an SQL query to show records from one table that another table does not have.
-- answer : 


-- Q-31. Write an SQL query to show the current date and time. 

-- Q-32. Write an SQL query to show the top n (say 5) records of a table order by descending salary.
-- answer : 

-- Q-33. Write an SQL query to determine the nth (say n=5) highest salary from a table.


-- Q-34. Write an SQL query to determine the 5th highest salary without using LIMIT keyword.


-- Q-35. Write an SQL query to fetch the list of employees with the same salary.


-- Q-36. Write an SQL query to show the second highest salary from a table.


-- Q-37. Write an SQL query to show one row twice in results from a table.

-- Q-38. Write an SQL query to list worker_id who does not get bonus.

-- Q-39. Write an SQL query to fetch the first 50% records from a table.
 
-- Q-40. Write an SQL query to fetch the departments that have less than 4 people in it.
 
-- alternate way -- compress the above two queries into a single query : 

-- Q-41. Write an SQL query to show all departments along with the number of people in there.

-- Q-42. Write an SQL query to show the last record from a table.

 -- Q-43. Write an SQL query to fetch the first row of a table.

-- Q-44. Write an SQL query to fetch the last five records from a table.
-- use sort function and limit to retrieve 

-- Q-45. Write an SQL query to print the name of employees having the highest salary in each department.
-- not correct: 

-- Q-46. Write an SQL query to fetch three max salaries from a table using co-related subquery 

-- DRY RUN AFTER REVISING THE CORELATED SUBQUERY CONCEPT FROM LEC-9.

-- Q-47. Write an SQL query to fetch three min salaries from a table using co-related subquery

-- Q-48. Write an SQL query to fetch nth max salaries from a table.

-- Q-49. Write an SQL query to fetch departments along with the total salaries paid for each of them.
-- answer : 

-- Q-50. Write an SQL query to fetch the names of workers who earn the highest salary.

-- alternate way -- above is probably not the right approach. 


-- 10 questions un-answered so far. 

  /*
  HINTS : 
  -- 4 : Google : use left function : left(column_name, number_of_characters_extract)
  */
  
  
 