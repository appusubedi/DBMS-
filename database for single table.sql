

   --IN DDL  (DATA definition language we can do 
   --create 
   --alter 
   --drope 
   ---delete  

  -- CREATE STATEMENTS

  --to create a database 
  --syntax
  create database college;
  -- to create a table in database 
 -- syntax:
  create table students(
  sid varchar(5) primary key ,
  sname varchar(20),
  dob date,
  marks int);



 -- DROPE STATEMENTS 
 --it is used to delete structure of tables 

  -- remove attribute 'address'  from students table
alter table student 
drop column address ;

--REMOVE
--it is used to delete structure of the table
--syntax
drop table students;

--delete statements
--it is used to delete existencce reward from tables
--syntax:-
--delete from table_name
--where condition 
--example
--delete all students who get marks less than 120 
delete from student 
where marks < 120 ;

  -- ALTER STATEMENTS
  --it is used to change the table
  /*
  by adding new attributes (column) to the table
  by removing existing attributes from the tables 
  by changing data types of the tables 
  by changing attributes name of the tables

  --syntax:-
  alter table table_name
  add new-attributes data;
  */
  --example 


   --insert new attributes "address" from students table
   alter  table student
   add address varchar(20);

   --change size of sname from 20 t0 50 
alter table student
alter column sname varchar(50);

--change data type of marks from int to strings 
alter table student
alter column marks varchar(20);
--to rename the attributes 
--syntax
   exec  sp_rename 'student.first name' , 'sname' ;
   

  -- DML (insert , update , delete , select)
 -- in DML we can do 
 -- insert, update ,detete and select


 --update statements
 -- it is used to update the values in the table
 /*syntax:-
 uodate table_name
set attributes = values
where condition;
*/
--example
--increase marks of all students by 40% of name start wit 'A'
update students
set  marks= marks + marks *0.4
where sname like '%a';

 --INSERT statements
  -- to insert the data in the table 
 -- syntax: 
  --insert into table_name
  --values(record 1),(records 2)....;

 -- example insert the data in student table 
  insert into students
  values('s1','aparajita','2003-3-03','200'),
  ('s2','laxit','2004-10-11','150'),
  ('s3','darsan','2005-3-26','100'),
  ('s4','asmita','2003-3-03','157'),
  ('s5','arpana','2006-6-09','212'),
  ('s6','sulav','2000-2-12','120');

  --select statements 
  select sname , marks 
from students;
where marks<>200 or dob <'2005-3-4';

select *
from students
where marks in(190,200, 180, 220,145);

select *
from students
where sname in('aparajita','laxit','asmita');
select *
from students
where sname not in('aparajita','laxit','asmita');


select *
from students
where marks<>164 and marks<>200 and marks<>220;
select *
from students 
where marks between 150 and 200;



 -- select the data from the table
 --display all records from students
 --(* means all we also can use all the  attritutes name instant of *)
   select *           
  from students ;
  -- to select the data from table there are various types of clause present 
  1) where clause 
  -- where clause represent the certain condition we have to display under
 --example 
 --display name of all students who gets marks greater than 150 
 select sname , marks
 from students
 where marks >150;
   
--display name of all students of marks not equal to 200 or dob less than 2070-2-4
select sname
from students
where marks > 180 or dob <'2004-2-4';

--OPERATORS USED IN WHERE CLAUSE
--multiple or
/*
syntax:-
select attributes list 
from student 
where attributes in (values1,values2------valuesn
*/
--example 
select *
from students 
where sname in ('aparajita','laxit','aayush');


/*
in between
syntax:-
select attributes list 
from tables 
where attributes between values1 and values 2;
*/
--display all from students  who obtain marks between 150-200
select *
from students
where marks between 150 and 200 ;
--or
select * 
from students
where marks>=150 and  marks <= 200 ;

/*
NOT BETWEEN
syntax:-
select list attributes 
from tables
where attributes not between values1 and values2;
 */
 -- example
 --display the all from students who obtain marks not between 150 -200
 select *
 from students
 where marks not between 150 and 200;
 --or
 select *
 from students 
 where marks< 150 or marks>200 ;

 /*
 IS NULL /IS NOT NULL

 it is used to check whether data of given attributes null or not 
 syntax:-
 select attributes list 
 from tables 
 where attributes is null /not null;
 */
 --example
 --display name of all students of marks is null
 select sname , marks 
 from students
 where marks is not  null;

 /*
 LIKE OPERATOR 
 it is used to check pattern 
 syntax:-
 select attributes list
 from table where attributes like 'pattern' 
 there are various types of operator used in like operator 
 just like
 A% -> display all data started with'a'
 %n-> display all data ends with n
 %an%-> display all data which contain an in between 
 ---- ->display all data of length of 4 
 r-m -> display all data started with r and third letter contain m  on it 

 */
 --example
 --display records of all students of name contain 'm' as substring and of dob  less than '2008-1-1'
 select*
 from students
 where sanme like '%a%' and  dob '2008-4-4';
   
   --display the records of all students of name length not equal to 4 
   select*
   from students
   where sanme not like ('----');



  /*
  2.ORDER BY CLAUSE 
  
  it is used to arrange data either ascending or decending order with respect to particular attributes 
  syntax:- 
  select attributes list 
  from table 
  where condition 
  order by attrubute asc/desc;
 */
 --example 
 --display records of all students in ascending order of their DOB
 select*
 from students
 order by dob asc;
 --display the  records of all students of marks less than 200 and arrange data in ascending order of 
 select * 
 from students 
 where marks >200
 order by marks desc;
   
   /* 
  3. distinct clause 
   used to remove duplication value during data from the table 
   syntax:- 
   select distinct (attributes)
   from tables
   where condition ;
   */
   --example 
   --display records of all students by display unique names
   select sid ,distinct(sname) , dob , marks
   from student;
     
	/* 4.TOP KEYWORD
	it is used to display the top most records of the given tables 
	stntax:-
	select top(n) attributes
	from table 
	where condition;
	*/
	--example
	--display top 3 records of students 
	select top(3)sname
	from students;
	
	/*
	5.AGGREGATE FUNCTION 
	it is used to take the multiple inputs and gives singlr output
	there are various types of aggregate functuion such as
	COUNT()
	SUM()
	AVG()
	MIN()
	MAX()
	syntax:- 
	select aggregate function (attributes),attributes
	from table
	group by attributes
	having condition to group
	where condition of table
	*/
	--example
--find total students
	select count(*) as 'total student '
	from students ;
	---find maximum and minimum marks
	select min(marks) as 'failure' , max(marks) as 'topper'
	from students;
	

	--find name and dob of those student who get maximum marks
	select sname, dob , marks
	from students 
	where marks in (select max(marks) from students);


	/*
	6.GROUP BY CLAUSE 
	IT is used to divide data of given table into multiple sub -group according to particular attributes 
	it is used after group by clause 
	syntax:- select-----
	         from------
			 group by ------
			 */
			 --example
			 --display no of students of dob sname 
			 select count(dob), dob 
			 from students  
			 group by dob  ;

			 /*
HAVING CLAUSE
 it is used to check condition on the group created by grouped by clause
 */
 --display student with total no of students greater than  1 in every dob level 
 select count(dob),dob 
 from students
 group by dob
 having count(dob)>1;