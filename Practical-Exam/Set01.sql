/* [Set 01]
Library Management System - Table Creation (5 Marks)
TABLE: BOOK - BookID INT PRIMARY KEY, Title VARCHAR(60) NOT NULL, Author VARCHAR(40)
NOT NULL, Category VARCHAR(30) NOT NULL, Price DECIMAL(8,2) CHECK(Price>0)
TABLE: MEMBER - MemberID INT PRIMARY KEY, Name VARCHAR(50) NOT NULL, City
VARCHAR(40) NOT NULL, MemberType VARCHAR(20) CHECK(MemberType IN('Student','Staff','External'))
TABLE: ISSUE_RETURN - TxnID INT PRIMARY KEY, MemberlD INT NOT NULL REFERENCES
MEMBER(MemberlD), BooklD INT NOT NULL REFERENCES BOOK(BookID), IssueDate DATE NOT
NULL, Return Date DATE, FineAmount DECIMAL(8,2) CHECK(FineAmount>=0)

Insert Records (5 Marks)
Insert at least 10 mcaningful records in each table.

Write the following SQL Queries (5 x 4 = 20 Marks)
1. Display all books belonging to the category 'Computer Science'.
2. Display member name, book title, issue date, return date and fine amount for all transactions.
3. Display members whose total fine amount is greater than the average fine amount of all members.
4. Display each member with the total number of books issued, arranged from highest to lowest.
5. Display each book category with total issues and total fine collected, arranged from highest to lowest.
*/

CREATE TABLE BOOK (
    BookID     INT PRIMARY KEY,
    Title      VARCHAR(60)  NOT NULL,
    Author     VARCHAR(40)  NOT NULL,
    Category   VARCHAR(30)  NOT NULL,
    Price      DECIMAL(8,2) CHECK (Price > 0)
);

CREATE TABLE MEMBER (
    MemberID    INT PRIMARY KEY,
    Name        VARCHAR(50) NOT NULL,
    City        VARCHAR(40) NOT NULL,
    MemberType  VARCHAR(20) CHECK (MemberType IN ('Student', 'Staff', 'External'))
);

CREATE TABLE ISSUE_RETURN (
    TxnID       INT PRIMARY KEY,
    MemberID    INT NOT NULL REFERENCES MEMBER(MemberID),
    BookID      INT NOT NULL REFERENCES BOOK(BookID),
    IssueDate   DATE NOT NULL,
    ReturnDate  DATE,
    FineAmount  DECIMAL(8,2) CHECK (FineAmount >= 0)
);

INSERT INTO BOOK (BookID, Title, Author, Category, Price) VALUES
(1,  'Database System Concepts', 'Silberschatz',          'Computer Science', 750.00),
(2,  'Operating System Concepts', 'Silberschatz',         'Computer Science', 680.00),
(3,  'Let Us C',                 'Yashwant Kanetkar',     'Computer Science', 350.00),
(4,  'Digital Logic Design',     'Morris Mano',           'Electronics',      500.00),
(5,  'Linear Algebra',           'Gilbert Strang',        'Mathematics',      600.00),
(6,  'Introduction to Algorithms','Cormen et al.',        'Computer Science', 900.00),
(7,  'Computer Networks',        'Andrew Tanenbaum',      'Computer Science', 550.00),
(8,  'English Grammar',          'Wren and Martin',       'Language',         300.00),
(9,  'Physics for Engineers',    'H. C. Verma',           'Physics',          650.00),
(10, 'Database Management',      'Ramakrishnan & Gehrke', 'Computer Science', 800.00);

INSERT INTO MEMBER (MemberID, Name, City, MemberType) VALUES
(101, 'Amit Shah',      'Ahmedabad', 'Student'),
(102, 'Bhavna Patel',   'Rajkot',    'Student'),
(103, 'Chetan Joshi',   'Surat',     'Staff'),
(104, 'Deepa Mehta',    'Mumbai',    'External'),
(105, 'Esha Singh',     'Delhi',     'Student'),
(106, 'Kaustubh Joshi', 'Vadodara',  'Staff'),
(107, 'Gaurav Jani',    'Jamjodhpur', 'External'),
(108, 'Harshita Raval',  'Porbandar',  'Student'),
(109, 'Ishaan Desai',   'Ahmedabad', 'Student'),
(110, 'Jyoti Nair',     'Kochi',     'Staff');

INSERT INTO ISSUE_RETURN (TxnID, MemberID, BookID, IssueDate,   ReturnDate,   FineAmount) VALUES
(1, 101, 1,  '2025-01-01', '2025-01-10',  0.00),
(2, 101, 2,  '2025-01-15', '2025-01-25', 20.00),
(3, 102, 3,  '2025-01-05', '2025-01-12',  0.00),
(4, 103, 4,  '2025-01-07', '2025-01-20', 10.00),
(5, 104, 5,  '2025-01-10', '2025-01-18',  0.00),
(6, 105, 6,  '2025-01-12', '2025-01-28', 30.00),
(7, 106, 7,  '2025-01-18',  NULL,         0.00),
(8, 107, 8,  '2025-01-20', '2025-01-30',  5.00),
(9, 108, 9,  '2025-01-22',  NULL,         0.00),
(10,109,10, '2025-01-25', '2025-02-05', 15.00),
(11,110,1,  '2025-01-27', '2025-02-02',  0.00),
(12,102,2,  '2025-02-01',  NULL,         0.00);

-- 1. Display all books belonging to the category 'Computer Science'.
SELECT * FROM BOOK WHERE Category = 'Computer Science';

-- 2. Display member name, book title, issue date, return date and fine amount for all transactions. 
SELECT m.Name AS MemberName, b.Title AS BookTitle, ir.IssueDate, ir.ReturnDate, ir.FineAmount
FROM ISSUE_RETURN ir
JOIN MEMBER m ON ir.MemberID = m.MemberID
JOIN BOOK b ON ir.BookID = b.BookID;

-- 3. Display members whose total fine amount is greater than the average fine amount of all members.
SELECT m.MemberID, m.Name, SUM(ir.FineAmount) AS TotalFine
FROM MEMBER m
JOIN ISSUE_RETURN ir ON m.MemberID = ir.MemberID
GROUP BY m.MemberID, m.Name
HAVING SUM(ir.FineAmount) > (SELECT AVG(MemberTotalFine) FROM (SELECT SUM(FineAmount) AS MemberTotalFine FROM ISSUE_RETURN GROUP BY MemberID) AS T);

-- 4. Display each member with the total number of books issued, arranged from highest to lowest.
SELECT m.MemberID, m.Name, COUNT(ir.BookID) AS TotalBooksIssued
FROM MEMBER m
LEFT JOIN ISSUE_RETURN ir ON m.MemberID = ir.MemberID
GROUP BY m.MemberID, m.Name
ORDER BY TotalBooksIssued DESC;


--  5. Display each book category with total issues and total fine collected, arranged from highest to lowest.
SELECT b.Category, COUNT(ir.TxnID) AS TotalIssues, SUM(ir.FineAmount)   AS TotalFineCollected
FROM BOOK b
JOIN ISSUE_RETURN ir ON b.BookID = ir.BookID
GROUP BY b.Category
ORDER BY TotalIssues DESC, TotalFineCollected DESC;