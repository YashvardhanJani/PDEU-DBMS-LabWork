CREATE DATABASE book_data;
USE book_data;

/*
1. Create table AUTHOR = {Author_ID , Lastname, Firstname, Email, City, Country} 
Where: 
Author_ID – text data type, 5 characters, primary key 
Lastname – text data type, 15 characters, not null 
Firstname – text data type, 15 characters, not null 
Email – text data type, 40 characters, 
City – text data type, 15 characters,
Country – text data type, 15 characters, 
*/

CREATE TABLE AUTHOR (
    Author_ID VARCHAR(5) PRIMARY KEY,
    Lastname VARCHAR(15) NOT NULL,
    Firstname VARCHAR(15) NOT NULL,
    Email VARCHAR(40),
    City VARCHAR(15),
    Country VARCHAR(15)
);


/*
2. Create Table BOOK = {Book_ID, Book_Title, Copies}
Where: 
Book_ID – text data type, 5 characters Primary Key Start with Character B 
Book_Title  - Text data Type Not Null 
Copies-  No.of copies Data Type int always greater the 2 
*/

CREATE TABLE BOOK (
    Book_ID VARCHAR(5) PRIMARY KEY CHECK (Book_ID LIKE 'B%'),
    Book_Title VARCHAR(60) NOT NULL,
    Copies INT CHECK (Copies > 2)
);


/*
3. Create table AUTHOR_LIST = {Author_ID , Book_ID , Role} 
Where: 
Author_ID – text data type, 5 characters, referenced by Author_ID from AUTHOR 
table 
Book_ID – text data type, 5 characters 
Role – text data type, 15 characters 
and primary key is Author_ID, Book_ID 
*/

CREATE TABLE AUTHOR_LIST (
	Author_ID VARCHAR(5),
    Book_ID VARCHAR(5),
    Role VARCHAR(15),
    FOREIGN KEY (Author_ID) REFERENCES AUTHOR(Author_ID),
    FOREIGN KEY (Book_ID) REFERENCES Book(Book_ID)
);


-- 4. Add four records in each tables AUTHOR, BOOK, BOOK_LIST.

GRANT SELECT, INSERT ON AUTHOR TO 'root'@'localhost';
GRANT SELECT, INSERT ON BOOK TO 'root'@'localhost';
GRANT SELECT, INSERT ON AUTHOR_LIST TO 'root'@'localhost';

INSERT INTO AUTHOR(Author_ID,Lastname,Firstname,Email,City,Country) VALUES
("A0001","BAJARNE","PHILIPS","BAJARNEPHILIS@1981gmail.com","DELHI","INDIA"),
("A0002","ARJUN","SHARMA","ARJUN@1981gmail.com","DELHI","INDIA"),
("A0003","VIRAT","HADIA","VIRAT@1981gmail.com","SURAT","INDIA"),
("A0004","DILIP","PRAJAPATI","DILIP@1981gmail.com","MUMBAI","INDIA");

INSERT INTO BOOK(Book_ID,Book_Title,Copies) VALUES
("B0001","C++",3),
("B0002","C PROGRAMMING",4),
("B0003","DBMS",3),
("B0004","DLD",5);

INSERT INTO AUTHOR_LIST(Author_ID,Book_ID,Role) VALUES 
("A0001","B0001","WRITER"),
("A0002","B0002","SOFTWARE"),
("A0003","B0003","DATABASE"),
("A0004","B0004","DEVELOPER");


-- 5. Alter structure of table AUTHOR_LIST add the field Publisher data type of 30 Character.

ALTER TABLE AUTHOR_LIST ADD Publisher VARCHAR(30);


SELECT * FROM AUTHOR;
SELECT * FROM BOOK;
SELECT * FROM AUTHOR_LIST;