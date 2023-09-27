show databases;
use employees;
show tables;
select * from dept_emp;
-- co related queries.
-- exists keyword use 
select count(*) from departments where exists (select * from dept_emp where emp_no<100);
-- baahr wali query tb he chalegi jb sub query chale.yaha answr nhi aaya coz sub query koi output nhi de rhi
select * from customer, customer.first_name;  

-- nested query using 'from' clause
select * from (select emp_no,year(birth_date) from employees) as xyz;
select birthy from (select emp_no,year(birth_date) as birthy from employees) as xyz;

select birthy from (select emp_no,year(birth_date) as birthy from employees);
-- error dega coz we need to give alias or it will give us error
select emp_no,montly_salary from (select emp_no,salary/12 as montly_salary from salaries) as ms limit 5;

use sakila;
select * from payment;
select amount,film_id from payment join rental  using (rental_id) join inventory using (inventory_id) join film using (film_id);

-- sum of payments of all movies
select sum(amount) as total_amount,film_id from payment 
join rental  using (rental_id) 
join inventory using (inventory_id) 
join film using (film_id) group by film_id;

select * from (select sum(amount) as total_amount,film_id from payment 
join rental  using (rental_id) 
join inventory using (inventory_id) 
join film using (film_id) group by film_id) n;

select sum(total_amount)from (select sum(amount) as total_amount,film_id from payment 
join rental  using (rental_id) 
join inventory using (inventory_id) 
join film using (film_id) group by film_id) n;

select avg(total_amount)from (select sum(amount) as total_amount,film_id from payment 
join rental  using (rental_id) 
join inventory using (inventory_id) 
join film using (film_id) group by film_id) n;

-- case statemnent
use sakila;
show tables;

-- method 1 
select payment_id,rental_id,amount from payment;

select 
case 
when rental_id=76 then 'yes'
end 'newcolumn',
rental_id,payment_id,amount from payment;

select 
case 
when rental_id=76 then 'yes'
when rental_id=573 then 'no'
when rental_id=1183 then 'no'
else rental_id
end 'newcolumn',
rental_id,payment_id,amount from payment;
-- method 2, but we use method 1
select 
case rental_id
when 76 then 'yes'
when 573 then 'no'
when 1183 then 'no'
else rental_id
end 'newcolumn',
rental_id,payment_id,amount from payment;


select 
case 
when rental_id=76 then 'yes'
when rental_id=573 then 'no'
when rental_id between 1000 and 1500 then 'values between 1000 to 1500'
else rental_id
end 'newcolumn',






rental_id,payment_id,amount from payment;

-- round function
select round(192.46) from dual;
select round(192.46,1) from dual;
select round(192.465,2) from dual;
select round(192.46,2) from dual;
select round(192.465,-1) from dual;
select round(195.465,-1) from dual;
select round(185.465,-2) from dual;
select round(111345.465,-3) from dual;
select round(115345.465,-4) from dual;
select round(177.439,-2) from dual;
select round(177.439,-3) from dual;
select round(677.439,-3) from dual;
-- mod 
select mod(6,2) from dual;
select mod(7,2) from dual;
-- truncate
select truncate(677.29,2) from dual;
select truncate(677.429,2) from dual;
select truncate(677.429,-1) from dual;
select truncate(677.429,-2) from dual;
select truncate(677.429,-3) from dual;
select year(hire_date) from employees where emp_no between 10003 and 10007;
use employees;
-- question-1
select * from employees;
select year(birth_date) from employees where emp_no=10003;
select * from employees where year(birth_date)>(select year(birth_date) from employees where emp_no=10003) and year(hire_date)>(select year(hire_date) from employees where emp_no=10005;);
select year(hire_date) from employees where emp_no=10005;
select * from employees where year(birth_date)>Any(select year(birth_date),year(hire_date) from employees where emp_no=1003 or emp_no=10005);
-- question 1
select emp_no,first_name,concat(first_name,' ',last_name) as fullName from employees where year(birth_date)>(select year(birth_date) from employees where emp_no=10003) 
and year(hire_date)<(select year(hire_date) from employees where emp_no=10005);
select year(hire_date) from employees where emp_no=10005;
-- question 2
select * from employees where year(hire_date) >all(select year(hire_date) from employees where emp_no between 10003 and 10007);
-- question 3
show tables;
select dp.emp_no,dp.dept_no,dept.dept_name,emp.first_name, year(to_date)-year(dp.from_date) 
 from  dept_emp dp join departments dept using(dept_no) 
 join employees emp using (emp_no) where year(to_date)-year(dp.from_date) >28;

-- question 4
select abs(dayofweek(from_date)-2) from dept_emp;
select * from dept_emp;

-- question 5
select * from employees;
select * from dept_emp;
select * from departments;
select employees.first_name,dept_emp.emp_no,dept_emp.dept_no,departments.dept_name,(year(dept_emp.to_date)-year(dept_emp.from_date))*12
from dept_emp join departments using(dept_no) join employees using (emp_no) 
where (year(dept_emp.to_date)-year(dept_emp.from_date))*12 >400;
-- select 6
drop table resturent;
create database  resturents;
use resturents;
create table resturent(
  resturnet_key int  primary key ,rest_add varchar(20) ,manager_id int  unique ,total_emp int  
  );
  
  insert into resturent values (1, 'dudu',3 ,12),
							(2 ,'jaalor', 2 ,8),
                            (3 ,'neemranan', 4, 22) ,
                            (4 ,' churur' , 1 , 34);
select * from resturent;                         
create table managers ( 
          manager_id  int  ,
          manger_name varchar(20), 
          contact_no  int ,
          FOREIGN key (manager_id) REFERENCES  resturent(manager_id) 
);
          
show tables;
-- drop table managers;