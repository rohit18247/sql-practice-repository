 /* Top 50 Interview Questions :  

https://www.youtube.com/watch?v=vIq9zkpGWc8

all containts the link to the questions, db schema and notes in the schema; 
*/

/*Answers are by me unless specified as sir's answer : */

 -- 1. Write an sql query to fetch "FIRST_NAME" from Worker table using the alias name as <WORKER_NAME>. 
 -- Answer : 
 select first_name as worker_name from worker; 
	

 -- 2. Write an SQL query to fetch "FIRST_NAME" from worker table in upper case. 
 -- Answer : 
 select upper(first_name) from worker;
    
 -- 3. Write an sql query to fetch unique values of DEPARTMENT from Worker table. 
 -- Answer : 
 select distinct(department) from worker;
	
 -- 4. Write an sql query to print the first three characteres of first name from worker table. 
 -- Answer : 
select substring(first_name,1,3) as the_first_three_chars from worker; 


 -- 5. [ISSUE] write an sql query to find the position of the alphabet ('b') in the first name column 'Amitabh' from worker table. 
 select position('b' in 'Amitabh') as pos_letter from worker; 
   
 
 -- 6. [ISSUE] write an sql query to print the FIRST_NAME from worker table after removing white spaces from the right side. 
-- answer : 
select rtrim(first_name) from worker;

 -- 7. [ISSUE] write an sql query to print the department from worker table after removing white spaces from the left side. 
-- answer : 	 
    select ltrim(first_name) from worker;
    
 -- 8. write an sql query that fetches the unique values of DEPARTMENT from Worker table and prints its length. 
-- answer:  
select distinct(department), length(department) as length_dep from worker ;

 -- 9. Write an sql query to print the first_name from worker table after replacing 'a' with 'A'. 
 -- intuitively answered : 
select replace(first_name,'a', 'A') from worker; 	

-- 10. write an sql query to print the FIRST_NAME and LAST_NAME from worker table in a single column COMPLETE_NAME. 
-- a space char should separate these
-- hint : https://stackoverflow.com/questions/22739841/mysql-combine-two-columns-into-one-column
select concat(first_name,' ',last_name) as complete_name from worker ;

-- 11. write an sql query to print all worker details from the worker table order by FIRST_NAME ascending; 
-- answer : 
select * from worker order by first_name asc;

-- 12. [ISSUE] Write an SQL query to print all Worker details from the Worker table order by FIRST NAME Ascending and DEPARTMENT Descending. 
-- I had written : select * from worker order by first_name asc and order by department desc; 
 select * from worker order by first_name asc, department desc;

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
 -- answer : does it include the h itself as well? 
 select * from worker where first_name like '_____h'; 
 
 -- 19 : Write an SQL query to print details of the Workers whose SALARY lies between 100000 and 500000.
 -- answer : 
 select * from worker where salary between 100000 and 500000; 
 
 -- 20 : Write an SQL query to print details of the Workers who have joined in Feb'2014.
 -- answer : 
  select * from worker where joining_date between '2014-02-01' and '2014-02-28';
  
-- 21. Write an SQL query to fetch the count of employees working in the department 'Admin'.
-- answer : 

select count(*) as number_of_admin_employees from worker where department = 'Admin'; 
-- using primary key : 


-- 22. Write an SQL query to fetch worker full names with salaries >= 50000 and <= 100000.
-- answer :  
select concat(first_name,last_name) as full_name from worker where salary >= 50000 and salary <=  100000;

-- 23. Write an SQL query to fetch the no. of workers for each department in the descending order.
-- answer: 
select count(*) from worker group by department order by department desc;

-- 24. Write an SQL query to print details of the Workers who are also Managers.
-- answer : 
select * from worker;
select * from title;

select * from worker as w left join title as t on w.worker_id = t.worker_ref_id where worker_title = 'Manager';

-- 25. Write an SQL query to fetch number (more than 1) of different titles in the ORG.

-- 26.  Write an SQL query to show only odd rows from a table.
-- answer :  
select * from worker where mod(worker_id,2) = 1;

-- 27. Write an SQL query to show only even rows from a table.
-- answer : 
select * from worker where mod(worker_id,2) = 0; 

-- 28. Write an SQL query to clone a new table from another table.
-- answer : 
create table clone_worker2 select * from worker;
select * from clone_worker2;

-- 29. Write an SQL query to fetch intersecting records of two tables.
-- answer : 
select * from worker as w inner join title as t on w.worker_id = t.worker_ref_id; 

-- Q-30. Write an SQL query to show records from one table that another table does not have.
-- answer : 
-- left join + make values of table 2 null : 
select * from worker as w left join title as t on w.worker_id = t.worker_ref_id where t.worker_ref_id = NULL;

-- Q-31. Write an SQL query to show the current date and time. 


-- Q-32. Write an SQL query to show the top n (say 5) records of a table order by descending salary.
-- answer : 
select * from worker order by salary desc limit 5; 

-- Q-33. Write an SQL query to determine the nth (say n=5) highest salary from a table.
select * from worker order by salary desc limit 4,1; 

-- Q-34. Write an SQL query to determine the 5th highest salary without using LIMIT keyword.


-- Q-35. Write an SQL query to fetch the list of employees with the same salary.
-- finding duplicates : 
-- how to do self join? 

-- Q-36. Write an SQL query to show the second highest salary from a table.
--
select * from worker order by salary desc limit 1,1 ; 


-- [issue] Q-37.Write an SQL query to show one row twice in results from a table.
-- 

-- [issue] Q-38. Write an SQL query to list worker_id who does not get bonus.
-- answer : 
-- join with bonus table - find out all tuples not in bonus table : minus operator : 
select * from worker as w left join bonus as b on w.worker_id = b.worker_ref_id where b.worker_ref_id = NULL;

-- [issue] Q-39. Write an SQL query to fetch the first 50% records from a table.
-- 



-- Q-40. Write an SQL query to fetch the departments that have less than 4 people in it.
--  think about this : this is not correct : 

select department,count(*) < 4 from worker group by department ; 

-- alternate way -- compress the above two queries into a single query : 

-- Q-41. Write an SQL query to show all departments along with the number of people in there.
select count(*) from worker group by department;

-- [issue]Q-42. Write an SQL query to show the last record from a table.
select * from worker order by worker_id desc limit 1; 

-- Q-43. Write an SQL query to fetch the first row of a table.
select * from worker limit 1;

-- Q-44. Write an SQL query to fetch the last five records from a table.
-- use sort function and limit to retrieve  : 
select * from worker order by worker_id desc limit 5;

-- Q-45. Write an SQL query to print the name of employees having the highest salary in each department.
-- answer : 

select first_name from worker group by department where salary = max(salary); 
 
-- Q-46. Write an SQL query to fetch three max salaries from a table using co-related subquery 

-- DRY RUN AFTER REVISING THE CORELATED SUBQUERY CONCEPT FROM LEC-9.

-- Q-47. Write an SQL query to fetch three min salaries from a table using co-related subquery

-- Q-48. Write an SQL query to fetch nth max salaries from a table.

-- Q-49. Write an SQL query to fetch departments along with the total salaries paid for each of them.
-- answer : 
select sum(salary) as sum_department_salary,department from worker group by department;

-- Q-50. Write an SQL query to fetch the names of workers who earn the highest salary.


-- alternate way -- above is probably not the right approach. 


-- 10 questions un-answered so far. 

  /*
  HINTS : 
  -- 4 : Google : use left function : left(column_name, number_of_characters_extract)
  */
  
  
 /*
 
 Separate out all queries where you are having issues : 
 -- Q-31. Write an SQL query to show the current date and time. 
	SELECT NOW();

- Q-34. Write an SQL query to determine the 5th highest salary without using LIMIT keyword.
	
	select top 1 from ( select * from worker order by salary desc ) as top_five_salary order by asc ; 
  
-- [issue] Q-37.Write an SQL query to show one row twice in results from a table.

-- select * from worker where first_name = 'Amitabh'
   UNION
   select * from worker where first_name = 'Amitabh'; 

-- [issue] Q-39. Write an SQL query to fetch the first 50% records from a table.

select * from worker where worker_id <= (select count(*)/2 from worker); 
		
 -- Q-45. Write an SQL query to print the name of employees having the highest salary in each department.
-- answer : 


-- Q-46. Write an SQL query to fetch three max salaries from a table using co-related subquery 

-- DRY RUN AFTER REVISING THE CORELATED SUBQUERY CONCEPT FROM LEC-9.

-- Q-47. Write an SQL query to fetch three min salaries from a table using co-related subquery

-- Q-48. Write an SQL query to fetch nth max salaries from a table.

-- Q-50. Write an SQL query to fetch the names of workers who earn the highest salary.
 
 
 */