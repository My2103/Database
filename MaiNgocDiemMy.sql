create database Store;
use Store;

create table Customer (
Customer_ID varchar(10) primary key,
Customer_Name varchar(50),
Address varchar(50),
Country varchar(20)
);

create table Staff (
Staff_ID varchar(10) primary key,
Staff_Name varchar(50),
Phone varchar(50)
);

create table Product (
ProductID varchar(10) primary key,
ProductName varchar(50),
Supplier_ID varchar(10),
Unit varchar(50),
Price float
);
alter table Product add constraint FK_product_supplier foreign key (Supplier_ID) references Supplier(Supplier_ID);

create table Supplier (
Supplier_ID varchar(10) primary key,
Supplier_Name varchar(50),
Address varchar(50),
Phone varchar(50)
);

create table `Order` (
`Order_ID` varchar(10) PRIMARY KEY,
`Customer_ID` varchar(10),
`Staff_ID` varchar(10),
`Order_date` date
);

drop table `Order`;

create table Orders (
Order_ID varchar(10) primary key,
Customer_ID varchar(10),
Staff_ID varchar(10),
Order_date date,
foreign key (Customer_ID) references Customer(Customer_ID),
foreign key (Staff_ID) references Staff(Staff_ID)
);

create table Order_Detail (
Order_ID varchar(10),
ProductID varchar(10),
Quantity int,
primary key (Order_ID, ProductID),
foreign key (Order_ID) references Orders(Order_ID),
foreign key (ProductID) references Product(ProductID)
);

insert into Customer (Customer_ID, Customer_Name, Address, Country)
values
('C1', 'Nguyen Anh Minh', '123 Le Loi', 'HCM'),
('C2', 'Tran Thanh Nga', '45 Hang Trong', 'Ha Noi');

insert into Product (ProductID, ProductName, Supplier_ID, Unit, Price)
values
('P1', 'Break', 'SL1', '10 boxes x 20 bags', '150000'),
('P2', 'Coca Cola', 'SL2', '24 - 12 oz bottles', '200000'),
('P3', 'Aquafina', 'SL2', '12 - 550 ml bottles', '70000');

insert into Supplier (Supplier_ID, Supplier_Name, Address, Phone)
values
('SL1', 'ABC Bakery', '12 Hau Giang Street', NULL),
('SL2', 'Green Food & Drink', '11 Nguyen Hue', NULL);

insert into Staff (Staff_ID, Staff_Name, Phone)
values
('ST1', 'Minh An', '0909123456'),
('ST2', 'Ngoc Ha', '0909668899');

insert into Orders (Order_ID, Customer_ID, Staff_ID, Order_date)
values
('1111', 'C1', 'ST1', '2023-04-12'),
('22222', 'C2', 'ST2', '2023-05-14');

update Orders 
set Order_ID = '11111'
where  Order_ID = '1111';

insert into Order_Detail (Order_ID, ProductID, Quantity)
values
('11111', 'P1', '2'),
('11111', 'P2', '3'),
('22222', 'P1', '5'),
('22222', 'P3', '10');

-- Display product_id, productName, sum of quantity
select Order_Detail.ProductID, Product.ProductID, ProductName, sum(Quantity)
from Order_Detail, Product
where Order_Detail.ProductID = Product.ProductID
group by Product.ProductID, ProductName;

-- Display information of products. Condition : price > 150000
select *
from Product
where Price > 150000;