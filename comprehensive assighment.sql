-- You are going to build a project based on Library Management System. It keeps track of all information about books in the library, 
-- their cost, status and total number of books available in the library.

-- Create a database named library and following TABLES in the database: 

-- 1. Branch 
-- 2. Employee 
-- 3. Books
-- 4. Customer
-- 5. IssueStatus
-- 6. ReturnStatus 

DROP DATABASE LibraryDB;
CREATE DATABASE LibraryDB;
USE LibraryDB;
CREATE TABLE Branch(
			Branch_no INT PRIMARY KEY,Manager_Id  VARCHAR(50),Branch_address VARCHAR(50),Contact_no BIGINT
            );

CREATE TABLE Employee (
			Emp_Id INT PRIMARY KEY,Emp_name VARCHAR(50),Position  VARCHAR(50),Salary DECIMAL (10,2),Branch_no INT,
            FOREIGN KEY (Branch_no) REFERENCES Branch(Branch_no)
			);
            
CREATE TABLE Books (
    ISBN VARCHAR (20) PRIMARY KEY,
    Book_title VARCHAR(255),
    Category VARCHAR(100),
    Rental_Price DECIMAL(10, 2),
    Status ENUM('yes', 'no'),
    Author VARCHAR(255),
    Publisher VARCHAR(255)
);

CREATE TABLE Customer (
     Customer_Id INT PRIMARY KEY,
     Customer_name VARCHAR(25),
     Customer_address VARCHAR(150),
     Reg_date DATE
     );
     

CREATE TABLE IssueStatus (
     Issue_Id INT PRIMARY KEY,
     Issued_cust INT,
     Issued_book_name VARCHAR(100),
     Issue_date DATE,
     Isbn_book VARCHAR(20),
     FOREIGN KEY (Issued_cust) REFERENCES Customer(Customer_Id),
     FOREIGN KEY (Isbn_book) REFERENCES Books(ISBN)
     );
     

CREATE TABLE ReturnStatus (
     Return_Id INT PRIMARY KEY,
     Return_cust INT,
     Return_book_name VARCHAR(250),
     Return_date DATE,
    Isbn_book2 VARCHAR(20),
    FOREIGN KEY (Return_cust) REFERENCES Customer(Customer_Id),
    FOREIGN KEY (Isbn_book2) REFERENCES Books(ISBN)
);

SHOW TABLES;
INSERT INTO Branch (Branch_no, Manager_Id, Branch_address, Contact_no) VALUES
(1, 101, '123 Main St', '1234567890'),
(2, 102, '456 Elm St', '0987654321'),
(3, 103, '789 Oak St', '1112223333'),
(4, 104, '101 Pine St', '4445556666'),
(5, 105, '202 Maple St', '7778889999'),
(6, 106, '303 Cedar St', '3332221111'),
(7, 107, '404 Birch St', '5554443333'),
(8, 108, '505 Redwood St', '8887776666'),
(9, 109, '606 Spruce St', '1110009999'),
(10, 110, '707 Willow St', '9998887777'),
(11, 111, '808 Ash St', '6665554444'),
(12, 112, '909 Fir St', '4443332222'),
(13, 113, '100 Sycamore St', '2221110000'),
(14, 114, '110 Poplar St', '3334445555'),
(15, 115, '120 Palm St', '5556667777');

INSERT INTO Books (ISBN, Book_title, Category, Rental_Price, Status, Author, Publisher) VALUES
('978-1234567890', 'Intro to SQL', 'Database', 5.00, 'yes', 'Author A', 'Publisher X'),
('978-1234567891', 'Advanced SQL', 'Database', 6.50, 'yes', 'Author B', 'Publisher Y'),
('978-1234567892', 'Python Programming', 'Programming', 4.50, 'no', 'Author C', 'Publisher Z'),
('978-1234567893', 'Machine Learning', 'AI', 7.00, 'yes', 'Author D', 'Publisher X'),
('978-1234567894', 'Data Science', 'AI', 6.75, 'no', 'Author E', 'Publisher Y'),
('978-1234567895', 'Operating Systems', 'Computer Science', 5.25, 'yes', 'Author F', 'Publisher Z'),
('978-1234567896', 'Network Security', 'Networking', 4.00, 'yes', 'Author G', 'Publisher X'),
('978-1234567897', 'Cybersecurity Essentials', 'Security', 6.00, 'no', 'Author H', 'Publisher Y'),
('978-1234567898', 'Java Programming', 'Programming', 4.75, 'yes', 'Author I', 'Publisher Z'),
('978-1234567899', 'Web Development', 'Web', 5.50, 'no', 'Author J', 'Publisher X'),
('978-1234567810', 'C++ Basics', 'Programming', 3.75, 'yes', 'Author K', 'Publisher Y'),
('978-1234567811', 'Algorithms', 'Computer Science', 6.20, 'no', 'Author L', 'Publisher Z'),
('978-1234567812', 'Data Structures', 'Computer Science', 5.30, 'yes', 'Author M', 'Publisher X'),
('978-1234567813', 'AI Fundamentals', 'AI', 7.25, 'yes', 'Author N', 'Publisher Y'),
('978-1234567814', 'Discrete Math', 'Mathematics', 4.95, 'no', 'Author O', 'Publisher Z');

INSERT INTO Employee (Emp_Id, Emp_name, Position, Salary, Branch_no) VALUES
(201, 'John Doe', 'Librarian', 3000.00, 1),
(202, 'Jane Smith', 'Assistant', 2500.00, 2),
(203, 'Alice Johnson', 'Librarian', 3200.00, 3),
(204, 'Bob Brown', 'Assistant', 2700.00, 4),
(205, 'Emily White', 'Manager', 4000.00, 5),
(206, 'Chris Black', 'Librarian', 3100.00, 6),
(207, 'Tom Green', 'Assistant', 2300.00, 7),
(208, 'Olivia Blue', 'Librarian', 3500.00, 8),
(209, 'Mike Gray', 'Manager', 4200.00, 9),
(210, 'Sophia Purple', 'Assistant', 2800.00, 10),
(211, 'Liam Yellow', 'Librarian', 3600.00, 11),
(212, 'Emma Pink', 'Manager', 4500.00, 12),
(213, 'Noah Red', 'Assistant', 2600.00, 13),
(214, 'Ava Orange', 'Librarian', 3700.00, 14),
(215, 'Lucas Cyan', 'Assistant', 2400.00, 15);

INSERT INTO Customer (Customer_Id, Customer_name, Customer_address, Reg_date) VALUES
(301, 'Anna Brown', '123 Park Ave', '2023-01-15'),
(302, 'Bill Green', '456 River St', '2023-02-10'),
(303, 'Clara Blue', '789 Lake St', '2023-03-20'),
(304, 'David Gray', '101 Hill Rd', '2023-04-25'),
(305, 'Eva Black', '202 Mountain St', '2023-05-30'),
(306, 'Frank White', '303 Beach Blvd', '2023-06-15'),
(307, 'Gina Yellow', '404 Valley Rd', '2023-07-22'),
(308, 'Hank Red', '505 Ocean Dr', '2023-08-05'),
(309, 'Ivy Orange', '606 Desert Ln', '2023-09-10'),
(310, 'Jack Purple', '707 Forest St', '2023-10-18'),
(311, 'Kara Pink', '808 Plain St', '2023-11-03'),
(312, 'Liam Silver', '909 Sky St', '2023-12-12'),
(313, 'Mia Cyan', '110 Rocky St', '2023-11-29'),
(314, 'Nina Gold', '120 Field Ave', '2023-12-01'),
(315, 'Omar Bronze', '130 Island Rd', '2023-12-15');

INSERT INTO IssueStatus (Issue_Id, Issued_cust, Issued_book_name, Issue_date, Isbn_book) VALUES
(401, 301, 'Intro to SQL', '2023-01-16', '978-1234567890'),
(402, 302, 'Advanced SQL', '2023-02-11', '978-1234567891'),
(403, 303, 'Python Programming', '2023-03-21', '978-1234567892'),
(404, 304, 'Machine Learning', '2023-04-26', '978-1234567893'),
(405, 305, 'Data Science', '2023-05-31', '978-1234567894'),
(406, 306, 'Operating Systems', '2023-06-16', '978-1234567895'),
(407, 307, 'Network Security', '2023-07-23', '978-1234567896'),
(408, 308, 'Cybersecurity Essentials', '2023-08-06', '978-1234567897'),
(409, 309, 'Java Programming', '2023-09-11', '978-1234567898'),
(410, 310, 'Web Development', '2023-10-19', '978-1234567899'),
(411, 311, 'C++ Basics', '2023-11-04', '978-1234567810'),
(412, 312, 'Algorithms', '2023-12-13', '978-1234567811'),
(413, 313, 'Data Structures', '2023-11-30', '978-1234567812'),
(414, 314, 'AI Fundamentals', '2023-12-02', '978-1234567813'),
(415, 315, 'Discrete Math', '2023-12-16', '978-1234567814');

INSERT INTO ReturnStatus (Return_Id, Return_cust, Return_book_name, Return_date, Isbn_book2) VALUES
(501, 301, 'Intro to SQL', '2023-01-20', '978-1234567890'),
(502, 302, 'Advanced SQL', '2023-02-15', '978-1234567891'),
(503, 303, 'Python Programming', '2023-03-25', '978-1234567892'),
(504, 304, 'Machine Learning', '2023-04-30', '978-1234567893'),
(505, 305, 'Data Science', '2023-06-05', '978-1234567894'),
(506, 306, 'Operating Systems', '2023-06-20', '978-1234567895'),
(507, 307, 'Network Security', '2023-07-25', '978-1234567896'),
(508, 308, 'Cybersecurity Essentials', '2023-08-10', '978-1234567897'),
(509, 309, 'Java Programming', '2023-09-15', '978-1234567898'),
(510, 310, 'Web Development', '2023-10-23', '978-1234567899'),
(511, 311, 'C++ Basics', '2023-11-10', '978-1234567810'),
(512, 312, 'Algorithms', '2023-12-20', '978-1234567811'),
(513, 313, 'Data Structures', '2023-12-03', '978-1234567812'),
(514, 314, 'AI Fundamentals', '2023-12-06', '978-1234567813'),
(515, 315, 'Discrete Math', '2023-12-18', '978-1234567814');

SELECT * FROM Branch;
SELECT * FROM Employee;
SELECT * FROM Books;
SELECT * FROM Customer;
SELECT * FROM IssueStatus;
SELECT * FROM ReturnStatus;
--  Retrieve the book title, category, and rental price of all available books
SELECT Book_title,Category,Rental_Price FROM Books WHERE Status="yes";

-- List the employee names and their respective salaries in descending order of salary.
SELECT Emp_name,Salary FROM Employee ORDER BY Salary desc;

-- Retrieve the book titles and the corresponding customers who have issued those books. 
SELECT Customer.Customer_name,Books.Book_title FROM IssueStatus INNER JOIN Customer ON IssueStatus.Issued_cust=Customer.Customer_Id
JOIN  Books ON IssueStatus.Isbn_book=Books.ISBN;

-- Display the total count of books in each category. 
SELECT Category,COUNT(*) AS Total_count FROM  Books GROUP BY Category;

 -- Retrieve the employee names and their positions for the employees whose salaries are above 5000.
  SELECT Emp_name,Position FROM Employee WHERE Salary> 5000;
  
-- List the customer names who registered before 2022-01-01 and have not issued any books yet. 
SELECT Customer.Customer_name FROM Customer LEFT JOIN IssueStatus ON IssueStatus.Issued_cust=Customer.Customer_Id WHERE 
Customer.Reg_date <2022-01-01 AND IssueStatus.Issue_Id IS NULL;

-- Display the branch numbers and the total count of employees in each branch. 
SELECT Branch_no,COUNT(*) AS Total_Count FROM Employee GROUP BY Branch_no;

 -- Display the names of customers who have issued books in the month of June 2023.
 SELECT DISTINCT Customer.Customer_name FROM IssueStatus INNER JOIN Customer ON IssueStatus.Issued_cust=Customer.Customer_Id 
 WHERE Issue_date BETWEEN '2023-06-01' AND '2023-06-30';
 
--  Retrieve book_title from book table containing history.
SELECT Book_title FROM Books WHERE Book_title LIKE '%history%';

-- Retrieve the branch numbers along with the count of employees for branches having more than 5 employees
SELECT Branch_no,COUNT(*) AS Total_Employee FROM Employee GROUP BY Branch_no HAVING COUNT(*) >5;

 -- Retrieve the names of employees who manage branches and their respective branch addresses
 SELECT Employee.Emp_name,Branch.Branch_address FROM Employee JOIN Branch ON  Employee.Emp_Id=Branch.Manager_Id;
 
-- Display the names of customers who have issued books with a rental price higher than Rs. 25
SELECT DISTINCT Customer.Customer_name FROM Customer JOIN IssueStatus  ON Customer.Customer_Id = IssueStatus .Issued_cust
JOIN Books ON IssueStatus.Isbn_book = Books.ISBN WHERE Books.Rental_Price > 25;






     



     
     
     
     
     
     
     


            






