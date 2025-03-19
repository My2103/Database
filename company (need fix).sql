drop database company;

create database company;
use company;

create table Department
(
Dnumber varchar(5) primary key,
Dname varchar(100),
Mgr_Em varchar(10),
Mgr_start_date date
);
alter table Department add constraint FK_department_manager foreign key (Mgr_Em) references Employee(Enumber);
alter table Department rename column Mgr_Em to Mgr_En;

create table Employee
(
Enumber varchar(10) primary key,
Fname varchar(50),
Minit varchar(2),
Lname varchar(50),
Bdate date,
Address varchar(100),
Sex varchar(10),
Salary int,
Super_Enumber varchar(10),
Dno varchar(5),
foreign key (Dno) references Department(Dnumber)
);
alter table Employee add constraint FK_employee foreign key (Super_Enumber) references Employee(Enumber);

create table Dept_location
(
Dnumber varchar(5),
Dlocation varchar(100),
primary key (Dnumber, Dlocation),
foreign key (Dnumber) references Department(Dnumber)
);

create table Project
(
Pnumber varchar(5) primary key,
Pname varchar(50),
Plocation varchar(50),
Dnum varchar(5),
foreign key (Dnum) references Department(Dnumber)
);

create table Work_on
(
Enumber varchar(10),
Pnumber varchar(5),
Hours float,
primary key (Enumber, Pnumber),
foreign key (Enumber) references Employee(Enumber),
foreign key (Pnumber) references Project(Pnumber)
);

create table Dependent
(
Enumber varchar(10),
Dependent_name varchar(100),
Sex varchar(10),
Bdate date,
Relationship varchar(50),
primary key (Enumber, Dependent_name),
foreign key (Enumber) references Employee(Enumber)
);

insert into Department (Dnumber, Dname)
 values
 ('1', 'Headquaters'),
 ('4', 'Administration'),
 ('5', 'Research');
 
  insert into Employee (Enumber)
 values
 ('123456789'),
 ('333445555'),
 ('453453453'),
 ('666884444'),
 ('888665555'),
 ('987654321'),
 ('987987987'),
 ('999887777');
 
  insert into Employee (Super_Enumber)
 values
 ('333445555'),
 ('888665555'),
 ('333445555'),
 ('333445555'),
 (NULL),
 ('888665555'),
 ('987654321'),
 ('987654321');
 
 
 insert into Employee (Enumber, Fname, Minit, Lname, Bdate, Address, Sex, Salary, Super_Enumber, Dno)
values
 ('123456789','John', 'B', 'Smith', '1965-01-09', '731 Forden, Houston, TX', 'M', '30000', '333445555', '5'),
 ('333445555','Franklin', 'T', 'Wong', '1955-12-08', '638 Voss, Houston, TX', 'M', '40000', '888665555', '5'),
 ('453453453','Joyce', 'A', 'English', '1972-07-31', '5631 Rice, Houston, TX', 'F', '25000', '333445555', '5'),
 ('666884444','Ramesh', 'K', 'Narayan', '1962-09-15', '975 Fire Oak, Humble, TX', 'M', '38000', '333445555', '5'),
 ('888665555','James', 'E', 'Borg', '1937-11-10', '450 Stone, Houston, TX', 'M', '43000', NULL, '1'),
 ('987654321','Jennifer', 'S', 'Wallace', '1941-06-20', '291 Berry, Bellaire, TX', 'F', '43000', '888665555', '4'),
 ('987987987','Ahmad', 'V', 'Jabbar', '1969-03-29', '980 Dallas, Houston, TX', 'M', '25000', '987654321', '4'),
 ('999887777','Alicia', 'J', 'Zelaya', '1968-01-19', '3321 Castle, Spring, TX', 'F', '25000', '987654321', '4');

