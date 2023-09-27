use sakila;
show tables;
desc inventory;
select * from film;
select * from inventory;
select * from customer;
select * from rental;
select cust.customer_id,rental.rental_id from customer as cust inner join rental using (customer_id);
-- joining three tables
select cust.customer_id,rental.rental_id,cust.email,inv.film_id from customer as cust inner join rental using (customer_id)
inner join inventory as inv using(inventory_id);
select * from inventory;
select * from film_category;
-- joining 4 tables;
select cust.customer_id,rental.rental_id,cust.email,inv.film_id,fc.category_id from customer as cust inner join rental using (customer_id)
inner join inventory as inv using(inventory_id) inner join film_category as fc using(film_id);
-- joining 5 tables
select cust.customer_id,rental.rental_id,cust.email,inv.film_id,fc.category_id,c.name from customer as cust inner join rental using (customer_id)
inner join inventory as inv using(inventory_id) inner join film_category as fc using(film_id) inner join category as c using(category_id);
-- 

select cust.customer_id,rental.rental_id,cust.email,inv.film_id,fc.category_id,c.name from customer as cust inner join rental using (customer_id)
inner join inventory as inv using(inventory_id) inner join film_category as fc using(film_id) inner join category as c using(category_id) where email='CHARLOTTE.HUNTER@sakilacustomer.org';


select cust.email,fc.category_id,c.name from customer as cust inner join rental using (customer_id)
inner join inventory as inv using(inventory_id) inner join film_category as fc using(film_id) inner join category as c using(category_id);

select cust.email,fc.category_id,c.name,count(fc.category_id) as moviecount from customer as cust inner join rental using (customer_id)
inner join inventory as inv using(inventory_id) inner join film_category as fc using(film_id) inner join category as c using(category_id) group by email,name;
-- understanding self join

create table employee1(eid int,ename varchar(20),email varchar(20),manager_id int);
insert into employee1 values(1,'tushar','tushar@gmail.com',null);
insert into employee1 values(2,'gopal','gopal@gmail.com',1);
insert into employee1 values(3,'aman','aman@gmail.com',4);
insert into employee1 values(4,'deepak','deepak@gmail.com',3);
select * from employee1;
select emp.eid,emp.ename,emp.manager_id from employee1 as emp;

select emp.eid,emp.ename,emp.manager_id,manager.eid,manager.ename from employee1 as emp,employee1 as manager
where emp.manager_id=manager.eid;

select cust.customer_id,rental.rental_id,cust.email,inv.film_id,fc.category_id,c.name from customer as cust inner join rental using (customer_id)
inner join inventory as inv using(inventory_id) inner join film_category as fc using(film_id) inner join category as c using(category_id) where email='CHARLOTTE.HUNTER@sakilacustomer.org';
-- either we will use using for all in a quary or we will use on for all the quary,we cannot combine and use diff diff one time one one time using in a same quary.

select * from film;
select film_id,rental_duration from film where rental_duration=6;
select rental_duration from film where film_id=1;
select film_id,rental_duration from film where rental_duration=6;
-- subquary
select film_id,rental_duration from film where rental_duration=(select rental_duration from film where film_id=1);
