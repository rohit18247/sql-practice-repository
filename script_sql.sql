SELECT * FROM WORKER; 

/*Now suppose we want to get the first and last name of the workers : */
SELECT FIRST_NAME, SALARY FROM WORKER; 

SELECT LAST_NAME, SALARY FROM WORKER; 

SELECT FIRST_NAME, LAST_NAME, SALARY, DEPARTMENT FROM WORKER; 

/*Creates a dummy table and provides the answer there*/
SELECT 44+11; 

SELECT now();
/*get salary above a certain number*/
SELECT * FROM WORKER WHERE SALARY > 80000; 

/*get salary in between a range*/
SELECT * FROM WORKER WHERE SALARY BETWEEN 80000 AND 300000; 

/*using OR statements for reduction : rewriting the above query*/
SELECT *FROM WORKER WHERE DEPARTMENT = 'HR' OR DEPARTMENT = 'ADMIN' OR DEPARtMENT = 'ACCOUNT'; 

/*using in statements for reduction when too many ORs start coming in*/ 
SELECT *FROM WORKER WHERE DEPARTMENT IN ('HR','Admin','Account'); 

/*wildcards*/
SELECT *FROM WORKER WHERE FIRST_NAME LIKE '%i%';

/*SORT BY:*/

/*without distinct */
select department from worker; 

/* with distinct */
select distinct department from worker; 

/*group by*/ 
select department, COUNT(department) from worker group by department;

/* find the average salary per department */ 
/*Important to note that whatever column names are there in the select clause should also
be in the group by clause */

select department, AVG(salary) from worker group by department;

/* find minimum salary per department */
select department, MIN(salary) from worker group by department; 

/*max salary*/
select department, MAX(salary) from worker group by department;

/*total salary*/
select department, SUM(salary) from worker group by department;

/*without aggregation : group by behaves as distinct keyword*/

/* HAVING Keyword : 
list departments having only more than 2 workers */

select department, count(department) from worker group by department having count(department) > 2; 

/*having does not work without group by keyword*/ 

/*Where and Having feel similar. Are they? */



  



