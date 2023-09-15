use ankit_sql_emp;

CREATE TABLE employee3 (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    department_id INT,
    salary DECIMAL(10, 2),
    hire_date DATE
);

INSERT INTO employee3 VALUES
    (1, 'John', 101, 55000, '2020-01-15'),
    (2, 'Alice', 102, 60000, '2019-08-23'),
    (3, 'Bob', 101, 52000, '2022-03-10'),
    (4, 'Emma', 103, 58000, '2021-05-12'),
    (5, 'Mike', 102, 61000, '2020-09-30'),
    (6, 'Sophia', 101, 51000, '2022-01-05'),
    (7, 'William', 103, 54000, '2023-02-18'),
    (8, 'Olivia', 102, 59000, '2021-11-20');
    
    CREATE TABLE product (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    region VARCHAR(50),
    sales DECIMAL(10, 2)
);

INSERT INTO product VALUES
    (1, 'Product A', 'Region 1', 1200),
    (2, 'Product B', 'Region 2', 980),
    (3, 'Product C', 'Region 1', 1500),
    (4, 'Product D', 'Region 3', 800),
    (5, 'Product E', 'Region 2', 1100),
    (6, 'Product F', 'Region 1', 1300),
    (7, 'Product G', 'Region 3', 700),
    (8, 'Product H', 'Region 2', 1050);
    
    INSERT INTO product VALUES
    (9, 'Product I', 'Region 1', 900),
    (10, 'Product J', 'Region 2', 1150),
    (11, 'Product K', 'Region 3', 820),
    (12, 'Product L', 'Region 1', 1350),
    (13, 'Product M', 'Region 2', 1050),
    (14, 'Product N', 'Region 1', 1000),
    (15, 'Product O', 'Region 3', 750),
    (16, 'Product P', 'Region 2', 1220),
    (17, 'Product Q', 'Region 1', 1100),
    (18, 'Product R', 'Region 3', 830),
    (19, 'Product S', 'Region 2', 990),
    (20, 'Product T', 'Region 1', 1400);
    
    CREATE TABLE sales2 (
    sales_id INT PRIMARY KEY,
    sub_category VARCHAR(100),
    sales_amount DECIMAL(10, 2),
    sales_date DATE
);

INSERT INTO sales2 VALUES
    (1, 'Sub Cat A', 1200, '2020-01-01'),
    (2, 'Sub Cat B', 980, '2020-01-01'),
    (3, 'Sub Cat C', 1500, '2020-01-01'),
    (4, 'Sub Cat A', 800, '2020-02-01'),
    (5, 'Sub Cat B', 1100, '2020-02-01'),
    (6, 'Sub Cat C', 1300, '2020-02-01'),
    (7, 'Sub Cat A', 700, '2020-03-01'),
    (8, 'Sub Cat B', 1050, '2020-03-01');
    
    
 CREATE TABLE product2 (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    category VARCHAR(50),
    sales DECIMAL(10, 2),
    year INT
);

INSERT INTO product2 VALUES
    (1, 'Product A', 'Category 1', 1200, 2019),
    (2, 'Product B', 'Category 2', 980, 2019),
    (3, 'Product C', 'Category 1', 1500, 2019),
    (4, 'Product D', 'Category 3', 800, 2019),
    (5, 'Product E', 'Category 2', 1100, 2019),
    (6, 'Product F', 'Category 1', 1300, 2019),
    (7, 'Product G', 'Category 3', 700, 2019),
    (8, 'Product H', 'Category 2', 1050, 2019),
    (9, 'Product I', 'Category 1', 2000, 2020),
    (10, 'Product J', 'Category 2', 2100, 2020),
    (11, 'Product K', 'Category 1', 2400, 2020),
    (12, 'Product L', 'Category 3', 1800, 2020),
    (13, 'Product M', 'Category 2', 2300, 2020),
    (14, 'Product N', 'Category 1', 2200, 2020),
    (15, 'Product O', 'Category 3', 1900, 2020),
    (16, 'Product P', 'Category 2', 2250, 2020);
    
    select * from employee2;
    select * from product;
    select * from sales2;
    select * from product2; 
    
    
    
    
-- 1- write a query to print 3rd highest salaried employee details for each department (give preferece to younger employee in case of a tie). 
-- : 1.1 (OPTIONAL + BONUS Question) In case a department has less than 3 employees then print the details of highest salaried employee in that department.

with emp_view as (select *,
dense_rank() over(partition by department_id order by salary desc) as d_rnk
 from employee2) 
select * from emp_view where d_rnk <= 3;


-- 2- write a query to find top 3 and bottom 3 products by sales in each region.

with view_product as (
select *,
dense_rank() over(partition by region order by sales desc) as d_rnk
from product
), 
view_product2 as (
select *,
dense_rank() over(partition by region order by sales asc) as d_rnk2
from product)

select * from view_product where d_rnk<=3
union
select * from view_product2 where d_rnk2<=3; 

-- now how to get bottom 3? 
-- how would you do it independently? 

-- one approach is to sort in ascending - and then fetch the top3.
-- but how to do it department wise for each department id? use subquery
-- for dept_id in (all_dept_id) - fetch top3 rows 


-- 3- Among all the sub categories..which sub category had highest month over month growth by sales in Jan 2020.

with sales_res as (
select  *,
lag(sales_amount,1) over(partition by sub_category order by sales_amount desc) as lag_values
from sales2
)
select * from sales_res; 
-- 4- write a query to print top 3 products in each category by year over year sales growth in year 2020.


with view_results as(
select product_id,product_name,category,year,sales, 
lag(sales,1) over(partition by category order by year) as sales2
from product2
), 
view_results2 as (
select *, (sales2-sales) as diff, 
dense_rank() over(order by (sales2-sales) desc) as d_rnk_product
from view_results
order by diff desc)

select * from view_results2 
where d_rnk_product<=3
order by year limit 3;

-- how to resolve ties between 1 and 1 and 3 and 3? 
-- order by year
-- fetch top 3.

-- 5- create below 2 tables 

create table call_start_logs
(
phone_number varchar(10),
start_time datetime
);
insert into call_start_logs values
('PN1','2022-01-01 10:20:00'),('PN1','2022-01-01 16:25:00'),('PN2','2022-01-01 12:30:00')
,('PN3','2022-01-02 10:00:00'),('PN3','2022-01-02 12:30:00'),('PN3','2022-01-03 09:20:00');

create table call_end_logs
(
phone_number varchar(10),
end_time datetime
);
insert into call_end_logs values
('PN1','2022-01-01 10:45:00'),('PN1','2022-01-01 17:05:00'),('PN2','2022-01-01 12:55:00')
,('PN3','2022-01-02 10:20:00'),('PN3','2022-01-02 12:50:00'),('PN3','2022-01-03 09:40:00')
;

-- write a query to get start time and end time of each call from above 2 tables.Also create a column of call duration in minutes.  
-- Please do take into account that
-- there will be multiple calls from one phone number and each entry in start table has a corresponding entry in end table.

select * from call_start_logs;
select * from call_end_logs;

-- select csl.phone_number,csl.start_time,cel.end_time, extract() 
-- from call_start_logs csl left join call_end_logs cel on csl.phone_number = cel.phone_number;

select * from employee3;



