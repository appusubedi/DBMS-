--LAB nunber 2
--USE OF MULTIPLE TABLE
--database : college management system (CMS)
--table : depertment  (did(int auto increment, dname(varchar), dbno(int)
        --  student(sid(int auto increment),sname(varchar),address(varchar),dob(date),did(int)
		  --staff(staffid(int auto increment),staff_name(varchar),did(int)
		  --subject(sub_id(varchar ),sub_name (varchar), credithr(int),staffid(int)
		  --marks( obtain_marks ,subid , sid

-- to link the two different database  syntax:use database database name
-- tocreate database
create database CMS;
--create table 
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
