use sakila ;
-- float,double,decimal datatype
-- double(total,precision)
create table xyz(price double(5,2));
insert into xyz values(15.2);
insert into xyz values(15.24);
insert into xyz values(15.2343);
insert into xyz values(1522.22);
-- error dega cox maximum values are 5 
insert into xyz values(1522.2);
-- decimal and double both are same
select * from xyz;
create table xyz1(price1 float,price2 double);
insert into xyz1 values(1.1234567,1.1234567);
select * from xyz1;


create table xyz2(birthdate date);
-- date datatype
-- ---yyyy-mm--dd
insert into xyz2 values('2023-09-26');
-- curdate
select * from xyz2;

insert into xyz2 values(curdate());
-- time    hh:mm:ss
drop table xyz3;
create table xyz3(birthdate date,birthtime time);
insert into xyz3 values('2023-09-26','10:58:32');

select * from xyz3;
insert into xyz3 values('2023-09-26',curtime());

-- now gives time and date both its data type needs to be datetime ;

create table xyz4(birthdate date,birthtime time,full_birthday datetime);
insert into xyz4 values(curdate(),curtime(),now());
select * from xyz4;

-- week 
select birthdate,birthtime,week(full_birthday) from xyz4;

select birthdate,birthtime,month((full_birthday)) from xyz4;
select birthdate,birthtime,monthname((full_birthday)) from xyz4;
select birthdate,birthtime,last_day(full_birthday) from xyz4;


select birthdate,birthtime,last_day(full_birthday),datediff(full_birthday,now()) from xyz4;
-- datediff gives difference in days 

select birthdate,birthtime,last_day(full_birthday),datediff(now(),full_birthday) from xyz4;
-- date_add(+)
select birthdate,birthtime,last_day(full_birthday),date_add(full_birthday,interval 5 day) from xyz4;

select birthdate,birthtime,last_day(full_birthday),date_add(full_birthday,interval 5 year) from xyz4;

-- date_sub(-)
select birthdate,birthtime,last_day(full_birthday),date_sub(full_birthday,interval 5 year) from xyz4;
-- question1
-- date
-- year, month in english, date, week of the year  the day of the date 

select * from xyz4;
select full_birthday from xyz4 ;
select concat(year(full_birthday),' ',monthname(full_birthday),' ',date(full_birthday),' ',week(full_birthday)) answer from xyz4;
-- another method by using date format method, here we can tell in which format we want out date
select full_birthday,date_format(full_birthday,'%b %c') from xyz4;
use sakila;
create table captions(text varchar(20),created_at timestamp default now());
insert into captions (text));
-- on update is used to show at when last time we updated something in table.
create table caption2(text varchar(150),created_at timestamp default now(),updated_at timestamp on update now());
insert into caption2(text,created_at) values ('hey',now());
select * from caption2;
update caption2 set text='hey2';
select * from caption2;
update caption2 set text='hey3';