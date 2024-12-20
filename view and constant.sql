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

	--create a view student detail that contain sid, sname and address of those student of adderess kathmandu
create view "student detail"
as
select s.sid ,s.sname,s.address
from student s inner join marks m on  s.sid = m.sid
where address like 'k%' ;

-->insert any 5-aditional records to student-details view
  insert into "student detail" 
   values('appu','dang'),
     ('gita','kathamndu'),
       ('hari','rolpa');
-->view ma insert garna mildaina view  only for data observation ko lagi use hunxa 
-->yadi hamily view table ma data insert garyu vany tw data sidhai original table ma gayara save hunxa 


-->constant in SQL
/*
1.not null
2.unique (not repeated data )
3.primary key(null pani huna vayana and unique data pani vayo vany balla primary key hunxa)
4.auto_increment (identity)
5.CHECK (invalid data huna hudaina)
6.oreign key(foreign key banauna  tw column aarko table ko primary key hunai parxa )
7.DEFAULT 
*/
 
 --lab4
 --use of constraints
  -->  constant is a rule that is used to control the insertion of invalid data to the database 
  /*
  create table tablename 
  (attributes1 datatype primary key,
  attributes2 datatype not null,
  attributes3 datatype unique,
  attributes4 datatype default value,
  CHECK (Attributes5) condition);

  */
  /*
  database library
  table:
  book (isbn,varchar(10).bname:varchar(20),price:int not null , nop:int unique ,sid 
  student(sid:int auto increment, sname :varchar, age:int check(age)>o, address :varchar default "baneshwor"
  Author(aid:int auto_increment ,aname:varchar(not null),phon :varchar(10),unique,address:varchar,isbn
  */

  -->to create a database
  create database library;
  -->to create a table
  
  create table student
	 ( sid int not null identity(1,1) primary key ,
	 sname varchar(20) ,
	 age int  check (age > 0 and age <120),
     address varchar(20) default 'baneshwor');
	 
  create table book
	 ( isbn varchar(10)  primary key ,
	 bname varchar(20) ,
     price int not null,
	 sid int,
	 foreign key(sid) references student (sid) );

	   create table author
	 ( aid int not null identity(1,1) primary key ,
     aname varchar(20) not null,
     phoneNo varchar(10),
	 address varchar(20) unique,
	 isbn varchar(10),
	 foreign key(isbn) references book (isbn) );

	 3. Insert any 5 data into table Books, Student and Author.
Query: insert into student(sname,age)
values('laxit',19),
('binap',18),
('pari',20),
('ishu',21),
('ruhi',20);
insert into book
values('1','ai',500,1),
      ('2','dbms',600,2),
      ('3','java',550,3),
     ('4','c++',650,4),
     ('5','toc',700,5);
insert into author
values('ram','950000','koteshwor','1'),
('sita','960000','baneshwor','5'),
('gita','970000','lalitpur','4'),
('shyam','980000','bhaktapur','3'),
('laxman','990000','koteshwor','2');
select *
from book ;



select * 
from book;
Query:INSERT into Student(s_name,age) VALUES ('Shree',-10);

Query: INSERT into Book VALUES ( '6','python',650,215,3);Query:INSERT into Book VALUES ( '6','python',NULL,230,240,2);Query: INSERT into Book VALUES (‘4’,'python',240,230,5);
 INSERT into Book VALUES ('4','python',240,230,5);
 
Test the ‘default’ constraints.
Query:
address VARCHAR(20) DEFAULT ‘Baneshwor’; (In table : Student)