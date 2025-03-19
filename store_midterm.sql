create database store;
use store;
create table CUSTOMER
(
	CUS_ID VARCHAR(4) NOT NULL PRIMARY KEY,
	CUS_NAME VARCHAR(100),
	ADDRESS VARCHAR(100)
);


create table SUPPLIER
(
	SUP_ID VARCHAR(4) NOT NULL PRIMARY KEY,
	SUP_NAME VARCHAR(100),
	SUP_ADDRESS VARCHAR(100)
);

create table PRODUCT
(
	PRO_ID VARCHAR(4) NOT NULL PRIMARY KEY,
	PRO_NAME VARCHAR(100),
	COUNTRY VARCHAR(100),
	PRICE float, 
    SUP_ID VARCHAR(4),
    foreign key (SUP_ID) references SUPPLIER(SUP_ID)
    
);

create table ORDERS
(
	ORD_ID INT NOT NULL PRIMARY KEY,
	ORD_DATE DATE,
	CUS_ID VARCHAR(4) NOT NULL,
    foreign key (CUS_ID) references CUSTOMER(CUS_ID)
);

create table DETAIL	
(
	ORD_ID INT NOT NULL,
	PRO_ID VARCHAR(4)  NOT NULL,
	QUANTITY INT,
    PRIMARY KEY (ORD_ID,PRO_ID),
    foreign key (ORD_ID) references ORDERS(ORD_ID),
    foreign key (PRO_ID) references PRODUCT(PRO_ID)
);

INSERT INTO SUPPLIER(SUP_ID, SUP_NAME,SUP_ADDRESS) VALUES ('S1', 'ACB Company','123 Le Loi, HCM'),
('S2', 'DC Cake Company ','45 Tran Hung Dao, HCM'),
('S3', 'Coca company','67 Le Loi, Da Nang'),
('S4', 'Victory company','29 Phan Dinh Phung, Ha Noi');

INSERT INTO CUSTOMER(CUS_ID, CUS_NAME,ADDRESS) VALUES ('C1', 'Le Van Ngoc', '56 Hau Giang, TPHCM'),
('C2', 'Tong Khanh Lan','4 Luong Bach Dang, Ha Noi'),
('C3', 'Nguyen Minh Nam', '7 Binh Phu, TPHCM'),
('C4', 'Tran Minh Ha','67 Xo Viet Nghe Tinh, Vung Tau'),
('C5', 'Nguyen Yen Nhi','89 Ho Xuan Huong, Da Lat');

INSERT INTO ORDERS(ORD_ID,ORD_DATE,CUS_ID) VALUES('101','2023-11-1','C1'),
('102','2023-10-2','C2'),
('103','2023-9-3','C3'),
('104','2023-8-6','C1'),
('105','2023-7-5','C4'),
('106','2023-8-3','C5');


INSERT INTO PRODUCT(PRO_ID, PRO_NAME, COUNTRY, PRICE, SUP_ID) VALUES ('P1', 'Apple','Thai Lan',100,'S1'),
('P2','Banana','Viet Nam',30,'S1'),
('P3','Grape','US',150,'S1'),
('P4','Orange','Thai Lan',70,'S2'),
('P5','Mango','Viet Nam',180,'S2'),
('P6','Durian','Malaysia',180,'S3'),
('P7','Avocado','Viet Nam',30,'S4');



INSERT INTO DETAIL(ORD_ID,PRO_ID, QUANTITY) VALUES ('101','P1',100),
('101','P2',100),
('101','P3',100),
('102','P2',200),
('102','P3',50),
('102','P4',50),
('103','P1',30),
('103','P5',50),
('104','P3',80),
('104','P5',90),
('105','P2',20),
('105','P4',40),
('106','P2',50);
/*
1.	Display information includes: pro_id, pro_name, sup_name. Sorted in descending product_id.
2.	Display all information of customers in ‘HCM’
3.	Display all information of products in ‘Thai Lan’ or ‘Viet Nam’
4.	Display information includes: PRO_ID, PRO_NAME, PRICE>=50 and PRICE <= 100
5.	Display all information of products, condition: price of product is highest
6.	Display information includes: ORD_ID, CUS_NAME, every orders display sum of money (quantity x price)
7.	Display all information of products. Condition: Products were sold.
8.	Display information of orders: ORD_ID, CUS_NAME, the total quantity. Condition: The total quantity purchased is the highest.
9.	Display information of suppliers: SUP_ID, SUP_NAME, Count of Products. Condition: Count of Products > =2
10.	Display all information of products have price = price of ‘Banana’
*/

