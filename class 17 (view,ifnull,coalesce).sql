show databases;

use sakila;
show tables;
-- view 
select * from actor;
select actor_id,first_name from actor;
 -- creating view ,view is used to save the view of a table.
 create view actor_view as select actor_id,first_name from actor;

select * from actor_view;
create table test1(id int,name varchar(20));
insert into test1 values(1,'deepak');
insert into test1 values(2,'aman');
insert into test1 values(3,'aditya');
select * from test1;
select id from test1;
-- creating view for id from test1
create view test1_view as select id from test1;

select * from test1_view;
select * from test1_view where id=2;
insert into test1_view values(4);
select * from test1_view;
select * from test1;
-- when we insert data into view it stored in the real table;this is why 4 is also stored in test1 table too
insert into test1 values(5,'nia');
select * from test1;
select * from test1_view;

delete from test1_view where id=4;
select * from test1_view ;
select * from test1;
-- when we delete something in view it will be deleted from table too
-- view doent occupy storage it access the table only 
select * from test1_view;
-- i only have one column oin test1_view
create or replace view test1_view as select id,name from test1;
select * from test1_view;
-- here we replaced our old view with new view in new view we have both the columns
select name from  test1 where id>2;

alter view test1_view as select name from test1 where id>2;
select * from test1_view; 
-- alter can also be used to change view
show tables;
-- we can see the view in show tables;
-- view is also can be dropped same as tables.
 drop view test1_view;

-- lets make typical view.
select * from country;
select * from city;
select country_id,country,city_id,city from country join city using(country_id);
-- making its view.
 create view country_view as select country_id,country,city_id,city from country join city using(country_id);

select * from country_view;
insert into country_view values(9999,'yyy',34343,'japan'); -- error dega coz
-- when we make a view from join,group by,distinct,having union subquery or used any aggregation to make view we cannot update or insert in our view.
-- we can only update or insert in our view when our view is simple.
select * from test1;
insert into test1 values(null,'asds');
select count(name) from test1;
select count(id) from test1;
-- count not count null

-- replacing null  with 0 
-- if null 
select count(ifnull(id,0)) from test1;
select id from test1;

alter table test1 add column salary int;

select id,ifnull(id,0) from test1;
select count(id) from test1;
-- using coalesce
alter table test1 add column salary int;

insert into test1 values(4,null,100);
insert into test1 values(null,null,200);
insert into test1 values(100,null,null);
insert into test1 values(null,null,null);

select * from test1;
select id,name,salary,coalesce(id,name,salary) from test1;
-- coalesce returns not null values of the first one not null value of column.
-- if all columns are null it will return null.

-- question create table movieid,moviename,duration of movie,ticketprice another table customer customerid,cname,movieid,watchdate both tables  join
-- all customerid,cname,all movies name which a customer has seen  
-- get all the information of custmers whaether they watched movie or not
-- get the cid,total no of movies a person watched after 2000 year.alter
-- find out total ammount of money spend on movies and avg duration of movie he has seen
-- givet cid,cname who has watched maximum no of movies.


create table moviex(m_id int primary key,m_name varchar(20),m_duration time);
insert into moviex values(1,'aa','01:10:22');
insert into moviex values(2,'aere','01:14:45');
insert into moviex values(3,'werde','55:45');
insert into moviex values(4,'derds','01:30:06');
insert into moviex values(5,'ttt','02:10:07');
insert into moviex values(0,null,null,null);
select * from moviex;
alter table moviex add column ticket_price int;
update moviex set ticket_price=123 where m_id=1;
update moviex set ticket_price=217 where m_id=2;
update moviex set ticket_price=197 where m_id=3;
update moviex set ticket_price=265 where m_id=4;
update moviex set ticket_price=145 where m_id=5;

create table customerx(c_id int,c_name varchar(20), m_id int,CONSTRAINT fk_customer_movie
FOREIGN KEY (m_id)
REFERENCES moviex(m_id),watch_date date);
desc customerx;
desc moviex;
select * from customerx;
insert into customerx values(11,'a',5,'1999-06-23');
insert into customerx values(11,'a',4,'2001-11-06'),(4,'b',4,'2001-11-06');
insert into customerx values(3,'c',3,'2005-03-22'),(08,'e',2,'2004-01-20');
insert into customerx values(11,'a',4,'2001-11-06'),(4,'b',4,'2014-07-15');
insert into customerx values(17,'d',1,'1999-10-11'),(19,'e',1,'2013-09-23');
insert into customerx (c_id,c_name,m_id) values(20,'f',0);
update customerx set m_id=null where c_id=20;
select * from customerx;
insert into customerx(m_id) values(null);
select * from test1;
-- question 1
select c_id,c_name,m_name from customerx join moviex using(m_id) where c_name='a';
-- question 2
select c_id,count(m_name) from customerx join moviex using(m_id) group by c_id;
select * from moviex;
select  * from moviex join moviex using(m_id);
update moviex set m_duration ='00:55:45' where m_id=3;
select sum(ticket_price),time_to_sec(m_duration) from customerx join moviex using(m_id) ;
update moviex set m_duration= time_to_sec(m_duration);
SELECT TIME_TO_SEC(m_duration) AS time_in_seconds
FROM moviex;

UPDATE moviex
SET m_duration = TIME_TO_SEC(m_duration);

DELETE from moviex where m_id = 2;




