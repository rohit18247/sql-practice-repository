/* understanding the use of constraints : Check and Default */

create table account (
id int primary key, 
name varchar(255) UNIQUE, 
balance INT,
CONSTRAINT acc_balance_chk CHECK(balance > 1000) 
);

INSERT INTO account(id, name, balance)
values (1, 'A', 10000); 

select * from account; 

INSERT INTO account(id, name, balance) 
values(2,'B',20000); 

select * from account; 

/* try executing this command does this work? */ 

INSERT INTO account(id,name,balance)
values(3,'C',100); 

/*It was not able to clear the constraint check - hence did not go into the db */

/*use of the default keyword :*/
