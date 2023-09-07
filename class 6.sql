show databases;
 use sakila;
 select * from language;
 show columns from language;
 -- how to add rows in data 
 insert into language values(11,'deepakswamy',now());
 select * from language ;
 insert into language values(12,'russian','2020-09-06 10:35:00');
 -- inserting date manually 
 select * from language ;
  insert into language values(12,'russian','2020-09-06 10:35:00');
  -- when we use ignore if i have entry already it will not insert data if i dont have entry already then it will add the value
  insert  ignore into language values(12,'russian','2020-09-06 10:35:00');
  select * from language;
  insert  ignore into language values(13,'russian','2020-09-06 10:35:00');
  select * from language;
--   cannot execute because we have only 3 columns but we entered the value of 4 columns 
  insert  ignore into language values(13,'russian','2020-09-06 10:35:00',warhammer);
  
  insert into language (language_id,name,last_update) values(14,'america','2023-09-06 10:35:00');
select * from language;
insert into language (last_update,language_id,name) values('2023-09-06 10:35:00',15,'jamaca');
select * from language;
insert into language (last_update,name) values('2023-09-06 10:35:00','andman nicobar');
select * from language;
-- multiple values inserting

insert into language (last_update,name) values('2023-09-06 10:35:00','andman nicobar'),('2023-09-06 10:35:00','andman nicobar1'),('2023-09-06 10:35:00','andman nicobar2');
select * from language;

-- set is aslo used to insert values .

insert into language set name='bahamas';
select * from language;
insert into language set language_id=22,name='bahamas';

select * from language;

-- creating a database 

create database test ;
-- once runed if we run it again it will us error so we write it like it 

create database if not exists test; 
-- if now here we have database it will not make or if we not have it will make not will give error 

use test;
show tables;
-- ddl statement used to create index,table and view

-- creating table

create table employee(employee_id int,employee_name char(20),age int);
show tables;
show columns from employee;
insert into employee values(1,'deepak',26);
select * from employee;
insert into employee values(1,'deepak',26),(2,'anshu',25),(3,'uday',26);
select * from employee;
desc employee;
-- because i have no primary key duplicate values can be go again
insert into employee values(4,'deepak',26);
insert into employee values(5,'dinesh',null);
select * from employee;
insert into employee (employee_id,age,employee_name)values( 6,null,'dinesh');
select * from employee;
insert into employee (employee_id,employee_name)values( 6,'dinesh');
select * from employee;
insert into employee (employee_name)values('dinesh');
select * from employee;
-- how to give dEFAULT VALUE WHEN MAKING TABLES.

create table employee2(employee_id int DEFAULT 0,employee_name char(20),age int);
insert into employee2 (employee_id,age,employee_name)values( 1,null,'dinesh');
insert into employee2 (age,employee_name)values(34,'deenu');
select * from employee2;
insert into employee2 (employee_id,age,employee_name)values( null,23,'ratan');
select * from employee2;

create table company(employee_name char(25) default 'ABC',employee_id int,salary int ,last_update timestamp default now()); 
desc company;
insert into company(employee_name,employee_id,salary,last_update) values('Anshuman',112323,2300000,now());
select * from company;

insert into company(employee_id,salary) values(11232,3400000);
select * from company;
insert into company(employee_id,salary) values(11232,3400000);
insert into company(employee_id,salary) values(11000,4540000);
insert into company(employee_id,salary) values(13434,5650000);
select * from company;
-- adding a new column in table
alter table  company add experience int;
select * from company;
delete from company where employee_id=112323;