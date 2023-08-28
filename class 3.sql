show databases;
use sakila;
-- logical operators and or not use...
select * from actor;
select * from actor where first_name="nick";
select * from actor where first_name="nick" and actor_id=2;
select * from actor where first_name="nick" and actor_id=211;
-- both conditions need to be satisfied..
select * from actor where first_name="nick" or actor_id=3;
-- in or at least one condition need to be satisfied..
show tables;
select * from actor_info;
select * from actor_info where film_info like "Animation%";
select * from actor_info where film_info like "Animation%" and first_name="goldie";
select * from actor_info where  first_name like "goldie";
-- 13 ,14 both are same.
select * from actor_info where film_info like "Animation%" and first_name="goldie"or first_name ="nick";
-- here both AND and or conditions are solved.
select * from actor_info where film_info like "Animation%" and first_name="goldie1"or first_name ="nick";
-- when AND condition is false only or will run.
select * from actor_info where film_info like "Animation%" or first_name="goldie" and first_name ="nick";
select * from film_list;
select category,rating,title from film_list where category like"sci-fi" and rating like "pg";
select category,rating,title from film_list where category like"sci-fi" or category like "family" and rating like "pg";
-- first of all AND condition gets solved ,this is why for scifi we got g and pg rating but for family categpry we got only pg rating.
select category,rating,title from film_list where (category like"sci-fi" or category like "family" )and rating like "pg";
-- here for giving priority to OR condition we used paranthisis ().
select 2+2*3;
select (2+2)*3;
-- between operator.
select * from actor where actor_id between 1 and 5;
select * from actor where actor_id >=1 and actor_id<= 5;
select * from actor where actor_id >=5 and actor_id<= 1;
-- this will not run bcoz we give first small value not bigger one.
select * from actor where first_name between "b" and "d";
select * from actor where first_name between "b" and "de";
select * from actor where first_name between "b" and "e";
select * from actor where actor_id=1 or actor_id=5;
-- use of in operator
select * from actor where actor_id in(1,5);
select * from actor where actor_id in(1,2,5,4,10);
select * from actor where actor_id=1;
select * from actor where actor_id!=1;
select * from actor where not (actor_id=1);
select * from actor where (actor_id in(2,3,4,5,6,7)) and (first_name like "nick" or first_name like "ED");
-- assigments
-- assigment 1
select * from actor_info where (actor_id between 2 and 7)and (first_name ="nick" or first_name="ed");
-- assigment 2
select * from actor_info where last_name not like "%a%" and last_name not like "%e%";
-- assigment 3
select * from actor_info where (first_name !="grace" and first_name!="matthew" and first_name!="joy")and actor_id<15;
-- assigment 4
select * from actor_info where (last_name not like "%a%" and first_name not like "%i%") and actor_id between 10 and 20;



