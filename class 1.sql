show databases;
use sakila;
show tables;
describe actor;
desc actor;
select * from actor ;
select first_name from actor;
select actor_id,first_name from actor;
-- used for comments
-- it is not case sensitive 
Select ACTOR_ID FROM 
ACTOR;
-- it is also running
desc actor_info;
-- projection,selection
select *from actor_info;
select actor_id from actor_info;
-- seelcted one column 
select actor_id,actor_id*10 from actor_info;
-- here we made new column with the value multiplied by 10.but in the original column values not change
select actor_id from actor_info;
select * from actor_info;
-- for selecting a row we use  "where" yaha hamne saare columns mein se liya h 
select * from actor_info where actor_id=2;
-- to get row from 2 columns
select actor_id,first_name from actor_info where actor_id=2; 
select actor_id,first_name from actor_info where actor_id>2;
select * from actor_info where first_name="ED"; 
-- we can also give ED as ed
select * from actor_info where first_name="ed"; 