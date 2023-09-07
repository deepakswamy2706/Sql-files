create database test1;
use test1;

create table student(sid int,email char(20));
select * from student;
insert into student  values(2,null);
select * from student;
insert into student(sid) values(3);
select * from student;
insert into student(sid) values(3,'dpkswamy@gmail.com');
select * from student;
create table student3 (sid int,name char(20) default 'aaa',age int);
-- constraints= invalid data cannot be inserted (condition that  will only allow data which is specified)
-- 1 not null()
create table student4 (sid int not null default 0,name char(20) default 'aaa',age int default 26);
insert into student4(age) values (26);
select * from student4;
insert into student4(sid,age) values (null,26);
-- it wil lgive us error coz we cannot give null value in sid
-- 2 unique
create table student_unique(sid int unique default 0 ,name char(20) default 'aaa',age int);
insert into student_unique(sid,age) values(2,26);
select * from student_unique;
insert into student_unique(sid,age) values(2,25);
-- will give error of duplicasy for unique
insert into student_unique(sid,age) values(null,25);
select * from student_unique;
-- null can be used in unique,null mearn no reference it does not store any space.
select sid,sid+5 from student_unique;
insert into student_unique(age) values(5);
select * from student_unique;
insert into student_unique(age) values(45);
-- it will not run bcoz once default value 0 is submitted it will be cosidered as unique values again it will not be used.

-- how to delcare A KEY PRIMARY KEY
create table employee(E_id int primary key,E_name char(20));
-- primary key null nhi hoti
insert into employee values (1,'deepak');
select * from employee;
insert into employee values(2,'deepak');
insert into employee values(2,'asvcd');
-- wil get error coz primary key cannot be duplicated
insert into employee values(null'asvcd');
-- it will give us error too coz primary key cannot be null too
create table employee222(E_id int ,E_name char(20),primary key(E_id));
-- this method is used mostly to make primary key.
-- datatype in sql is numerical, string ,date,in numerical int i
create table ex1(eid int(1));
insert into ex1(eid)values (3);
select * from ex1;
insert into ex1(eid)values (322222);
select * from ex1;
-- here width is min value, it is used mostly with zerofill.
create table ex2(eid int(2) zerofill);
insert into ex2(eid)values (3);
select * from ex2;
create table ex3(eid int(2) zerofill);
-- coz it is unsigned it will not tke negative values 
insert into ex3(eid)values (-3);
select * from ex3;
create table ex4(eid int(2) signed);
insert into ex4(eid)values (-3);
select * from ex4;
-- big int takes big data then int 
create table test34 (id bigint unsigned);
insert into test34(id) values (12324343434343443-1);
select * from test34;
insert into test34(id) values (12324343434343443*100);
select * from test34;
-- tinyint ,smallint, mediumint 
-- boolean  boolean is represented in tinyint inside database
create table bool(i bool);
insert into bool values (true),(false);
select * from bool;
insert into bool values (1),(0),(-128),(127);
select * from bool;











