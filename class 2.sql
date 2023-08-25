use sakila;
select database();
show tables;
show columns from actor;
desc actor;
-- desc and show columns both are used for same thing to know the columns of our tables.
select * from actor;
select * from sakila.actor;
-- we can also use it like this without using use datatype.
select* from language where name='english';
select* from language where language_id=3;
select* from language where language_id!=3;
select* from language where name>'i';
select* from language where name>'iu';

select * from actor;
select first_name from actor where first_name >"b";

select first_name from actor where first_name >"bett";
 -- how to check for a perticular word(dinosaur)
 
select * from film where title like '%';
-- movies that start from a
select * from film where title like 'a%';
-- movies that start from a and end with r.
select * from film where title like 'a%r';
-- when i need movies all who has word dinosaur
select * from film where title like '%dinosaur';
select * from film where title like '%dinosaur%';
select * from film where title like '%family%';
select * from film where description like '%drama%';
select title,description,release_year from film where title like 'a%les';
-- when i need a data where first word of title is a and after it any word in secound place,should be the only 2 words in title this is why we are getting null bcoz there is no film with only 2 words 
select * from film where title like 'A_';
select * from film where title like 'A_%';
-- first character is a 3rd is e,secound can be any.
select * from film where title like 'A_e%';
select * from film where title like 'A_en%';
select title ,film_id,release_year,description from film where title like '_C%';
select title ,film_id,release_year,description from film where title like 'A%An';
select title ,film_id,release_year,description from film where title like '%t___%';
select title ,film_id,release_year,description from film where title like '_f_I%Egg';
select title ,film_id,release_year,description from film where title like '%__a__%';
