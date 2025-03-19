create database Library;
use Library;

create table Category
(
CategoryID int primary key,
CategoryName varchar(50)
);

create table Book
(
BookID varchar(10) primary key,
BookTitle varchar(50),
CategoryID int,
foreign key (CategoryID) references Category(CategoryID)
);

create table Copy_book
(
Copy_bookID varchar(12) primary key,
BookID varchar(10),
foreign key (BookID) references Book(BookID)
);
 
create table Author
(
AuthorID varchar(10) primary key,
Name varchar(50)
);

create table Book_Author
(
BookID varchar(10),
AuthorID varchar(10),
Publishcation_year date,
primary key (BookID, AuthorID),
foreign key (BookID) references Book(BookID),
foreign key (AuthorID) references Author(AuthorID)
);
alter table Book_Author modify Publishcation_year int;
create table Patron_account
(
Patron_accountID varchar(12) primary key,
Name varchar(50),
Email varchar(50)
);

create table Borrowed
(
Copy_bookID varchar(12),
Patron_accountID varchar(12),
Start_time date,
End_time date,
primary key (Copy_bookID, Patron_accountID),
foreign key (Copy_bookID) references Copy_book(Copy_bookID),
foreign key (Patron_accountID) references Patron_account(Patron_accountID)
);

create table Returned
(
Copy_bookID varchar(12),
Patron_accountID varchar(12),
Borrowed_time date,
Returned_time date,
primary key (Copy_bookID, Patron_accountID),
foreign key (Copy_bookID) references Copy_book(Copy_bookID),
foreign key (Patron_accountID) references Patron_account(Patron_accountID)
);

create table Wait_list
(
Patron_accountID varchar(12),
Copy_bookID varchar(12),
primary key (Patron_accountID, Copy_bookID),
foreign key (Patron_accountID) references Patron_account(Patron_accountID),
foreign key (Copy_bookID) references Copy_book(Copy_bookID)
);

create table Notification
(
NotificationID varchar(10) primary key,
NotificationType varchar(50),
Patron_accountID varchar(12),
foreign key (Patron_accountID) references Patron_account(Patron_accountID)
);
alter table Notification add column Notification_Date date;

insert into Category (CategoryID, CategoryName)
values
('1', 'Novel'),
('2', 'Detective'),
('3', 'Romance'),
('4', 'Children Literature'),
('5', 'Historical Fiction'),
('6', 'Graphic Novel'),
('7', 'Drama'),
('8', 'Adventure'),
('9', 'Health and Fitness'),
('10', 'Business and Finance');

insert into Book (BookID, BookTitle, CategoryID)
values
('A1865', 'Alice in wonderland', '4'),
('A1908', 'Anne of green gables', '1'),
('T1960', 'To kill a mocking bird', '1'),
('F2012', 'Fault in our stars', '3'),
('M1934', 'Murder on the Orient Express', '2'),
('G2019', 'Glute Lab', '9'),
('H1902', 'The Hound of the Baskervilles', '2'),
('P1813', 'Pride and Prejudice', '3'),
('P2008', 'Paper town', '1'),
('L1943', 'The little prince', '4'),
('R1597', 'Romeo and Juliet', '7'),
('B2017', 'The best we could do', '6'),
('K1885', 'King Solomon Mines', '8'),
('T1844', 'The Three Musketeers', '8'),
('A1987', 'The Alchemy of Finance', '10'),
('C1845', 'The Count of Monte Cristo', '8'),
('H1601', 'Hamlet', '7'),
('N2015', 'The Nightingale', '5'),
('F2017', 'The Fitness Mindset', '9'),
('W2018', 'Where the Crawdads Sing', '5');

insert into Copy_book (Copy_bookID, BookID)
values
('Alice1', 'A1865'),
('Alice2', 'A1865'),
('Anne1', 'A1908'),
('Anne2', 'A1908'),
('Bird1', 'T1960'),
('Bird2', 'T1960'),
('Fault1', 'F2012'),
('Fault2', 'F2012'),
('Murder1', 'M1934'),
('Murder2', 'M1934'),
('Glute1', 'G2019'),
('Glute2', 'G2019'),
('Hound1', 'H1902'),
('Hound2', 'H1902'),
('Pride1', 'P1813'),
('Pride2' ,'P1813'),
('Paper1', 'P2008'),
('Paper2', 'P2008'),
('Prince1', 'L1943'),
('Prince2', 'L1943'),
('Romeo1', 'R1597'),
('Romeo2', 'R1597'),
('Best1', 'B2017'),
('Best2', 'B2017'),
('King1', 'K1885'),
('King2', 'K1885'),
('Three1', 'T1844'),
('Three2', 'T1844'),
('Finance1', 'A1987'),
('Finance2', 'A1987'),
('Cristo1', 'C1845'),
('Cristo2', 'C1845'),
('Hamlet1', 'H1601'),
('Hamlet2', 'H1601'),
('Night1', 'N2015'),
('Night2', 'N2015'),
('Fitness1', 'F2017'),
('Fitness2', 'F2017'),
('Sing1', 'W2018'),
('Sing2', 'W2018');

insert into Author (AuthorID, Name)
values
('A1', 'A. C. Michael'),
('C2', 'Agatha Christie'),
('D3', 'Alexandre Dumas'),
('S4', 'Antoine de Saint-Exupéry'),
('C5', 'Bret Contreras'),
('K6', 'Brian Keane'),
('O7', 'Delia Owens'),
('S8', 'George Soros'),
('C9', 'Glen Cordoza'),
('H10', 'H. Rider Haggard'),
('L11', 'Harper Lee'),
('A12', 'Jane Austen'),
('G13', 'John Green'),
('H14', 'Kristin Hannah'),
('C15', 'Lewis Carrol'),
('M16', 'Lucy Maud Montgomery'),
('D17', 'Sir Arthur Conan Doyle'),
('B18', 'Thi Bui'),
('S19' ,'William Shakespeare');

insert into Book_Author (BookID, AuthorID, Publishcation_year)
values
('A1865', 'C15', '1865'),
('A1908', 'M16', '1908'),
('T1960', 'L11', '1960'),
('F2012', 'G13', '2012'),
('M1934', 'C2', '1934'),
('G2019', 'C5', '2019'),
('G2019', 'C9', '2019'),
('H1902', 'D17', '1902'),
('P1813', 'A12', '1813'),
('P2008', 'G13', '2008'),
('L1943', 'S4', '1943'),
('R1597', 'S19', '1597'),
('B2017', 'B18', '2017'),
('K1885', 'A1',	'1885'),
('T1844', 'D3', '1844'),
('A1987', 'S8', '1987'),
('C1845', 'D3', '1845'),
('H1601', 'S19', '1601'),
('N2015', 'H14', '2015'),
('F2017', 'K6', '2017'),
('W2018', 'O7', '2018');

insert into Book_Author (BookID, AuthorID, Publishcation_year)
values
('K1885', 'H10', '1885');

insert into Patron_account (Patron_accountID, Name, Email)
values
('M452003', 'Mathew', 'Mathew2003@gmail.com'),
('S2062004', 'Sally', 'Salliespri206@gmail.com'),
('M20121997', 'Mike', 'Mike1997@gmail.com'),
('B12111988', 'Bryan',	'Bryan1211@gmail.com'),
('A1511979', 'Anna', 'Annshirley1979@gmail.com'),
('R2532000', 'Rachel', 'Lynche2000@gmail.com'),
('P1191992', 'Ping', 'Pingvu9992@gmail.com'),
('K1721995', 'Kathleen', 'Kat1725@gmail.com'),
('V2781999', 'Vita', 'Vivi1999@gmail.com'),
('J512001', 'Johny', 'Johny51@gmail.com');


insert into Borrowed (Copy_bookID, Patron_accountID, Start_time, End_time)
values
('Murder1', 'M452003', '2023-06-28', '2023-07-05'),
('Murder1',	'K1721995', '2023-07-20', '2023-07-27'),
('Fitness2', 'K1721995', '2023-08-11', '2023-08-18'),
('King2', 'J512001', '2023-08-22', '2023-08-29'),
('Murder1', 'J512001', '2023-08-22', '2023-08-29'),
('Cristo2',	'K1721995',	'2023-09-13', '2023-09-20'),
('King1', 'V2781999', '2023-10-14', '2023-10-21'),
('Night2', 'B12111988', '2023-10-16', '2023-10-23'),
('Sing2', 'S2062004', '2023-11-12',	'2023-11-19'),
('Alice1', 'M452003', '2023-11-15',	'2023-11-22');

insert into Borrowed (Copy_bookID, Patron_accountID, Start_time, End_time)
values
('Sing2', 'P1191992', '2023-11-19',	'2023-11-26'),
('Bird1', 'M452003', '2023-11-20', '2023-11-27');

update Borrowed 
set Start_time = '2023-09-28', End_time = '2023-10-05'
where Copy_bookID = 'Murder1' and Patron_accountID = 'M452003';

update Borrowed 
set Start_time = '2023-09-29', End_time = '2023-10-06'
where Copy_bookID = 'Murder1' and Patron_accountID = 'K1721995';

update Borrowed 
set Start_time = '2023-10-11', End_time = '2023-10-18'
where Copy_bookID = 'Fitness2' and Patron_accountID = 'K1721995';

update Borrowed 
set Start_time = '2023-10-20', End_time = '2023-10-27'
where Copy_bookID = 'King2' and Patron_accountID = 'J512001';

update Borrowed 
set Start_time = '2023-10-22', End_time = '2023-10-29'
where Copy_bookID = 'Murder1' and Patron_accountID = 'J512001';

update Borrowed 
set Start_time = '2023-10-30', End_time = '2023-11-06'
where Copy_bookID = 'Cristo2' and Patron_accountID = 'K1721995';

update Borrowed 
set Start_time = '2023-11-9', End_time = '2023-11-16'
where Copy_bookID = 'King1' and Patron_accountID = 'V2781999';

update Borrowed 
set Start_time = '2023-11-14', End_time = '2023-11-21'
where Copy_bookID = 'Night2' and Patron_accountID = 'B12111988';

update Borrowed 
set Start_time = '2023-11-16', End_time = '2023-11-23'
where Copy_bookID = 'Sing2' and Patron_accountID = 'S2062004';

update Borrowed 
set Copy_bookID = 'Sing1'
where Copy_bookID = 'Sing2' and Patron_accountID = 'S2062004';

update Borrowed 
set Start_time = '2023-11-20', End_time = '2023-11-27'
where Copy_bookID = 'Alice1' and Patron_accountID = 'M452003';

insert into Returned (Copy_bookID, Patron_accountID, Borrowed_time, Returned_time)
 values
('Murder1', 'M452003', '2023-06-28', '2023-07-05'),
('Murder1', 'K1721995', '2023-07-20', '2023-07-25'), 
('Fitness2', 'K1721995', '2023-08-11', '2023-08-19'), 
('King2', 'J512001' , '2023-08-22', '2023-08-29'), 
('Murder1', 'J512001', '2023-08-22', '2023-08-27'), 
('Cristo2', 'K1721995', '2023-09-13', '2023-09-19'),
('King1', 'V2781999', '2023-10-14', '2023-10-23'),
('Night2', 'B12111988', '2023-10-16', '2023-10-23'), 
('Sing2', 'S2062004', '2023-11-12',	'2023-11-14'), 
('Alice1',	'M452003', '2023-11-15', NULL);

update Returned 
set Copy_bookID = 'Sing1'
where Copy_bookID = 'Sing2' and Patron_accountID = 'S2062004';

update Returned 
set Borrowed_time = '2023-09-28', Returned_time = '2023-10-05'
where Copy_bookID = 'Murder1' and Patron_accountID = 'M452003';

update Returned 
set Borrowed_time = '2023-09-29', Returned_time = '2023-10-08'
where Copy_bookID = 'Murder1' and Patron_accountID = 'K1721995';

update Returned 
set Borrowed_time = '2023-10-11', Returned_time = '2023-10-19'
where Copy_bookID = 'Fitness2' and Patron_accountID = 'K1721995';

update Returned 
set Borrowed_time = '2023-10-20', Returned_time = '2023-10-29'
where Copy_bookID = 'King2' and Patron_accountID = 'J512001';

update Returned 
set Borrowed_time = '2023-10-22', Returned_time = '2023-10-29'
where Copy_bookID = 'Murder1' and Patron_accountID = 'J512001';

update Returned 
set Borrowed_time = '2023-10-30', Returned_time = '2023-11-04'
where Copy_bookID = 'Cristo2' and Patron_accountID = 'K1721995';

update Returned 
set Borrowed_time = '2023-11-9', Returned_time = '2023-11-12'
where Copy_bookID = 'King1' and Patron_accountID = 'V2781999';

update Returned 
set Borrowed_time = '2023-11-14', Returned_time = '2023-11-21'
where Copy_bookID = 'Night2' and Patron_accountID = 'B12111988';

update Returned 
set Borrowed_time = '2023-11-16', Returned_time = '2023-11-22'
where Copy_bookID = 'Sing1' and Patron_accountID = 'S2062004';

update Returned 
set Borrowed_time = '2023-11-20', Returned_time = NULL 
where Copy_bookID = 'Alice1' and Patron_accountID = 'M452003';

insert into Returned (Copy_bookID, Patron_accountID, Borrowed_time, Returned_time)
 values
 ('Sing2', 'P1191992', '2023-11-19', NULL),
 ('Bird1',	'M452003', '2023-11-20', NULL);

insert into Wait_list (Patron_accountID, Copy_bookID)
values
('R2532000', 'Cristo2'),
('P1191992', 'Bird1'),
('P1191992', 'Sing2');

update Wait_list 
set Patron_accountID = 'M20121997', Copy_bookID = 'Sing1'
where Patron_accountID = 'R2532000' and Copy_bookID = 'Cristo2';

update Wait_list 
set Patron_accountID = 'R2532000', Copy_bookID = 'Alice1'
where Patron_accountID = 'P1191992' and Copy_bookID = 'Bird1';

update Wait_list 
set Patron_accountID = 'P1191992', Copy_bookID = 'Bird1'
where Patron_accountID = 'P1191992' and Copy_bookID = 'Sing2';
 
insert into Wait_list (Patron_accountID, Copy_bookID)
values
('P1191992', 'Sing2');

insert into Notification (NotificationID, NotificationType, Patron_accountID, Notification_Date)
values
('L118', 'Return book late', 'K1721995', '2023-08-19'),
('AS2',	'Book available', 'R2532000', '2023-11-14'),
('L1410', 'Return book late', 'V2781999', '2023-10-22');

update Notification 
set Notification_Date = '2023-10-07'
where NotificationID = 'L118';

update Notification 
set Notification_Date = '2023-10-28', Patron_accountID = 'J512001'
where NotificationID = 'L1410';

update Notification 
set Notification_Date = '2023-11-22'
where NotificationID = 'AS2';

insert into Notification (NotificationID, NotificationType, Patron_accountID, Notification_Date)
values
('L1019', 'Return book late', 'K1721995', '2023-10-19');


-- 1.What are history of borrowing books in chronological order ?
select * from Borrowed 
order by Start_time;

-- 2.What are history of returning books in chronological order ?
select * from Returned 
order by Borrowed_time;

-- 3.What are history of notification in chronological order ?
select * from Notification
order by Notification_date;

-- 4.What are the books in specific category ?
select BookID, BookTitle, Category.CategoryID, CategoryName
from Book, Category
where (Book.CategoryID = Category.CategoryID) and Category.CategoryID 
in ('1', '2', '3', '4', '5', '6', '7', '8', '9','10');


-- 5.What are the books written by a specific author ?
select Book_Author.AuthorID, Author.Name, Book_Author.BookID, BookTitle
from Book_Author, Author, Book
where (Book_Author.AuthorID = Author.AuthorID) and (Book_Author.BookID = Book.BookID) and Author.AuthorID 
in ('A1', 'C2', 'D3', 'S4', 'C5', 'K6', 'O7', 'S8', 'C9', 'H10', 'L11', 'A12', 'G13', 'H14', 
'C15', 'M16', 'D17', 'B18', 'S19') ;

-- 6.What are books borrowed by a patron ?
select Borrowed.Copy_bookID, Book.BookID, BookTitle, Borrowed.Patron_accountID, Name, Email
from Borrowed, Patron_account, Copy_book, Book
where (Borrowed.Patron_accountID = Patron_account.Patron_accountID) and (Borrowed.Copy_bookID = Copy_book.Copy_bookID) 
and (Book.BookID = Copy_book.BookID) and Patron_account.Patron_accountID in ('M452003', 'S2062004', 'M20121997', 
'B12111988', 'A1511979', 'R2532000', 'P1191992', 'K1721995', 'V2781999', 'J512001');

-- 7.What are books available in the library ?
select Copy_bookID, Book.BookID, BookTitle
from Copy_book, Book
where (Copy_book.BookID = Book.BookID) and (Copy_book.Copy_bookID not in 
(select Copy_bookID from Returned where Returned_time is NULL));

-- 8.What are books has never been borrowed?
select Copy_bookID, Book.BookID, BookTitle
from Copy_book, Book
where (Copy_book.BookID = Book.BookID) and Copy_bookID not in (
  select distinct Copy_bookID
  from Borrowed
);

-- 9.What are the books that are currently borrowed ?
select Copy_book.Copy_bookID, Book.BookID, BookTitle
from Copy_book, Book
where (Copy_book.BookID = Book.BookID) and (Copy_book.Copy_bookID in 
(select Copy_bookID from Returned where Returned_time is NULL));

-- 10.What are books being waited ?
select Wait_list.Copy_bookID, Book.BookID, BookTitle, Wait_list.Patron_accountID, Patron_account.Name, Email
from Copy_book, Wait_list, Book, Patron_account
where (Copy_book.Copy_bookID = Wait_list.Copy_bookID) and (Copy_book.BookID = Book.BookID) and 
(Wait_list.Patron_accountID = Patron_account.Patron_accountID);

-- 11.What users are waiting book ?
select Wait_list.Patron_accountID, Patron_account.Name, Email, Wait_list.Copy_bookID, Book.BookID, BookTitle
from Copy_book, Wait_list, Book, Patron_account
where (Copy_book.Copy_bookID = Wait_list.Copy_bookID) and (Copy_book.BookID = Book.BookID) 
and (Wait_list.Patron_accountID = Patron_account.Patron_accountID);

-- 12.What are the books borrowed in specific months ?
select Borrowed.Copy_bookID, Book.BookID, BookTitle, Borrowed.Patron_accountID, Patron_account.Name, Email,
Start_time, End_time
from Copy_book, Book, Borrowed, Patron_account
where (Copy_book.Copy_bookID = Borrowed.Copy_bookID) and (Copy_book.BookID = Book.BookID) 
                                                     and (Patron_account.Patron_accountID = Borrowed.Patron_accountID) 
                                                     and month(Start_time) in ('9', '10', '11')
order by (Start_time);

-- 13.What are the users who have borrowed the most number of books?
select Borrowed.Patron_accountID, Name, COUNT(Copy_bookID) AS book_count
from Borrowed, Patron_account
where Borrowed.Patron_accountID = Patron_account.Patron_accountID 
group by Patron_accountID
having book_count = (
  select COUNT(Copy_bookID) as book_count_max
  from Borrowed
  group by Patron_accountID
  order by book_count_max DESC
  limit 1
);

-- 14.What are the users who have borrowed the least number of books?
select Borrowed.Patron_accountID, Name, COUNT(Copy_bookID) AS book_count
from Borrowed, Patron_account
where Borrowed.Patron_accountID = Patron_account.Patron_accountID 
group by Patron_accountID
having book_count = (
  select COUNT(Copy_bookID) as book_count_min
  from Borrowed
  group by Patron_accountID
  order by book_count_min ASC
  limit 1
);

-- 15.What are the users who have not borrowed any books ?
select Patron_accountID, Name, Email
from Patron_account
where Patron_accountID not in (
  select distinct Patron_accountID
  from Borrowed
);

-- 16.What are the user who have recently borrowed books ?
select Patron_accountID, Name, Email
from Patron_account
where Patron_accountID in (select distinct Patron_accountID from Returned where Returned_time is NULL);

-- 17.What is due date of a returned book ?
select Borrowed.Copy_bookID, Book.BookID, BookTitle, End_time
from Copy_book, Borrowed, Book
where (Copy_book.Copy_bookID = Borrowed.Copy_bookID) and (Book.BookID = Copy_book.BookID) and (Copy_book.Copy_bookID 
in (select Copy_bookID from Borrowed));
 
 -- 18.What is a book that is overdue for return ?
select Borrowed.Patron_accountID, Patron_account.Name, Patron_account.Email, Borrowed.Copy_bookID, Book.BookTitle
from Borrowed
inner join Patron_account
on Borrowed.Patron_accountID = Patron_account.Patron_accountID
inner join Returned
on (Borrowed.Copy_bookID = Returned.Copy_bookID) and (Borrowed.Patron_accountID = Returned.Patron_accountID)
inner join Copy_book
on Borrowed.Copy_bookID = Copy_book.Copy_bookID
inner join Book
on Copy_book.BookID = Book.BookID
where Returned.Returned_time > Borrowed.End_time;

-- 19.What are books that are most popular among user (the most borrowed book) ?
with MostBorrowed as (
    select Book.BookID, Book.BookTitle, COUNT(Borrowed.Copy_bookID) as BorrowCount
    from Book 
    join Copy_Book on Book.BookID = Copy_book.BookID
    join Borrowed on Copy_book.Copy_bookID = Borrowed.Copy_bookID
    group by Book.BookID, Book.BookTitle
)
select BookID, BookTitle, BorrowCount
from MostBorrowed
where BorrowCount = (select max(BorrowCount) from MostBorrowed);

-- 20.What book was published the longest?
select Book.BookID, Book.BookTitle, Author.Name, Book_Author.Publishcation_year as longest_year_book
from Book_Author
join Book on Book_Author.BookID = Book.BookID
join Author on Book_Author.AuthorID = Author.AuthorID
where Book_Author.Publishcation_year = (
    select MIN(Publishcation_year) from Book_Author
)
LIMIT 1;

-- 21.What book was published most recently?
select Book.BookID, Book.BookTitle, Author.Name, Book_Author.Publishcation_year as most_recently_book
from Book_Author
join Book on Book_Author.BookID = Book.BookID
join Author on Book_Author.AuthorID = Author.AuthorID
where Book_Author.Publishcation_year = (
    select max(Publishcation_year) from Book_Author
)
LIMIT 1;

-- 22.What author published more than or equal two book ?
select Book_Author.AuthorID, Author.Name, count(BookID) as number_of_book
from Book_Author, Author
where Book_Author.AuthorID = Author.AuthorID
group by  Author.AuthorID, Author.Name
having count(BookID) >=2;

-- 23.What category have more than two book ?
select Category.CategoryID, CategoryName, count(BookID) as number_of_book
from Book, Category
where Book.CategoryID = Category.CategoryID
group by Category.CategoryID, CategoryName
having count(BookID) >2;


-- 24.What are number of books of each author ?
select Book_Author.AuthorID, Author.Name, count(BookID) as number_of_book
from Book_Author, Author
where Book_Author.AuthorID = Author.AuthorID
group by Author.AuthorID;

-- 25.What books borrowed in this month (November) ?
select Borrowed.Copy_bookID, Book.BookID, BookTitle, Borrowed.Patron_accountID, Patron_account.Name, Email,
Start_time, End_time
from Copy_book, Book, Borrowed, Patron_account
where (Copy_book.Copy_bookID = Borrowed.Copy_bookID) and (Copy_book.BookID = Book.BookID) 
                                                     and (Patron_account.Patron_accountID = Borrowed.Patron_accountID) 
                                                     and month(Start_time) in ('11')
order by Start_time;

-- 26.What are number of books of each category ?
select Category.CategoryID, CategoryName, count(BookID) as number_of_book
from Book, Category
where Book.CategoryID = Category.CategoryID
group by Category.CategoryID, CategoryName











