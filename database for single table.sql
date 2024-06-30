


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

/*
  create table students (
  sid varchar(5) primary key ,
  sname varchar(20),
  dob date,
  marks int); */

    -- DML (insert , update , delete , select)
  --insert the data in the table 
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
        ('s6','sulav','2000-2-12','120'),
        ('s7','sulav','2000-2-12','120'),
        ('s8','sulav','2000-2-12','120'),
		('s9','sulav','2000-2-12','120'),
        ('s10','sulav','2000-2-12','120');


 -- select the data from the table
 --display all records from students
 --(* means all we also can use all the  attritutes name instant of *)
   select *           
  from students ;
  -- to select the data from table there are various types of clause present 
  1) where clause 
  -- where clause represent the certain condition we have to display under 

  --* display name and marks of all students
  select sname ,marks
  from students;
    
-- display name of all students of marks greater than 150
select sname, marks
from students
where marks > 150;
   --* display name of all students of marks not equal to 200 or of dob less than 2005-01-01
   select sname 
   from students
   where marks<>200 or dob<'2003-06-02';

   --MULTIPLE OR 
   select *
   from students
   where sname in ('aparajita','laxit','darsan');

   --BETWEEN AND NOT BETWEEN CLAUSE 
   select * 
   from students
   where marks between 100 and 180;

  -- not between
  select *
  from students
  where dob not between '2002-2-4' and '2006-3-7';

 -- DROPE STATEMENTS 

     -- remove attribute 'address'  from students table
alter table students 
drop column address ;

--REMOVE
--it is used to delete structure of the table
--syntax
drop table students;



  -- ALTER STATEMENTS

   --insert new attributes "address" from students table
   alter  table students
   add address varchar(20);

   --change size of sname from 20 t0 50 
alter table students
alter column sname varchar(50);

--change data type of marks from int to strings 
alter table students
alter column marks varchar(20);
--to rename the attributes 
--syntax
  -- exec  sp_rename 'students.first name' , 'sname' ;


