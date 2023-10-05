-- Window Function
use sakila;
create table employez(id int primary key auto_increment,dept varchar(20),Salary int);
 
 insert into employez(dept,Salary) values('hr',200),('hr',300),('hr',100),
 ('marketing',70),('marketing',50),('marketing',200),('marketing',400),('dsa',150),('dsa',120),
 ('dsa',40),('dsa',90),('dsa',500);
 select * from employez;
 select avg(salary) from employez;
 -- it will give us the avg salary of all able. 
 
 select dept,avg(salary)  from employez group by dept;
 -- this will give us the avg salaries by the departments 
 
 -- windows 
 -- 1. over() perform aggregate on groups of rows. hr ek row ke liye aggreate value dega
 select id,dept,salary,avg(salary) over() from employez;
 -- ye hr ek row ke liye avg de dega which is equal to the avg salary of all table too
 select avg(salary) from employez;
 select id,dept,salary,avg(salary) over(),max(salary) over() from employez;
 select max(salary) from employez;
 -- giving it alias
  select id,dept,salary,avg(salary) over() AvgSalary,max(salary) over() MaxSalary from employez;

  select id,dept,salary,avg(salary) over(order by salary) AvgSalary,max(salary) over() MaxSalary from employez;

-- partition by 
  select id,dept,salary,avg(salary) over(partition by dept) AvgSalary from employez;
-- in partion by data is sorted as per the windows  like avg of dsa,hr,marketing is different different but in order by the avg was same for all data we just ordered it .
  select id,dept,salary,avg(salary) over() AvgSalary from employez order by salary;
  
select id,dept,salary,sum(salary) over(order by salary) SumSalary from employez ;

-- here the sum of salary will be different
select id,dept,salary,sum(salary) over(order by salary desc) SumSalary from employez ;

select id,dept,salary,sum(salary) over(order by dept) SumSalary,sum(salary) over(partition by dept) partitionSum from employez ;

select sum(salary) from employez group by dept;
-- printing it for every row
select id,dept,salary,sum(salary) over(partition by  dept ) as PartitionSum ,
sum(salary) over(partition by  dept order by salary) as RollingSumDept from employez;
