show databases;
use world;
show tables;
select * from country;
select distinct(continent) from country;
select continent,count(*) ,sum(population) from country group by continent having count(*)>50; -- with aggregated data we can't use where clause and it is aggregate because we used group by here

use sakila;
show tables;
desc actor;
desc actor_info;
select first_name from actor ;
select first_name from actor_info;
-- set operations 
-- 1.UNION - phli querry ka output dusri queerrry k sath de deta hai
-- when union is applied we only get distinct values
-- to get full data including duplicate we use UNION ALL
-- union mai total number of column same hone chaiye and data type bhi same hona chaiye , datatype same nhi hoga to pura column type cast ho jayega 

select first_name from actor 
union
select first_name from actor_info;

-- union all gives us duplicate values too.
select first_name from actor 
union all
select first_name from actor_info;
-- 2. intersect - do querry mai jitni bhi common elements hai vo return kr dega

select first_name from actor 
intersect
select first_name from actor_info;


-- 3. except - jo element first querry mai hai but second mai nhi hai vo return krega

select first_name from actor 
except
select first_name from actor_info;

-- joins - data multiple table se lake combine krna
-- 1. inner join - comman elemetn jo dono table mai present hai
-- 2, left join. - left table is called our first table so left join gives us the full data of left table and the common output of both table
-- 3. right join - right table is called our second table so right join gives us the full data of right table and the common output of both table
-- 4. full outer- ismai sara data aata hai dono table se and common vala bhi ata hai

-- class 11, 14-09-2023

use sakila;
show tables;
desc actor;
desc actor_info;
select * from actor;
select * from film_actor;
-- combining actor and fil_actor tables
select actor_id,first_name,film_id from actor inner join film_actor;
-- it will give us error so we use it like this 
select actor.actor_id,first_name,film_id from actor inner join film_actor;
-- actor id mein actor or fiom_actor dono ka data aayega
-- to remove error we use using
-- method 1
select actor.actor_id,first_name,film_id from actor inner join film_actor using (actor_id);

create table er1(id int,snam varchar(20));
insert into er1 values (11,'deepak');
insert into er1 values (12,'deepak3');
insert into er1 values (13,'deepak33');
insert into er1 values (14,'weses');
insert into er1 values (15,'sawsa');
select * from er1;

create table er1hobbyid(id int,hobbies varchar(20));
insert into er1hobbyid values (11,'cricket');
insert into er1hobbyid values (12,'football');
insert into er1hobbyid values (1,'badminton');
insert into er1hobbyid values (343,'badmin');
select er1.id,sname,hobbies from er1 inner join er1hobbyid;
select count(*) from  er1 inner join er1hobbyid;
select er1.id,sname,hobbies from er1 inner join er1hobbyid using(id);

-- method 2 using where
select er1.id,sname,hobbies from er1,er1hobbyid where er1.id=er1hobbyid.id;
-- method 3 
select er1.id,sname,hobbies from er1 inner join er1hobbyid on (er1.id=er1hobbyid.id);
-- if the column name are different then we use on, we cannot use using

select er1.id,sname,hobbies from er1 left join er1hobbyid on (er1.id=er1hobbyid.id);
select er1.id,sname,hobbies from er1 left outer join er1hobbyid on (er1.id=er1hobbyid.id);
-- both are same
select er1.id,sname,hobbies from er1 right join er1hobbyid on (er1.id=er1hobbyid.id);
select er1.id,sname,hobbies from er1 right outer join er1hobbyid on (er1.id=er1hobbyid.id);
-- these both are same

select er1.id,sname,hobbies from er1 outter join er1hobbyid on (er1.id=er1hobbyid.id);
-- in mysql outer or full outer is not available 
-- full outer gives us left,right and common values
select first_name,last_name,film_id from actor inner join film_actor on actor.actor_id=film_actor.actor_id;
-- giving alias name to our tables.
select a.actor_id,first_name,last_name,film_id from actor as a inner join film_actor as fa on a.actor_id=fa.actor_id;
select * from film;

select actor.actor_id,first_name,last_name,film_id from actor inner join film_actor using (actor_id);
-- joining this table with other one
select actor.actor_id,first_name,last_name,film_id, title,release_year from actor inner join film_actor using (actor_id) inner join film using (film_id);

select id,sname,hobbies from er1 natural join er1hobbyid;
create table student1(id int, hobby varchar(20));
insert into student1 values (1,'a');
insert into student1 values (2,'b');
insert into student1 values (3,'c');
insert into student1 values (4,'d');
insert into student1 values (5,'e');

create table hobbies(sid int, sname varchar(20));
insert into student1 values (11,'aa');
insert into student1 values (22,'bb');
insert into student1 values (33,'cc');
insert into student1 values (44,'dd');
insert into student1 values (55,'ee');
select id,hobby from student1 natural join hobbies;
use sakila ;
create table wor(id1 int,namea varchar(20),age int);
insert into wor values(1,'aa',23332);
select * from wor;
insert into wor values(2,'aw',23000),(3,'awee',23323),(4,'appp',231121),(5,'awrere',111121),(6,'tttt',90909);

create table q1(id int ,mili varchar(20));
insert into q1 values ();
show tables;
show databases;
use employees;
show tables;
select * from employees;
select * from salaries;
select e.birth_date ,e.first_name,gender,salary from employees e inner join salaries s using (salary);
select birth_date,first_name,gender,s.salary from employees e,salaries s where e.emp_no=s.emp_no;
select birth_date,e.first_name,s.salary from employees e inner join salaries s using (emp_no);

create table e2(id int,e_name varchar(20));

insert into e2 values(1,'ereed'),(2,'ere'),(3,'aq'),(4,'tq');

select * from e1;
select * from e2;

select eid,e.e_name,s.id,s.e_name from e1 e inner join e2 s on e.eid=s.id;     