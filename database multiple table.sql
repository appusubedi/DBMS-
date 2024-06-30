--USE OF MULTIPLE TABLE 
-- to create a table  of following data
--table: doctor (did , dname, contact no)
    --   staff (sid, sname , age , did)
	 --  patient(pid, pname, address, age ,did, sid )

	 --to create a database name 'hospital'
	 --syntax:
	 create database hospital; 

	 -- to create a table 
	 -- syntax:
	-- for doctor
	 create table doctor
	 ( did int primary key ,
	 dname varchar(20) ,
	 contact varchar(10)
	 );
	  
	  --for staff
	  create table staff 
	  (
	  sid int primary key,
	  sname varchar(20),
	  age int,
	  did int,
	  foreign key(did) references doctor (did)
	  );
-- to create a table  for patients 
--syntax:

create table patient (
pid int not null identity(1,1) primary key,
pname varchar(20),
address varchar(30),
age int,
did int,
sid int,
foreign key(did) references doctor(did),
foreign key(sid) references staff(sid)
);


-- to insert the data in doctor 
--syntax
insert into doctor 
values( 1 ,'aparajita' ,'9812345683'),
       ( 2 ,'aayush' ,'9000122234'),
	   ( 3 ,'laxit' ,'9010399251'),
	   ( 4 ,'anjila' ,'9835176197'),
	   ( 5,'sulav' ,'9746352718'),
	   ( 6 ,'darsan' ,'9824572853');

	   select*
	   from doctor ;
	   
--to insert the data in staff table 
--syntax:
insert into staff
values( 1 , 'asmita', 20,1 ),
      ( 2 , 'arpana', 21,1 ),
	  ( 3 , 'hari', 19,2 ),
	  ( 4 , 'ram', 20,5 ),
	  ( 5 , 'sita', 24,5 ),
	  ( 6 , 'hanuman', 23,3 ),
	  ( 7 , 'laxman', 25,6 ),
	  ( 8 , 'rawan', 17,4 );
	  select *
	  from staff ;
	  --to insert the data in patient
	  --syntax
	  insert into patient
	  values(  'chhaya','dang', 35 , 1 , 1),
	        (  'bhagabata','kathmandu', 21 , 1 , 8),
			( 'raju', 'dang', 40 , 4 , 7),
			( 'shankar','jhapa',  64 , 2 , 6),
			(  'radha','karnali',  28 , 3 , 1),
			( 'hemraj','butwal',  64 , 5 , 5),
			( 'tirtharaj','nepaljung', 44 , 3 , 4),
			(  'binod','ilam', 47 , 6 , 3),
			(  'prakash','gulmi',  35 , 2 , 2),
			( 'aayam', 'dolpa',  36 , 4 , 6);
			
			select*
			from patient;


			--JOIN operator
			--i) cross join
			--ii) inner join
			--iii) outer join 
			    --  a. left outer join
				--  b. right outer join
				 -- c.full outer join 
--CROSS JOIN
--cross join is used to display all possible records of multiple tables  with or without satisfied join condition (primary key and foreign key must be same )
--syntax:
      -- select attributes list 
	  -- from table 1 cross join table 2
	
	--  find cross join of doctor and staff
	 select*
	 from doctor ,staff;

	 --find name of those staff who helps to doctor of name end with 'a'
	 --syntax
	 select sname, d.dname
	 from staff as s
	 cross join doctor d
	 where  d.dname like '%a'
	 -- yo code run garda doctor staff ko link bako sabai doctor i.e all possible records display vayo 
	-- so specific result display garna we can run following code (kun staff ly kun doctor lai serve garxa vanny record matra display hunxa)
	  select sname, d.dname
	 from staff as s
	 cross join doctor d
	 where  d.dname like '%a'and  d.did = s.did;

--	 2, INNER JOIN
--it is used too combine records of multiple table if join condition exit
--it is  most widely use join
--cross join ma sstaff table ma did nahuda ni possible combination display hunxa but inner join ma staff table ma did xaina vany possible combination display hudaina )
--syntax
   -- select attributes list 
	--from table 1 inner join table2
--	on join condition 
	--  where condition;
	 -- example find inner join of patient and staff 
	 select *
	 from staff s  inner join patient p on s.sid= p.pid;  

	--example : find name of the patient who serve by staff of age less than 30 
	select*
	from patient;


select p.pname ,s.sname
from patient p inner join staff s
on s.sid = p.pid
where s.age <20;

--3) OUTER JOIN
 -- left outer join display all records of first table and set null values to unmatch records of second tables 
 --( first table ko sab record display garxa and  second table ko sid match navako table chai null display garxa )
 --syntax:
 -- select attributes 
  --from table1 left outer join table 2 
  --on join condition
  --where condition ;

 -- LEFT OUTER JOIN
  --find the outer join of doctor and staff relation
  select *
  from doctor d left outer join staff s
  on  s.did=d.did;


 -- find name of all doctor who works itself without help of any staff
 select  d.dname
 from doctor d left outer join staff s
 on s.did= d.did
 where s.did is null;
-- (we display that doctor who doesnot serve any staff)

select d.dname , s.sname 
from doctor d  left outer join staff s
on s.did= d.did
 where s.did is not null;

 --RIGHT OUTER JOIN
  -- right outer join display all records of second table and set null values to unmatch records of first tables 
  --syntax
  --select attributes
  -- from table 1 right outer join  table 2
  --on join condition 
  --where condition

  -- find name of all staff who works itself without help of any doctor
 select  s.sname
 from staff s right outer join doctor d
 on s.did= d.did
 where s.did is null;

 

 --find the inner join of doctor and staff relation
  select *
  from staff s right outer join doctor d
  on  d.did=s.did;


 -- FULL OUTER JOIN
-- It is a combine form of  both left and right outer join .
--syntax 
   select *
  from staff s full outer join doctor d
  on  d.did=s.did;

   select *
  from doctor d full outer join staff s
  on  s.did=d.did;
 -- (it gives the combine form of data present in bothn table )

  ]]


 -- it is used to display only dispaly matching records of miltiple table with pre define join condition 
-- [pre define ma on vanyra join condition define garnu pardaina ]
--{sql server cannot support natural join operetion due to lack of pre define join condition }

--syntax:--
/*
select attributes 
from table2 natural join table 3 
where  condition ; 
     */
	 /*
--find natural join of doctor and staff 	
select *
from doctor d natural join staff s ;
*/


--NESTED QUERY 
--it is also called sub query 
--the query within another query is called sub query 

-- There are three types of nested query 
--1) scalable sub query 
--2) single row sub-query 
--3)multiple row sub-query 


--i) scalable
--it is used to compare fix values written by inner query 
--syntax:   
     --select attributes 
	 --from table1
	 /* where attributes if table1 =(select attributes
	                                from table2
									*/
  
 
 --here we create different data base for	practicing nested query								where condition;)
--nested DB
create database NestedDB;

create table department
	 ( did int primary key ,
	 dname varchar(20) ,
	 location varchar(20),
	 contact varchar(10)
	 );


	  create table employee 
	  (
	  eid int primary key,
	  ename varchar(20),
	  salary int,
	  did int,
	  foreign key(did) references department (did)
	  );

	  insert into department
      values( 1 , 'csit', 'dang',9800034567 ),
      ( 2 , 'science', 'kathmandu',9888822345 ),
	  ( 3 , 'bba', 'pokhara',9746372822 ),
	  ( 4 , 'economic', 'itahari',9829529975 ),
	  ( 5, 'finance', 'jhapa',9868922477 );
	  select*
	  from department;

	  insert into employee
	  values(1,'kismat', 20000,1),
	  (2,'ricky', 20000,3),
	  (3,'nirdosh', 30000,4),
	  (4,'rojina', 20000,5),
	  (5,'rhythm', 20000,5),
	  (6,'sijan', 40000,2),
	  (7,'swoyekshya', 60000,1),
	  (8,'appu', 50000,4);
	    select*
	  from employee;


	  --find records of those employee of salary is maximum
	  select*
	  from employee
	  where salary =(select max(salary)
	                 from employee);

-- find records of those employee of salary greater then average salary
 select *
 from employee
 where salary > ( select avg (salary)  
      from employee);

--single  row nested query 
  --it is used to display the data of single row 
 -- syntax: 
      /*     select attributes
           from table1 
		   where attributes =(select attributes 
		                      from table2 
							  where condition);  */
--display records of those department in which employee 'appu' works
select *
from department 
where did =(select did 
              from employee
			  where ename='appu'
			  );

--multi row nested query
--display records of those department in which employee of salary greater than 20,000 works 
 select*
 from department 
 where did in (select did
               from employee
			   where salary >20000);

--
