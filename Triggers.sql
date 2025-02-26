-- Mysql  Assignment 10

## Create a table named teachers with fields id, name, subject, experience and salary and insert 8 rows. 

use school;
create table teachers ( id int primary key auto_increment, teacher_Name varchar(25),
 subject varchar (25),experience varchar(10), salary float) ;

INSERT INTO teachers (teacher_name, subject, experience, salary) VALUES
('John Smith', 'Mathematics', 10 , 60000.00),
('Michael Brown', 'Chemistry', 12, 65000.00),
('Sarah Davis', 'Biology', 5, 50000.00),
('David Wilson', 'English', 7, 52000.00),
('Jessica Martinez', 'History', 9, 53000.00),
('James Anderson', 'Computer Science', 15, 70000.00),
('Laura Thomas', 'Economics', 6, 51000.00);

select * from teachers; 


## Create a before insert trigger named before_insert_teacher that will raise an error
 “salary cannot be negative” if the salary inserted to the table is less than zero.
 
 DELIMITER $$
 create trigger before_insert_teacher
 before insert on teachers
 for each row
 begin
 if new.salary <0 then 
 signal sqlstate '45000'
set message_text = 'Salary cannot be negative ' ;
end if ;
end $$
DELIMITER ;

INSERT INTO teachers (teacher_name, subject, experience, salary) VALUES
('Paul Joseph', 'chemistry', 14 , -350000.00);

## Create an after insert trigger named after_insert_teacher that inserts a row with teacher_id,action, timestamp
 to a table called teacher_log when a new entry gets inserted to the teacher table.

create table teacher_log ( log_id int auto_increment primary key , teacher_id int not null ,action_type varchar(20) , action_time timestamp);


 delimiter $$
 create trigger after_insert_teacher
 after insert on teachers
 for each row
 begin
 insert into teacher_log (teacher_id ,action_type, action_time)
 values (new.id, 'New Appoinment',now());
 end $$
 delimiter ;
 
 INSERT INTO teachers (teacher_name, subject, experience, salary) VALUES
('Febina Shyam', 'IT', 7 , 15200.00);

 select* from teachers;
 select * from teacher_log;
 
 ## Create a before delete trigger that will raise an error when you try to delete a row that has experience greater than 10 years.
 
delimiter $$
 create trigger before_delete_teacher
 before delete on teachers
 for each row
 begin
 if old.experience >10 then
 signal sqlstate '45000'
 set message_text= 'Cannot delete a teacher with more than 10 years of experience';
 end if;
 end $$
 delimiter ;
 
 delete from teachers where experience>10;
 
 ## Create an after delete trigger that will insert a row to teacher_log table when that row is deleted from teacher table.
 
 delimiter $$
 create trigger after_delete_teacher
 after delete on teachers
 for each row
 begin
insert into teacher_log  (teacher_id ,action_type, action_time) values (old.id,"resigned/terminated",now());
 end $$
 delimiter ;
 
 delete from teachers where id =9 ;
 
  select* from teachers;
 select * from teacher_log; 
 
 
                                                            ##FINISHED 