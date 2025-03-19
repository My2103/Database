drop database school;

create database school;
use school;
create table faculty
(
facultyID varchar(5) primary key,
facultyName varchar(50)
);

create table student
(
studentID varchar(5) primary key,
studentName varchar(50),
facultyID varchar(5) references faculty(faculty1)
);

alter table student add constraint FK_student_faculty foreign key(facultyID) references faculty(facultyID);
create table subject
(
subID varchar(5) primary key,
subName varchar(50),
facultyID varchar(5) references faculty(faculty1)
);

alter table subject add constraint FK_subject_faculty foreign key(facultyID) references faculty(facultyID);

create table result 
(
resultID varchar(5) primary key,
studentID varchar(5) references student(studentID),
subID varchar(5) references subject(subID),
grade varchar(5)
);

alter table result add constraint FK_result_student foreign key(studentID) references student(studentID);

alter table result add constraint FK_result_subject foreign key(subID) references subject(subID);

drop table result;
create table result 
(

studentID varchar(5),
subID varchar(5),
grade int,
primary key (studentID, subID)
);

alter table result add constraint FK_result_student foreign key(studentID) references student(studentID);

alter table result add constraint FK_result_subject foreign key(subID) references subject(subID);


INSERT INTO faculty (facultyID, facultyName)
VALUES
('IT', 'Information technology'),
('FL', 'Foreign languages'),
('FF', 'Finance');

insert into student( studentID, studentName, facultyID)
values
('S1', 'Hasen', 'IT'),
('S2', 'Svendson', 'IT'),
('S3', 'Pettersen', 'FL'),
('S4', 'Mary', 'FL');

insert into subject (subID, subName, facultyID)
values
('AC', 'Accounting', 'FF'),
('CP', 'C programming', 'IT'),
('DB', 'Database', 'IT'),
('EL', 'English', 'FL');


insert into result (studentID, subID, grade)
values
('S1', 'CP', '8'),
('S1', 'DB', '9'),
('S1', 'EL', '9'),
('S2', 'CP', '9'),
('S2', 'DB', '7'),
('S3', 'DB', '5'),
('S3', 'EL', '8');

select studentID, subID, grade
from result
where studentID = 'S1' and grade>8;

select studentID, subID, grade
from result
where studentID = 'S1' or grade>8;

select studentID, subID, grade
from result
where not grade>8;
-- Retrive all information on faculty
select * from faculty;
-- Retrive all information on student
select * from student;
-- Retrive studentID, studentName, and facultyID of students
select studentID, studentName, facultyID
from student;
-- Retrive studentID, Fname, Lname, and FacultyID of student(s), condition FacultyID = 'IT'
select studentID, studentName, facultyID
from student
where facultyID = 'IT';

-- Retrive studentID, Fname, Lname, and FacultyID of student(s), condition FacultyName = 'Information technology'
select studentName, student.facultyID, faculty.facultyID, facultyName
from student, faculty
where student.facultyID = faculty.facultyID and facultyName = 'Information technology';

-- Retrive the Fname, Lname, and FacultyName of the students whose FacultyID is 'IT' and 'FF'
select studentName, facultyName, faculty.facultyID, student.facultyID
from student, faculty
where student.facultyID = faculty.facultyID and (faculty.facultyID = 'IT' or faculty.facultyID = 'FF');


select studentName, facultyName, faculty.facultyID, student.facultyID
from student, faculty
where student.facultyID = faculty.facultyID and (faculty.facultyID = 'IT' or faculty.facultyID = 'FL');

/*Retrieve studentID (student, grade), studentName (student), subName (subject) grade of the student(s) (grade). 
Sorted in ascending grade*/

select student.studentID, result.studentID, studentName, subject.subID, result.subID, subName, grade
from student, subject, result
where (student.studentID = result.studentID) and (subject.subID =result.subID)
order by grade;

-- Retrieve studentID, Lname, subname, grade of the student(s). Sorted in ascending grade, sorted in descending LName
select student.studentID, result.studentID, studentName, subject.subID, result.subID, subName, grade
from student, subject, result
where (student.studentID = result.studentID) and (subject.subID =result.subID)
order by grade asc, studentName desc;

/*Retrieve studentID, Lname, subname, grade of the student(s), facultyID is ‘IT’ and grade >= 8*/
select student.studentID, result.studentID, studentName, subName, subject.subID, result.subID, grade, faculty.facultyID, student.facultyID
from student, subject, faculty, result
where (student.studentID = result.studentID) and (subject.subID = result.subID) and (faculty.facultyID = student.facultyID) and (faculty.facultyID = 'IT' and grade >= 8);

/*Retrieve studentID, Lname, subname, grade of the student(s), facultyID is ‘IT’ or ‘FF’, and grade >= 8*/
select student.studentID, result.studentID, studentName, subName, subject.subID, result.subID, grade, faculty.facultyID, student.facultyID
from student, subject, faculty, result
where (student.studentID = result.studentID) and (subject.subID = result.subID) and (faculty.facultyID = student.facultyID) and (faculty.facultyID = 'IT' or faculty.facultyID = 'FL') and (grade >= 8);

-- Retrieve studentID, Lanme, subName, grade of the student(s), grade >=6 and grade <=8
select student. studentID, result.studentID, studentName, subject.subID, result.subID, subName, grade
from student, subject, result
where (student. studentID = result.studentID) and (subject.subID = result.subID) and (grade >=6 and grade <=8);

-- Retieve studentID, studentName, condition studentName begin with 'M'
select studentID, studentName
from student
where studentName like 'M%';

-- Retrieve studentID, studentName, condition studentName has 'e'
select studentID, studentName
from student
where studentName like '%e%';

-- Retrieve all information of Sub (subject) which student don't join in
select subject.subID, subName
from subject
where subject.subID not in (select subID from result);

-- Display studentName, grade, if students dont't have grade, input NULL


select studentID, count(subID)
from result
group by studentID;

select studentID, AVG(grade)
from Result
group by studentID;

-- Display facultyID quantity of student (in faculty)
select facultyID, count(studentID)
from student
group by facultyID;


-- Display facultyID, facultyName, quantity of student **
select faculty.facultyID, student.facultyID, facultyName, count(studentID)
from faculty, student
where faculty.facultyID = student.facultyID
group by faculty.facultyID, facultyName;

-- Display subID, subName, count of students
select subject.subID, result.subID, subName, count(studentID)
from subject, result
where subject.subID = result.subID
group by subject.subID, subName;

-- Display subID, subName, avg of grade
select result.subID, subject.subID, subName, avg(grade)
from result, subject
where (result.subID = subject.subID) 
group by subject.subID, subName;

-- Display studentID, grade >=5
select studentID, grade
from result
where grade >=5;

-- Display studentID, avg(grade) >=5
select studentID, avg(grade)
from result
group by studentID
having avg(grade) >=5;

-- write a query to display information of students(StudentID, studentname) have count of sub >=2
select result.studentID, student.studentID, studentName, count(subID)
from student, result
where  result.studentID = student.studentID
group by student.studentID, studentName
having count(subID) >=2;
-- write a query to display information of subs have count of student >=2
select result.subID, subject.subID, subName, count(studentID)
from result, subject
where result.subID = subject.subID
group by subject.subID, subName
having count(studentID) >=2;
-- write a query to display studentID, subID, grade of students have max grade
select studentID, subID, grade
from result
where grade = (select max(grade) from result);
-- Write a query to display studentID, subID, grade of students have min grade
select studentID, subID, grade
from result
where grade = (select min(grade) from result);
-- Write a query to display studentID, avg(grade) of students. Condition : avg(grade) are the highest avg(grade)
select studentID, avg(grade)
from result
group by studentID
having avg(grade) = (select avg(grade) 
					 from result
                     group by studentID
                     order by avg(grade) desc
                     limit 1);
		
                     
alter table result modify column grade float;

-- Write a query to display studentID, avg(grade) of students. Condition : avg(grade) are the smallest avg(grade)
select studentID, avg(grade)
from result
group by studentID
having avg(grade) = (select avg(grade)
                     from result
                     group by studentID
                     order by avg(grade) 
                     limit 1);
                     
-- write a query to display studentID, grade. Condition : grades are greater than or equal all grade of student in faculty IT
select studentID, subID, grade
from result
where grade >= (select grade
                from result, student
                where result.studentID = student.studentID and facultyID = 'IT'
                order by grade desc
                limit 1);
                

select studentID, grade
from result
where grade >= all(select grade
                   from result, student
                   where (result.studentID = student.studentID) and (facultyID = 'IT'));
                   
-- Write a query to display studentID, grade. Condition : grades are greater than any grade student in faculty IT
select studentID, grade
from result
where grade >= any (select grade
                    from result, student
                    where result.studentID = student.studentID and facultyID = 'IT');


-- IN/NOT IN example
select studentID, studentName
from student
where studentID in ('S1', 'S3');

select studentID, studentName
from student
where studentID not in ('S1', 'S3');

select facultyID, facultyName
from faculty;

select distinct faculty.facultyID, facultyName
from faculty, student
where faculty.facultyID = student.facultyID;

select faculty.facultyID, facultyName
from faculty
where facultyID in (select facultyID from student);

select faculty.facultyID, facultyName
from faculty
where facultyID not in (select facultyID from student);


-- INNER JOIN example
select faculty.facultyID, facultyName
from faculty
inner join student on faculty.facultyID = student.facultyID;

select faculty.facultyID, facultyName, studentName, student.facultyID
from faculty
inner join student on faculty.facultyID = student.facultyID;

select faculty.facultyID, facultyName, studentName, student.facultyID
from faculty
left join student on faculty.facultyID = student.facultyID;

-- 14.Retrive all information of subject which student don't join in
select *
from subject
where subject.subID not in ( select subID from result);

-- 15.Retrieve all information of Student who don't join examination
select *
from student
where student.studentID not in (select studentID from result);

-- 16.Display studentName, subName, grade. If student don't have grade, input NULL
select studentName, subname, grade
from student
left join result on student.studentID = result.studentID
left join subject on subject.subID = result.subID;

select studentName, subname, grade
from student
left join result on student.studentID = result.studentID
right join subject on subject.subID = result.subID;
-- 17.Display studentName, grade (each student, grade is max)
select studentName, subName, max(grade)
from result, student, subject
where result.studentID = student.studentID and subject.subID = result.subID
group by studentName, subName;

select studentName, max(grade)
from result, student
where result.studentID = student.studentID 
group by studentName;

-- 18. Display studentName, subname, grade (grade is highest on the table)
select studentName, subName, max(grade)
from result, student, subject
where result.studentID = student.studentID and result.subID = subject.subID
and grade = (select max(grade) 
             from result)
group by studentName, subName;

select studentName, subName, max(grade)
from student
inner join result on student.studentID = result.studentID
inner join subject on subject.subID = result.subID
where grade = (select max(grade) 
             from result)
group by studentName, subName;

/*19.Input data  on RESULT table
<S1, AC,0>, <S2, EL, 0>, <S3, CP, 0>,
<S4, AC, 0>, <S4, CP, 0>, <S4, EL, 0>*/
insert into result (studentID, subID, grade)
values
('S1', 'AC', '0'),
('S2', 'EL', '0'),
('S3', 'CP', '0'),
('S4', 'AC', '0'),
('S4', 'CP', '0'),
('S4', 'EL', '0');

update result
set grade = 5
where studentID = 'S1' and subID = 'CP';

-- Update the grade of student = 5. condition S4
update result
set grade = 5
where studentID = 'S4';

set SQL_SAFE_UPDATES = 0;

-- delete all rows, condition grade >5
delete from result
where grade < 5;

set SQL_SAFE_UPDATES = 1;
