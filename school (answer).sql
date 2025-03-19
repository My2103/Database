create database school;
use school;
create table Faculty
(
FacultyID varchar(5)primary key,
Facultyname varchar(30) 
);

create table Student
(
StudentID Varchar(10)primary key,
Lastname varchar(30) not null,
Firstname varchar(30)not null, 
FacultyID varchar(30)not null
);
alter table Student add constraint FK_student_faculty foreign key(FacultyID) references Faculty(FacultyID);

create table Sub
(
SubID varchar(10)primary key,
SubName varchar(30)not null,
FacultyID varchar(30)not null
);
alter table Sub add constraint FK_sub_faculty foreign key(FacultyID) references Faculty(FacultyID);
create table result 
(
StudentID varchar(10)not null,
SubID varchar(10)not null,
Grade float
);
alter table result add constraint PK_result primary key(StudentID,SubID);
alter table result add constraint FK_result_student foreign key(StudentID) references Student(StudentID);
alter table result add constraint FK_result_Sub foreign key(SubID) references Sub(SubID);

Insert into Faculty(FacultyID, FacultyName) values ('IT', 'Information technology'),
('FL', 'Foreign Languages'),
('FF', 'Finance');
Insert into Student(StudentID, Lastname, Firstname, FacultyID) values ('S1', 'Hansen', 'Ola', 'IT'),
('S2', 'Svendson', 'Tove', 'IT'),
('S3', 'Petterson', 'Kari', 'FL'),
('S4', 'Mary', 'Ola', 'FL');
Insert into Sub(SubID, SubName,FacultyID) values ('DB', 'Database','IT'),
('CP', 'C programming','IT'),
('EL', 'English','FL'),
('AC', 'Accounting','FF');
Insert into result(StudentID, SubID, Grade) values ('S1', 'DB', 9),
('S1', 'CP', 8),
('S1', 'EL', 9),
('S2', 'DB', 7),
('S2', 'CP', 9),
('S3', 'DB', 5),
('S3', 'EL', 8);


select *
from student
where facultyID='IT';


-- Retrieve all information on faculty
select *
from faculty;

-- Retrieve the Fname, the Lname and Facultyname of the student(s) whose FacultyID is ‘IT’ or ‘FL’.
select firstname, lastname, student.facultyID, faculty.facultyID,facultyname
from student, faculty
where student.facultyID = faculty.facultyID and (facultyID = 'IT' or facultyID = 'FL');

-- Retrieve studentID, Lname, firstname, grade of the student(s). Sorted in ascending grade, in desending studentID
select studentID, subID, grade
from result
order by grade desc, studentID asc;

select count(studentID) as 'number of student'
from student;


select studentID, avg(grade)
from result
group by studentID;




select studentID,subID, grade
from result
where grade = (select max(grade)
				from result)
                
                
-- Write a query to display studentID, subID, grade of students have min grade;

select studentID,subID, grade
from result
where grade = (
				select min(grade)
				from result)
                
                
-- Write a query to display studentID, avg(grade) of students. Condition: avg(grade) are the highest avg (grade);
select studentID, avg(grade)
from result
group by studentID 
having avg(grade) = (select avg(grade)
					from result
					group by studentID
					order by avg(grade) desc
					limit 1);
			


-- Write a query to display studentID, grade. Condition: grades are greater  than or equal all grade of student in faculty IT
select studentID, grade
from result
where grade >= (
			Select grade
			from result, student
			where result.studentID = student.studentID and facultyID = 'IT'
			order by grade desc
			limit 1);



select studentID, grade
from result
where grade >= all(
			Select grade
			from result, student
			where result.studentID = student.studentID and facultyID = 'IT')
            
            
            
            