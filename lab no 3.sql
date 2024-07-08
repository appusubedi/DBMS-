 --LAB no 3
/* View 
view is a logical table used to retrive data from one or more tabbles according tooo needs of users without 
altering data to the user without altering data to the original tables
syntax:
create view view_name
as
select attributes 
from list of tables
where condition;
*/
--date diff >20
--1 create a view 'studentview'that contain all students of age  less than 20 
--datedif(2005-

 create view studentview
 as
 select *
 from student 
 where datediff (year,dob,getdate()) < 20; 

 --2 display records of students 
--syntax: to drope the viewtable 
--drop view view.name

--3 create a view 'student table ' that display all student who takes 'dbms' subject.
 create view dbmssubject
 as
 select s.sid , s.sname ,su.subname
 from student s 
   inner join  marks m on  s.sid = m.sid
   inner join  subject su on su.subid = m.subid
    where su.subname like '%dbms';
