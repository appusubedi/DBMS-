--STORED PROCEDURE
/*
syntax:-
create procedure procedure_name
as
begin
-----
---body
-----
end
*/
--for a stored procedure we can create a new database 
create database stored_procedure;
--create two table with tables name teacher and student 


create table teacher
	 ( tid int primary key ,
	 tname varchar(20) ,
	 salary int,
	 address varchar(10)
	 );
	  
	  --to create  the table name student 
	   create table student 
	  (
	  sid int primary key,
	  sname varchar(20),
	  marks int,
	  tid int,
	  foreign key(tid) references teacher(tid)
	  );

	  -- to create a stored procedure 

	  create procedure teacher_student
	  as
	  begin
	   select tname, address, sname, marks
	   from teacher t inner join student s
	   on t.tid = s.sid ;
	   end

	   -- to execute the stored procedure table 
	   exec teacher_student ;