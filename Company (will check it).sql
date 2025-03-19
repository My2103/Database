drop database company;

create database Company;
use Company;

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
 
 
 insert into Department (Dnumber, Dname, Mgr_En, Mgr_start_date)
 values
 ('1', 'Headquaters', '888665555', '1981-06-19'),
 ('4', 'Administration', '987654321', '1995-01-01'),
 ('5', 'Research', '333445555', '1988-05-22');
 
 insert into Employee (Fname, Minit, Lname, Bdate, Address, Sex, Salary, Super_Enumber, Dno)
 values
 ('John', 'B', 'Smith', '1965-01-09', '731 Forden, Houston, TX', 'M', '30000', '333445555', '5'),
 ('Franklin', 'T', 'Wong', '1955-12-08', '638 Voss, Houston, TX', 'M', '40000', '888665555', '5'),
 ('Joyce', 'A', 'English', '1972-07-31', '5631 Rice, Houston, TX', 'F', '25000', '333445555', '5'),
 ('Ramesh', 'K', 'Narayan', '1962-09-15', '975 Fire Oak, Humble, TX', 'M', '38000', '333445555', '5'),
 ('James', 'E', 'Borg', '1937-11-10', '450 Stone, Houston, TX', 'M', '55000', NULL, '1'),
 ('Jennifer', 'S', 'Wallace', '1941-06-20', '291 Berry, Bellaire, TX', 'F', '43000', '888665555', '4'),
 ('Ahmad', 'V', 'Jabbar', '1969-03-29', '980 Dallas, Houston, TX', 'M', '25000', '987654321', '4'),
 ('Alicia', 'J', 'Zelaya', '1968-01-19', '3321 Castle, Spring, TX', 'F', '25000', '987654321', '4');
 
 update Employee
 set Fname = 'John', Minit = 'B', Lname = 'Smith', Bdate = '1965-01-09', Address = '731 Forden, Houston, TX', Sex = 'M', Salary = '30000', Super_Enumber = '333445555', Dno = '5'
 where Enumber = '123456789';
 
 update Employee
 set Fname = 'Franklin', Minit = 'T', Lname = 'Wong', Bdate = '1955-12-08', Address = '638 Voss, Houston, TX', Sex = 'M', Salary = '40000', Super_Enumber = '888665555', Dno = '5'
 where Enumber = '333445555';
 
 update Employee
 set Fname = 'Joyce', Minit = 'A', Lname = 'English', Bdate = '1972-07-31', Address = '5631 Rice, Houston, TX', Sex = 'F', Salary = '25000', Super_Enumber = '333445555', Dno = '5'
 where Enumber = '453453453';
 
 update Employee
 set Fname = 'Ramesh', Minit = 'K', Lname = 'Narayan', Bdate = '1962-09-15', Address = '975 Fire Oak, Humble, TX', Sex = 'M', Salary = '38000', Super_Enumber = '333445555', Dno = '5'
 where Enumber = '666884444';
 
  update Employee
 set Fname = 'James', Minit = 'E', Lname = 'Borg', Bdate = '1937-11-10', Address = '450 Stone, Houston, TX', Sex = 'M', Salary = '55000', Super_Enumber = NULL, Dno = '1'
 where Enumber = '888665555';
 
  update Employee
 set Fname = 'Jennifer', Minit = 'S', Lname = 'Wallace', Bdate = '1941-06-20', Address = '291 Berry, Bellaire,TX', Sex = 'F', Salary = '43000', Super_Enumber = '888665555', Dno = '4'
 where Enumber = '987654321';
 
 update Employee
 set Fname = 'Ahmad', Minit = 'V', Lname = 'Jabbar', Bdate = '1969-03-29', Address = '980 Dallas, Houston, TX', Sex = 'M', Salary = '25000', Super_Enumber = '987654321', Dno = '4'
 where Enumber = '987987987';
 
 update Employee
 set Fname = 'Alicia', Minit = 'J', Lname = 'Zelaya', Bdate = '1968-01-19', Address = '3321 Castle, Spring, TX', Sex = 'F', Salary = '25000', Super_Enumber = '987654321', Dno = '4'
 where Enumber = '999887777';
 
 update Employee
 set Fname = 'James', Minit = 'E', Lname = 'Borg', Bdate = '1937-11-10', Address = '450 Stone, Houston, TX', Sex = 'M', Salary = '55000', Super_Enumber = NULL, Dno = '1'
 where Enumber = '888665555';
 
 
 insert into Dept_location (Dnumber, Dlocation)
 values
 ('1', 'Houston'),
 ('4', 'Stafford'),
 ('5', 'Bellaire'),
 ('5', 'Houston'),
 ('5', 'Sugarland');
 
 insert into Dependent (Enumber, Dependent_name, Sex, Bdate, Relationship)
 values
 ('123456789', 'Alice', 'F', '1988-12-30', 'Daughter'),
 ('123456789', 'Elizabeth', 'F', '1967-05-05', 'Spouse'),
 ('123456789', 'Michael', 'M', '1988-01-04', 'Son'),
 ('333445555', 'Alice', 'F', '1986-04-05', 'Daughter'),
 ('333445555', 'Joy', 'F', '1958-05-03', 'Spouse'),
 ('333445555', 'Theodore', 'M', '1983-10-25', 'Son'),
 ('987654321', 'Abner', 'M', '1942-02-28', 'Spouse');
 
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
 ('453453453', '2', '20'),
 ('666884444', '3', '40'),
 ('888665555', '20', NULL),
 ('987654321', '20', '15'),
 ('987654321', '30', '20'),
 ('987987987', '10', '35'),
 ('999887777', '30', '5'),
 ('999887777', '10', '10'),
 ('999887777', '30', '30');
 
-- 1.Display : Fname, Lname, salary of employees. Condition : salary > all salary of employees in department '5'
SELECT Fname, Lname, salary
FROM Employees
WHERE salary > ALL (SELECT salary FROM Employees WHERE dept_id = '5');

select Fname, Lname, Salary
from Employees
where Salary > all (select Salary from Employees where dept_id = '5');
-- 2.Display : Fname, Lname, salary of employees. Condition : salary > any salary of employees in department '5'
-- 3.Display : Department have avg(salary) that is highest

-- 1.Retrive the birthdate and address of the employees whose name is 'John B.Smith'
select Bdate, Address 
from Employee
where Fname = 'John';
-- 2.Retrive the name and address of all employees who work for the 'Research' department
select Fname, Address, Department.Dnumber, Dname
from Employee, Department
where Department.Dnumber = Employee.Dno and Department.Dnumber = '5';
/*3.For everyone project located in 'Stafford', list the project number, 
the controlling department number, and the department manager's last name, address, and birthdate*/
select Pnumber, Dnumber, Lname, Address, Bdate
from Project, Department, Employee 
WHERE Plocation = 'Stafford'
AND Project.Dnum = Department.Dnumber
AND Department.Mgr_En = Employee.Enumber;
-- 4.For each employee, retrive the employee's first and last name and the first and last name of his or her immediate supervisior
SELECT E1.Fname AS Employee_FirstName, E1.Lname AS Employee_LastName,
       E2.Fname AS Supervisor_FirstName, E2.Lname AS Supervisor_LastName
FROM Employee E1
JOIN Employee E2 ON E1.super_Enumber = E2.Enumber;
-- 5.Display : Fname, Lname, salary of employees. Condition : salary > all salary of employees in department 'Research'
SELECT E.Fname, E.Lname, E.salary
FROM Employee E
WHERE E.salary > ALL (
    SELECT E2.salary
    FROM Employee E2
    JOIN Department D ON E2.dno = D.Dnumber
    WHERE D.Dname = 'Research'
);
-- 6.Display : Fname, Lname, salary of employees. Condition : salary > any salary of employees in department 'Research'
SELECT E.Fname, E.Lname, E.salary
FROM Employee E
WHERE E.salary > any (
    SELECT E2.salary
    FROM Employee E2
    JOIN Department D ON E2.dno = D.Dnumber
    WHERE D.Dname = 'Research'
);

-- 7.Display : all information of departments have avg(salary) that is highest
SELECT D.*, AVG(E.salary) AS Avg_Salary
FROM Department D
JOIN Employee E ON D.Dnumber = E.dno
GROUP BY D.Dnumber
HAVING AVG(E.salary) = (
    SELECT MAX(Avg_Salary)
    FROM (
        SELECT AVG(E2.salary) AS Avg_Salary
        FROM Employee E2
        GROUP BY E2.dno
    ) AS SubQuery
);
/*8.Make list of all numbers for projects that involve an employee whose last name is 'Smith', 
either as a worker or as a manager of the department that conrols the project*/
SELECT DISTINCT P.Pnumber
FROM Project P
JOIN Department D ON P.Dnum = D.Dnumber
JOIN Employee E ON D.Mgr_En = E.Enumber OR P.Pnumber IN (
    SELECT WP.Pno
    FROM Work_On WP
    JOIN Employee E2 ON WP.Eno = E2.Enumber
    WHERE E2.Lname = 'Smith'
)
WHERE E.Lname = 'Smith';

select distinct Project.Pnumber
from Project
join Department on Project.Dnum = D.Dnumber
join Employee on Department.Mgr_En = Employee.Enumber or Project.Pnumber in (
             select 

