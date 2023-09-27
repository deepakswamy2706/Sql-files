create database database1;
use database1;
create table table1(name char(20) default 'ram',age int,mobile_no int ,email char(20));
insert into table1 values('deepak',25,2096678654,'dpk@gmail.com');
select * from table1;
insert into table1 values('deepak',21,2096678654,'swamy565@gmail.com');
insert into table1 values('qwawaa',23,2096678444,'deepakwese@gmail.com');
insert into table1 values('de',25,2096645450,'dpeses12@gmail.com');
insert into table1 values('awasas',26,34343221,'aws@yahoo.com');
insert into table1 values('trgrrfr',34,2096678111,'wqaw@gmail.com');
insert into table1 values('omojkj',19,1234334443,'eredmail.com');
select * from database1.table1;
delete from table1;
select * from table1;

drop table table1;
select * from database1.table1;
select * from table1;


truncate table table1;
select * from database1.table1;

use sakila;
show tables;
show columns from actor;
select first_name,concat(' Mr ',first_name)  full_name from actor;
select first_name,concat('Mr',first_name) full_name from actor order by full_name;
create table  table1(age int ,name varchar(20));
insert into table1 values(11,'d');
insert into table1 values(13,'e');
select * from table1;
insert into table1 values(18,'ewa');
insert into table1 values(19,'qzx');
insert into table1 values(23,'wsa');
insert into table1 values(21,'gf');
insert into table1 values(24,'dfc');
insert into table1 values(32,'ew');
insert into table1 values(45,'r');
select * from table1;
select count(*) from table1;
select countrycode,count(id),sum(population) as total_population from city  group by countrycode having total_population>80000000 order by total_population desc;
use world;
show tables;

use world;
show tables;
select * from city;
(select gdp from where continent ='europe');