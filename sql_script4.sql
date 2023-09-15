create database temp2; 

use temp2; 

create table customer (
id integer primary key, 
cname varchar(255), 
address varchar(255),
gender char(2), 
city varchar(255),
pincode integer
); 

insert into customer(id,cname,address,gender,city,pincode)
values(1300, 'Shayam Singh', 'dilshad garden','M','Delhi',11000),
(1301, 'Lohit Singh', 'dilshad garden','M','Delhi',11000),
(1302, 'Vohit Singh', 'dilshad garden','M','Delhi',11000),
(1303, 'Rohit Singh', 'dilshad garden','M','Mumbai','11000'),
(1304, 'Mohit Singh', 'dilshad garden','M','Aalos','11000'),
(1305, 'Yohit Singh', 'dilshad garden','M','Italy','11000');

select * from customer;

-- drop table customer;

-- earlier I was trying to use this query : and it gave the error : 
-- select from customer where city = 'Delhi'; 

-- in the above query I have not specified which tuples to be retrieved hence the query was 
-- not running. 

select * from customer where city = 'Delhi';
select cname,gender from customer where city = 'Delhi';
select cname, address from customer where city = 'Delhi';

select cname, address from customer where city = 'Delhi' and gender = 'M'; 
select cname, address from customer where city = 'Delhi' and gender = 'M' and address = 'Dilshad Garden';

select * from customer; 

select pincode,cname,gender from customer where city = 'Mumbai';
select * from customer where city = 'Mumbai' OR city = 'Delhi';
















