-- constraints 
-- char- is a fix size data type it will keep only the fixed data in it,char(20) kitne bhi de less then 20 it will use 20 space wastage hoga 
-- but in varchar if used 4 instead of 20  then it will  use those 16 space somewhere else

create database new_database;
use new_database;
create table ep1(name char(20));
insert into ep1 values('a');
select * from ep1;

create table ep2(name char(20));
insert into ep2 values('a  ');
select name,length(name)from ep2;
insert into ep2 values('a  b');
select name,length(name)from ep2;

create table ep3(name varchar(3));
insert into ep3 values('a');
select name,length(name)from ep3;
insert into ep3 values('a ');
select name,length(name)from ep3;

create table ep4(name varchar(3));
insert into ep4 values('a');
select name,length(name)from ep4;
insert into ep4 values('a ');
select name,length(name)from ep4;
insert into ep4 values('a  ');
select name,length(name)from ep4;

insert into ep4 values('a   ');
select name,length(name)from ep4;
insert into ep4 values('a     ');
select name,length(name)from ep4;

-- in varchar if we have value more then its size ye extra space ko trunkate kr dega 
-- usinf check constraint
create table ep5(eid int check(eid>2));
insert into ep5 values(1);
-- i will give us error coz of check
insert into ep5 values(3);
select * from ep5;

create table ep6(gender char(1) check(gender in ('m','f','o')));

insert into ep6 values('m');
select * from ep6;

insert into ep6 values('z');
-- will give error
select * from ep6;

create table ep7(age int, gender char(1), check (age >10 and (gender in ('m','f','o'))));
insert into ep7 values(2,'m');
-- error
insert into ep7 values(11,'m');
select * from ep7;

insert into ep7 values(12,'m');
select * from ep7;

insert into ep7 values(13,'m');
select * from ep7;
-- how we delete data 
-- delete dml 
delete from ep7;
select * from ep7;
-- delete command delete all data from table.
-- deleting data for condition
delete from ep7 where age =11;
select * from ep7;
insert into ep7 values(15,'m');
select * from ep7;
-- update dml
update ep7 set age =10;
-- it is used for updating all column data 
update ep7 set age =33 where age =12;
select * from ep7;
update ep7 set age =32 limit 1;
select * from ep7;

delete from ep7 order by age limit 1;
select * from ep7;
insert into ep7 values(13,'m');
insert into ep7 values(133,'m');
insert into ep7 values(132,'f');
insert into ep7 values(3,'m');
insert into ep7 values(43,'m');
insert into ep7 values(54,'m');
insert into ep7 values(34,'m');
insert into ep7 values(1,'f');

select * from ep7;
drop table ep7;
-- in drop data and structure both are deleted but we can roll back it again too
select * from ep7;

create table ep7(age int ,gender char(1));
insert into ep7 values(13,'m');
insert into ep7 values(133,'m');
insert into ep7 values(132,'f');
insert into ep7 values(3,'m');
insert into ep7 values(43,'m');
insert into ep7 values(54,'m');
insert into ep7 values(34,'m');
insert into ep7 values(1,'f');
select * from ep7;
 truncate table ep7;
 select * from ep7;
 -- truncate gives us the architacutre of table, after using truncate we cannot roll back our data back
 


