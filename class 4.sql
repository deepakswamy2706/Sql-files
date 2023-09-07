show databases;
use sakila;
show tables; 
select * from actor;
-- not operator with other or condition

SELECT * FROM film_list where fid <7 and not ( fid=4 or fid=6);

SELECT * FROM film_list where fid <7 and not ( fid=4 or fid=6);
-- order by is used to manage data in ascending or desciding order.
-- for ascending order
SELECT * FROM film_list order by category ;
-- for descinding order 
SELECT * FROM film_list order by category desc;

SELECT * FROM film_list order by 4 desc;

SELECT * FROM film_list order by 2 desc;

SELECT * FROM film_list order by price asc;

SELECT fid,title fROM film_list order by 2 desc;
select * from film_list;
-- error
SELECT fid,title fROM film_list order by 3 desc;

SELECT fid,title fROM film_list order by 4 desc;


SELECT fid,title,price fROM film_list order by price ;

select * from address;
-- missing values are given priority first.
select * from address order by district;
-- sorting based on two columns.
select address,address_id,district from address order by district,address_id;


select address,address_id,district from address order by district desc,address_id desc;

select address,address_id,district from address order by district desc,address_id ;
-- to see the limited records we use limit .
select * from address limit 3;

select * from address limit 3 order by adddress_id;
 --   limit and order by does not run together.
 
 select address_id,address from address limit 3,2;
 -- here 3 is the offset the rows we want to skip and then 2 is the number of rows we want.

 select address_id,address from address limit 5,5;
 -- we can also use keyword offset
  select address_id,address from address limit 5 offset 3;

select 2+2;
-- dual table only has one record.
select 2+2 from dual;

select now() from dual;

select now();
-- this both method is used to know the date and time of our system.



