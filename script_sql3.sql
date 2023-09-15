/*Applying Alter Operations : */

create table account (
id int primary key, 
name varchar(255) UNIQUE,  
balance INT NOT NULL DEFAULT 0
);

select * from account;
-- drop table account;

-- Add new column : 
ALTER TABLE account ADD interest FLOAT NOT NULL DEFAULT 0;  

-- MODIFY : changing the data type of a specific attribute : 
ALTER TABLE account
MODIFY interest DOUBLE NOT NULL DEFAULT 0; 

/* describes the table : not to be confused with descending keyword : */
DESC account; 

-- CHANGE COLUMN NAME : RENAME THE COLUMN : 
alter table account 
change column interest saving_interest float not null default 0;  

desc account;

-- DROP column : 
alter table account 
drop column saving_interest; 

desc account;

-- RENAME THE TABLE : 
alter table account
rename to account_details;

/*
-- how to know a table is part of which database : 

SELECT table_catalog, table_schema
FROM information_schema.tables
WHERE table_name = 'account_details';
*/
 

