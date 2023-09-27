-- alias name (nick name) it mean how we can give good expression a good name(readability)
use sakila;
select first_name from actor;
select first_name,concat('mr',first_name) from actor;
-- using alias. 
select first_name,concat('mr',first_name) as fullName from actor;
-- not necessary to use as 

select first_name,concat('mr',first_name) as fullName from actor where fullname='mrnick';
-- it will give error
-- where,join,using clause not run on alias 
select first_name,concat('mr',first_name) as fullName from actor order by fullname;
-- ye chl jaayega-- 

-- group by
select first_name,length(first_name) from actor;
-- these are single row functions 

-- multirow functions run on multiple rows at a same time.
-- combining similar values is called groupping,using function on combined group is called group function
-- when we use multiple row operation it is called group by operations 
show tables;
select * from film;
use world;
select * from country;
desc country;
create table t1(id int, city varchar(20));
insert into t1 values (1,'hey');
insert into t1 values (2,'hey2');
insert into t1 values (null,'hey');
select  count(*) from t1;
-- count is used to count the total number of data in table 
-- but if we use it in * it will use the column in which we dont have any null value
select  count(id) from t1;
-- but if we use it on nulll value column it will give us numbers of values except null values.
select sum(id) from t1;
-- distinct is used for unique values
select distinct(city) from t1;
select count(distinct city) from t1;
-- count dont count null values
select count(distinct id) from t1;
select * from city;
select count(name) from city where countrycode='afg';
-- making this in simple by using group by 
select countrycode,count(id) from city group by countrycode;
-- select ke baad hm vo he use karenge jispe jamne group by kiya h 
select district from city group by countrycode;
-- it will not run.
select countrycode,count(id),sum(population) from city group by countrycode;
SELECT 
    countrycode, COUNT(id), SUM(population) AS total_population
FROM
    city
GROUP BY countrycode order by total_population;

select * from city;

select countrycode,count(id),concat('country ', countrycode , ' has summ of pupulation ' , sum(population)) as result from city group by countrycode;
select countrycode,count(id),concat('country ', countrycode , ' has summ of pupulation ' , sum(population)) as result  from city where result >500 group by countrycode;
-- it will give error 
-- where and group by not work together,on place of where we use having.
select countrycode,count(id),concat('country ', countrycode , ' has summ of pupulation ' , sum(population)) as result  from city  group by countrycode having sum(population)>500;

select * from city;
select * from country;
select continent,region,count(*) from country group by continent,region;

select continent from country where continent='europe' group by continent,region;

select continent,region,count(*) from country where continent='europe' group by continent,region;
select continent,region,count(*) from country where continent='europe' group by continent,region order by continent,region;

select continent,region,count(*) from country  group by continent,region order by continent,region;
select continent,region,count(*) from country  group by continent,region order by region,continent;






