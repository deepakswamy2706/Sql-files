show databases;
use employees;
select * from employees;
-- e[1003 =>hiring _date-- 
select hire_date from employees where emp_no=10003;
select * from employees where hire_date >'1986-08-28';
-- here we are using two diff diff queries but we can do it in A single one with subquery or nested query
-- nested sub query
select * from employees where hire_date>(select hire_date from employees where emp_no=10003);
-- combined two queries.;
-- in () this query we will not use semi collumns 
select * from titles;
select title from titles where emp_no=10001;
-- senior engineer nikala yaha se 
select * from titles where title = (select title from titles where emp_no=10001);

select title from titles where emp_no in (10001,10002);
-- senior engineer, staff

select * from titles where title = (select title from titles where emp_no in (10001,10002));
-- error de raha h bcoz i have two results so i can not use =,>,<,>=,<= i can only use them when i have one result in subquery
-- we use other operators when i have more then one result in suquery.
-- 1.any(if i have any result in subquery it will run)
select * from titles where title =Any (select title from titles where emp_no in (10001,10002));

-- understanding it more. 
select salary from salaries where emp_no=10002;

select * from salaries where salary=(select salary from salaries where emp_no=10002);
-- it will give coz we have multiple values in subquery.
select * from salaries where salary=Any(select salary from salaries where emp_no=10002);
-- we get the users who has salaries equal to the salary of subquery.
select * from salaries where salary>Any(select salary from salaries where emp_no=10002);
-- >any mean greater then the salary of minimum salary of subquery. greater then 65828 which is lowest in subquery.

select * from salaries where salary< any(select salary from salaries where emp_no=10002);
-- <any mean less then the salary of maximum salary of subquery. minimum  then 72527 which is greatest in subquery.
select * from salaries where salary>All(select salary from salaries where emp_no=10002);
-- greater then the maxium values of all subquery
select * from salaries where salary<all(select salary from salaries where emp_no=10002);
-- lower then the lowest value of all subquery

select * from salaries where salary=all(select salary from salaries where emp_no=10002);
-- it will give us the value which is equal to the all subqueries.which is not possible coz no value can be equal to the values of all different different subqueries.


-- --------------------------------------------------22-09-2023-------------------------------------------------------------------------------------

create table a(id int);
insert into a values (10);
insert into a values (20);

create table b(newid int);
insert into b values (15);
insert into b values (5);
select * from b where newid >10;
select * from b where newid>(select id from a);
-- error dega coz we have multiple records in a ;
select * from b where newid>Any(select id from a);

select * from b where newid<any(select id from a);

select * from b where newid=any(select id from a);

select * from a;
select * from b where newid>all (select id from a);
select * from b where newid=all (select id from a);
select * from b where newid<all (select id from a);

-- any is like or all is like and condition
insert into a values (null);
select * from b where newid<all (select id from a);
select * from b where newid<all (select id from a where id is not null);

select * from a;
select * from b;
select * from b where newid in (select id from a);
use employees;
select * from employees;
select * from titles;
select e.emp_no,title from employees as e inner join  titles using (emp_no) where title <>'manager';
-- data where emp is not manager;
select e.emp_no from employees as e inner join  titles using (emp_no) where title <>'manager';
select * from employees join titles using (emp_no) where title ='manager' and emp_no =ANY(select e.emp_no from employees as e inner join  titles using (emp_no) where title <>'manager');

select employees.emp_no,last_name from employees,titles where (employees.emp_no,first_name,last_name,title)=(titles.emp_no,'georgi','klassen','staff');

-- row subquery
select mgr.emp_no ,mgr.from_date as fd from titles as mgr,titles as other where mgr.emp_no=other.emp_no;

select mgr.emp_no ,mgr.from_date as fd from titles as mgr,titles as other where mgr.emp_no=other.emp_no and mgr.title='manager';

select mgr.emp_no ,mgr.from_date as fd from titles as mgr,titles as other where mgr.emp_no=other.emp_no and mgr.title='manager' and mgr.title<>other.title;

select mgr.emp_no ,year(mgr.from_date) as fd from titles as mgr,titles as other where mgr.emp_no=other.emp_no and mgr.title='manager' and mgr.title<>other.title;
-- row subquery using subqueries
select emp_no,year(from_date) as fd from titles where title='manager' and (emp_no,year(from_date)) in (select emp_no,year(from_date) from titles where title <>'manager');

show databases;
show tables;
select * from salaries;
select salary,count(salary) from salaries group by salary;
select count(*) from salaries where salary =60117;
select max(salary) from salaries;

select salary,count(emp_no) from salaries where salary >=60170 group by salary order by salary;


select salary,count(emp_no) from salaries where salary >=All(select count(*) from salaries where salary =60170);
-- question 1
select salary,count(salary) from salaries group by salary  having count(salary)>= (select count(salary) from salaries where salary=60117 group by salary);

-- question --2
use employees;
select emp_no,salary from salaries order by salary desc;
select count(salary) as cs from salaries where cs> (select emp_no,salary from salaries order by salary desc);
select count(select salary from salaries order by salary desc);
select emp_no,max(salary) from salaries;
