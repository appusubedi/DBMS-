--TRIGGER
   -- trigger is a special types of stored procedure that automatically ececute when some event occurs in a database 
  /* there are three types of  triggers ,they are :-
   1 DML :- this types of trigger is used insert update ,delete
   2 DDL:- this trigger is used to create ,alter and drop table structure
   3 instead of  trigger :- this trigger is used to replace default behaviour of dml statement


   syntax to create a trigger 
   create trigger trigger_name 
   on table-name 
   after/before/insead of / insert / delete /update 
   as
   begin
   -----trigger body------
   end
   */
   --to create a database named triger for lab 3 

   create database trigers

   --to create a table name employee 
     create table employee
	 (eid int primary key ,
	 ename varchar(20) ,
	 salary float ,
	 address varchar(10)
	 );
	  --to create a table name employee_log
	  create table employee_log
	 (eid int  ,
	 ename varchar(20) ,
	 old_salary float,
	 new_salary float ,
	 datetime datetime 
	 );
	 drop table employee_log 
	 --to create a table named total-salary
	  create table total_salary
	 (salary_sum float
	 );
 -- create a trigger to find total sum of salary and stored to total_salary table 
 --now we can use trigger function 
	   create trigger total_salary_update  
	   on  employee
	   after insert , update ,delete
	   as
	   begin
	    declare  @total float;
		select @total = sum(salary)
		   from employee;
		   update total_salary
		   set salary_sum = @total;
		   end



		  -- to display the total salary after inset 0 in total_salary table
		   select *
		   from employee

	select*
    from total_salary
		     -- to update a one of the employee's salary
		   update employee 
		   set salary = 10000;

		   --employee ma update / delete garda sum_table ma pani automatically update hunxa 
		   --one time trigger activate gary paxi all time ko lagi use hunxa,both table are interrelated with each other after activate trigger


		   --to create trigger employee_log_update on employee
		   create trigger employee_log_update
		   on employee
		   after update
		   as
		   begin
		   insert into employee_log (eid,ename,old_salary , new_salary , datetime )
		   select deleted.eid , deleted.ename , deleted.salary as old_salary , inserted.salary as new_salary , getdate() 
		   from inserted
		   join deleted
		   on inserted.eid = deleted.eid
		   end; 


		   update employee set salary=60000 where eid=3
           select* from employee_log 