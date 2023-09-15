use temp2; 

CREATE TABLE customers (
  customer_id INT PRIMARY KEY,
  customer_name VARCHAR(255),
  customer_email VARCHAR(255),
  customer_phone VARCHAR(20),
  customer_address VARCHAR(255)
); 

CREATE TABLE orders (
  order_id INT PRIMARY KEY,
  order_date DATE,
  customer_id INT,
  FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

CREATE TABLE order_items (
  item_id INT PRIMARY KEY,
  order_id INT,
  item_name VARCHAR(255),
  item_quantity INT,
  item_price DECIMAL(10,2),
  FOREIGN KEY (order_id) REFERENCES orders(order_id)
);

-- Insert data into customers table
INSERT INTO customers (customer_id, customer_name, customer_email, customer_phone, customer_address)
VALUES (1, 'John Doe', 'johndoe@example.com', '555-1234', '123 Main St'),
       (2, 'Jane Smith', 'janesmith@example.com', '555-5678', '456 Elm St'),
       (3, 'Bob Johnson', 'bobjohnson@example.com', '555-9012', '789 Oak St');

-- Insert data into orders table
INSERT INTO orders (order_id, order_date, customer_id)
VALUES (1, '2022-04-10', 1),
       (2, '2022-04-12', 2),
       (3, '2022-04-15', 1),
       (4, '2022-04-18', 3),
       (5, '2022-04-22', 2);

-- Insert data into order_items table
INSERT INTO order_items (item_id, order_id, item_name, item_quantity, item_price)
VALUES (1, 1, 'Product A', 2, 10.00),
       (2, 1, 'Product B', 1, 20.00),
       (3, 2, 'Product C', 3, 15.00),
       (4, 3, 'Product D', 1, 25.00),
       (5, 4, 'Product E', 4, 5.00),
       (6, 4, 'Product F', 2, 10.00),
       (7, 4, 'Product G', 3, 8.00),
       (8, 5, 'Product H', 1, 50.00),
       (9, 5, 'Product I', 2, 30.00);

/*Retrieve the customer name and order date for all orders.
select * from customers as c left join orders as o on c.customer_id = o.customer_id; 
Retrieve the customer name and the total number of orders they have placed, including those who have not placed any orders.
Retrieve the customer name and the total amount they have spent on all orders, including those who have not placed any orders.
*/
-- 1 
select c.customer_name,o.order_date from customers as c left join orders as o on c.customer_id = o.customer_id; 

-- 2 Retrieve the customer name and order date for all orders that were placed in April 2022.
select c.customer_name, o.order_date 
from customers as c left join orders as o on c.customer_id = o.customer_id 
where o.order_date between '2022-04-01' AND '2022-04-30';

-- 3 Retrieve the customer name and order date for all orders that were placed after April 15th, 2022.
-- select c.customer_name,o.order_date from customers as c left join orders as o where o.order_date between ''
 
-- 4 Retrieve the order ID, item name, item quantity, and item price for all items in all orders.

select order_id, item_name, item_quantity, item_price from order_items;

-- 5 Retrieve the customer name and the total number of orders they have placed.
/*chatgpy answer :*/
SELECT customers.customer_name, COUNT(orders.order_id) AS num_orders
FROM customers
LEFT JOIN orders ON customers.customer_id = orders.customer_id
GROUP BY customers.customer_id;  

-- 6 Retrieve the customer id and the total amount they have spent on all orders. 

     select o.customer_id, SUM(ord.item_price * ord.item_quantity) as total_spent
     from orders as o 
     left join order_items as ord on o.order_id = ord.order_id 
     group by o.customer_id ; 

-- 7 Retrieve the customer name and the total amount they have spent on all orders.
-- we are doing multiple joins here in order to solve this question : 

/* my answer! */
select c.customer_name, SUM(ord.item_price * ord.item_quantity) as total_spent
from orders as o 
left join order_items as ord on o.order_id = ord.order_id 
left join customers as c on c.customer_id = o.customer_id
group by o.customer_id;  

-- 8 Retrieve the item name and the total number of times it has been ordered.

select item_name from order_items
group by item_quantity; 

select * from orders;
select * from customers;
select * from order_items; 

-- 9 Retrieve the customer name, order ID, and order date for all orders placed by customers with a phone number starting with '555'.


/* Set Operations based Queries : Using : Union, Intersection, Minus */ 

-- 1 List out all employees in the company : 

select * from dept1
union
select * from dept2; 

-- 2 list out all employees in all departments who work as salesmen

select name from dept1
union
select * from dept2 where role = 'salesman';

/*OR Sir's answer : 

select * from dept1 where role = 'salesman'
UNION
select * from dept2 where role = 'salesman';alter

*/ 

-- 3 list out all employees who work for both the departments : 
-- use intersection : 
-- how to emulate intersection in the sql form : 

-- 4 list out all employees working in department1 but not in department 2 : 

select * from dept1 as d1 
left join dept2 as d2 on d1.empid = d2.empid 
where dept2.empid = NULL; 

/* create schemas to execute the queries */ 

/* Learning Subqueries : */

/* Views */ 















 




 
 