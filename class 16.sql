use sakila;

-- if only reverse of one column is equal to other it will be inserted else not.
create table t1(id int,name varchar(20),status bool,sname varchar(20), check (reverse(sname)=name));
drop table t1;
create table t1(id int,name varchar(20),status bool,sname varchar(20),constraint new_column check (reverse(sname)=name));
-- here we gave name to our constraints.
insert into t1 values (10,'saras',True,'saras2');
-- error 
insert into t1 values (10,'saras',True,'saras');
select * from t1;
-- if purchase price  is less then sales price it will be inserted else not.
create table t2(house_id int,purchase_price int,sales_price int,check(purchase_price<sales_price));
insert into t2 values(1,12000,13000);
insert into t2 values(1,14000,13000);
select * from t2;

-- making 2 foreign keys 
-- its important to make both referenced columns unique to refence them in child thats why we made country_name,city unique
create database foreignkeyuse;
create table  customer111(
				cst_id int primary key ,
                cst_name varchar(20),
                contry_name varchar(20),
                city varchar(20), 
          constraint abc1  unique (contry_name, city) );
                
drop table customer111;
drop table contry;
create table contry (
				contry_id  int,
				contry_name varchar(20),
                city varchar(20),
                constraint marketing_custmr_contry_fk
                foreign key (contry_name,city) references customer111(contry_name,city) );
select * from customer111  ;
select * from contry;

create table phone(id int);
insert into phone values(1);

alter table phone add column p_name varchar(10);
select * from phone;  
-- we gets null if we want to fix any deault values;
alter table phone add column p1_name varchar (10) default 0;
select * from phone;
alter table phone add column p2_name varchar (10) not null;
select * from phone;
-- dropping column
alter table phone drop p2_name;
-- renaming the table 
rename table phone to phone2;
-- can also rename using alter.
alter table phone2 rename to phone3;
select * from phone2;

select * from phone3;
-- renaming column name
alter table phone3 rename column p1_name to p2_name;
select * from phone3;
desc phone3;
-- changing name of column and datatype both at same
alter table phone3 change id phone_id varchar(10);
-- changing datatype of column
alter table phone3 modify phone_id int;
desc phone3;
insert into phone3 values(1,'sam','ne');
alter table phone3 modify p_name int;
select * from phone3;
-- if we have data in our column we cannot change its daqtatype untill it is empty again.

-- 
 -- 1  create a table name AS customer having cid,cname,orderid,using the alter statement make cid as prmary key with auto increament feature,
 -- 2 add a new coljmn email with unique constraint and name the constraint,
-- 3 add the orderid as foreign key with relation with orders table
select * from phone3;