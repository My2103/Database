drop database Companyplus;

create database Company_Plus;
use Company_Plus;

create table Department (
Dnumber varchar(5) primary key,
Dname varchar(100),
Mgr_En varchar(10),
Mgr_start_date date 
);
alter table Department add constraint foreign key (Mgr_En) references Employee(Enumber);
create table Employee (
Enumber varchar(10) primary key,
Fname varchar(50),
Lname varchar(50),
Bdate date,
Address varchar(100),
Sex varchar(10),
Salary int,
Super_Enumber varchar(10),
Dno varchar(5),
foreign key (Super_Enumber) references Employee(Enumber),
foreign key (Dno) references Department(Dnumber)
);

create table Dept_location (
Dnumber varchar(5),
Dlocation varchar(100),
primary key (Dnumber, Dlocation),
foreign key (Dnumber) references Department(Dnumber)
);

create table Project (
Pnumber varchar(5) primary key,
Pname varchar(50),
Plocation varchar(50),
Dnum varchar(5),
foreign key (Dnum) references Department(Dnumber)
);

create table Work_on (
Enumber varchar(10),
Pnumber varchar(5),
Hours float,
primary key (Enumber, Pnumber),
foreign key (Enumber) references Employee(Enumber),
foreign key (Pnumber) references Project(Pnumber)
);

create table Dependent (
Enumber varchar(10),
Dependent_Name varchar(100),
Sex varchar(10),
Bdate date,
Relationship varchar(100),
primary key (Enumber, Dependent_Name),
foreign key (Enumber) references Employee(Enumber)
);

insert into Department (Dnumber, Dname)
values
(1, 'Headquaters'),
(4, 'Administration'),
(5, 'Research');

update Department 
set Mgr_En = '888665555', Mgr_start_date = '1891-06-19'
where Dnumber = '1';

update Department 
set Mgr_En = '987654321', Mgr_start_date = '1995-01-01'
where Dnumber = '4';

update Department 
set Mgr_En = '333445555', Mgr_start_date = '1988-05-22'
where Dnumber = '5';

insert into Employee (Enumber,Fname, Lname, Bdate, Address, Sex, Salary, Dno)
values
('123456789','John', 'Smith', '1965-01-09', '731 Forden, Houston, TX', 'M', '30000', '5'),
('333445555','Franklin', 'Wong', '1955-12-08', '638 Voss, Houston, TX', 'M', '40000', '5'),
('453453453','Joyce', 'English', '1972-07-31', '5631 Rice, Houston, TX', 'F', '25000', '5'),
('666884444','Ramesh', 'Narayan', '1962-09-15', '975 Fire Oak, Humble, TX', 'M', '38000', '5'),
('888665555','James', 'Borg', '1937-11-10', '450 Stone, Houston, TX', 'M', '55000', '1');
 
insert into Employee (Enumber,Fname, Lname, Bdate, Address, Sex, Salary, Dno)
values
('987654321','Jennifer', 'Wallace', '1941-06-20', '291 Berry, Bellaire, TX', 'F', '43000', '4');

update Employee
set Super_Enumber = '333445555'
where Enumber = '123456789';

update Employee
set Super_Enumber = '333445555'
where Enumber = '453453453';

update Employee
set Super_Enumber = '333445555'
where Enumber = '666884444';

update Employee
set Super_Enumber = '333445555'
where Enumber = '666884444';

update Employee
set Super_Enumber = NULL
where Enumber = '888665555';

update Employee
set Super_Enumber = '888665555'
where Enumber = '333445555';


update Employee
set Super_Enumber = '888665555'
where Enumber = '987654321';

insert into Dependent (Enumber, Dependent_name, Sex, Bdate, Relationship)
 values
 ('123456789', 'Alice', 'F', '1988-12-30', 'Daughter'),
 ('123456789', 'Elizabeth', 'F', '1967-05-05', 'Spouse'),
 ('123456789', 'Michael', 'M', '1988-01-04', 'Son'),
 ('333445555', 'Alice', 'F', '1986-04-05', 'Daughter'),
 ('333445555', 'Joy', 'F', '1958-05-03', 'Spouse');

insert into project (Pnumber, Pname, Plocation, Dnum)
 values
 ('1', 'ProductX', 'Bellaire', '5'),
 ('10', 'computerization', 'Stafford', '4'),
 ('2', 'ProductY', 'Sugarland', '5'),
 ('20', 'Reorganization', 'Houston', '1'),
 ('3', 'ProductZ', 'Houston', '5'),
 ('30', 'Newbenefits', 'Stafford', '4');
 
 insert into Work_on (Enumber, Pnumber, Hours)
 values
 ('123456789', '1', '32.5'),
 ('123456789', '2', '7.5'),
 ('333445555', '10', '10'),
 ('333445555', '2', '10'),
 ('333445555', '20', '10'),
 ('333445555', '3', '10'),
 ('453453453', '1', '20'),
 ('453453453', '2', '20');
 
 update Work_on
 set Enumber = '987654321' 
 where Enumber = '333445555';
 
 update Work_on
 set Enumber = '333445555' 
 where Enumber = '987654321';
 
 update Work_on
 set Enumber = '987654321' 
 where Enumber = '333445555' and Pnumber = 10;
 
 -- Display Employee who belong to each department
 select Enumber, Fname, Dno, Dnumber, Dname
 from Employee, Department
 where Dno = Dnumber and Dno = '1';
 
 select Enumber, Fname, Dno, Dnumber, Dname
 from Employee, Department
 where Dno = Dnumber and Dno = '4';
 
 select Enumber, Fname, Dno, Dnumber, Dname
 from Employee, Department
 where Dno = Dnumber and Dno = '5';
 
 -- Select employee to display that where they belong to
select Enumber, Fname, Dno, Dnumber, Dname
from Employee, Department
 where Dno = Dnumber and Fname = 'John';
 
 select Enumber, Fname, Dno, Dnumber, Dname
from Employee, Department
 where Dno = Dnumber and Fname = 'James';

-- select all information from Department
select * from Department;

-- select all information from Employee
select * from Employee;

-- Retrive Enumber, Fname, Lname, Dno on Employee
select Enumber, Fname, Lname, Dno 
from Employee;

-- Retrive Enumber, Fname, Lname, Dno on Employee. Condition : Dno = '5'
select Enumber, Fname, Lname, Dno
from Employee
where Dno = '5';

-- Retrive Enumber, Fname, Lname, Dno on Employee. Condition : Dname = 'Research'
select Enumber, Fname, Lname, Dno, Dnumber, Dname
from Department, Employee
where Dno = Dnumber and Dname = 'Headquaters';

-- Retrive Enumber, Fname, Lname, Dno on Employee. Condition : Dname = 'Research' or Dname = 'Headquaters'
select Enumber, Fname, Lname, Dno, Dnumber, Dname
from Department, Employee
where (Dno = Dnumber) and (Dname = 'Research' or Dname = 'Headquaters');

-- Retrive Enumber, Fname, Pnumber, Pname, hours. Ascending Hours
select Work_on.Enumber, Employee.Enumber, Fname, Work_on.Pnumber, Project.Pnumber, Pname, Hours
from Employee, Project, Work_on
where (Work_on.Enumber = Employee.Enumber) and (Work_on.Pnumber = Project.Pnumber) 
order by Hours;

-- Retrive Enumber, Fname, Pnumber, Pname, hours. Ascending Hours, desc Employee name
select Work_on.Enumber, Employee.Enumber, Fname, Work_on.Pnumber, Project.Pnumber, Pname, Hours
from Employee, Project, Work_on
where (Work_on.Enumber = Employee.Enumber) and (Work_on.Pnumber = Project.Pnumber) 
order by Hours asc, Fname desc;

-- Retrive Enumber, Fname, Pname, Hours od employee. Where Dnumber = '5' and Hours <= 10
select Work_on.Enumber, Employee.Enumber, Fname, Work_on.Pnumber, Project.Pnumber, Pname, Hours, Dno, Dnumber
from Work_on, Project, Employee, Department
where (Work_on.Enumber = Employee.Enumber) and (Work_on.Pnumber = Project.Pnumber) and (Dno = Dnumber) and (Dnumber = '5') and (Hours <= 10);

-- Retrive Enumber, Fname, Pname, Hours od employee. Where Dnumber = '5' or Dnumber = '4' and Hours <= 10
select Work_on.Enumber, Employee.Enumber, Fname, Work_on.Pnumber, Project.Pnumber, Pname, Hours, Dno, Dnumber
from Work_on, Project, Employee, Department
where (Work_on.Enumber = Employee.Enumber) and (Work_on.Pnumber = Project.Pnumber) and (Dno = Dnumber) and (Dnumber = '5' or Dnumber = '4' ) and (Hours <= 10);

-- Retrive Enumber, Fname, Pname, Hours. Hour >=10 and <=20
select Work_on.Enumber, Employee.Enumber, Fname, Work_on.Pnumber, Project.Pnumber, Pname, Hours
from Work_on, Project, Employee
where (Work_on.Enumber = Employee.Enumber) and (Work_on.Pnumber = Project.Pnumber) and ( Hours >10 or Hours <20);

-- Retrieve Enumber, Fname. Fname begin with 'J'
select Enumber, Fname
from Employee 
where Fname like 'J%';

-- Retrieve Enumber, Fname. Fname have 'a'
select Enumber, Fname
from Employee 
where Fname like '%a%';

-- Retrive the Project which Employee not join in
select Project.Pnumber, Pname
from Project
where Project.Pnumber not in (select Pnumber from Work_on);




