--LAB nunber 2
--USE OF MULTIPLE TABLE
--database : college management system (CMS)
--table : depertment  (did(int auto increment, dname(varchar), dbno(int)
        --  student(sid(int auto increment),sname(varchar),address(varchar),dob(date),did(int)
		  --staff(staffid(int auto increment),staff_name(varchar),did(int)
		  --subject(sub_id(varchar ),sub_name (varchar), credithr(int),staffid(int)
		  --marks( obtain_marks ,subid , sid

-- to link the two different database  syntax:use database database name
-- 1 tocreate database
create database CMS;
--2 create table 
create table department
	 ( did int not null identity(1,1) primary key ,
	 dname varchar(20) ,
	 dbno int 
	 );
 create table student
	  (
	  sid int not null identity(20,1) primary key,
	  sname varchar(20),
	  address varchar(20),
	  DOB date,
	  did int,
	  foreign key(did) references department (did)
	  );

	  		  --staff(staffid(int auto increment),staff_name(varchar),did(int)

	  create table staff
	  (
	  staffid int not null identity(20,1) primary key,
	  staffname varchar(20),
	  did int,
	  foreign key(did) references department (did)
	  );


	  		  --subject(sub_id(varchar ),sub_name (varchar), credithr(int),staffid(int)
 create table subject
	  (
	  subid int not null identity(40,1) primary key,
	  subname varchar(20),
	 credithr int,
	  staffid int,
	  foreign key(staffid) references staff (staffid)
	  );
	  		  --marks( obtain_marks ,subid , sid

create table marks
( obtmarks int,
    sid int,
   subid int ,
   	  foreign key(subid) references subject (subid),
	  	  foreign key(sid) references student (sid)
);
--3 insert the data on the tables 

--4 display records of those students who get maximum marks


--5 find name and marks of all students who get minimum mark in every address level


-- 6 display list of subject learn by students of dob less than 2070-10-10


--7 display name of all students department csit or of address start with k 


--8 increase mark of all student of address ktm by 20% 

select sname, obtmarks ,address
from student s inner join marks m on s.sid = m.sid 
where  s.address = 'dang' ;
--lab ma garda first ma mathi ko query run garny and  ss put garny and tala ko query run garny and tw up and down both ss lai lab ma insert garny
update marks 
set obtmarks = obtmarks +obtmarks *0.2
where sid in(select sid
from student
where address = 'dang') ;

--9 display records of all students in decending order of their dob
select *
from student 
order by (dob) desc;


--10 display total no.of students and their address total no of student and their address in every address level 
select count(sid) as nos , address
from student
group by (address);


--11 display all departments with 'no' student
select *
from department d
left join student s on s.did=d.did
where s.sid is null;

--12 display records of all students of address start with 'd' and get marks greater  than 
select *
from student s inner join marks m on  s.sid = m.sid
where address like 'k%' and obtmarks < (select avg(obtmarks)from marks);
  

  --13 dispaly 5 oldest student of address start with 'd'
  select top(5)* 
  from student 
  where  address like 'd%' order by dob asc;

  --14 increase the creadithr of all subject of name contains letter 'm' and study by students of address kathmandu 
  
  
  select s.sid ,s.sname ,su.subname, su.credithr, s.address
  from student s 
  inner join  marks m on  s.sid = m.sid
  inner join  subject su on su.subid = m.subid
  where s.sname like '%a%' and s.address='dang';

  --firstly  run first and then second  just like we do in previous code  
  update subject
  set credithr = credithr + 2 
  from student s 
  inner join  marks m on  s.sid = m.sid
  inner join  subject su on su.subid = m.subid
  where s.sname like '%a%' and s.address='dang';

   --15 display records of all staff who not helps to any students 
 


 --16 find out current age from dob of all students (datediff(year,dob,getdate())as age)
  select *
 from student 
 where datediff (year,dob,getdate()) >20; 


 --17 display only those students whose  dob contain 2005 year 


 --18 display year month and day of all students and their names


 --19 Display all students who associated with 'csit' department



--20 find join of all af above  5-tables 


