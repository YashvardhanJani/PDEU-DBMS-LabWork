/*
Title: DML commands with constraints 
Objective: - To understand the concept of different DML commands.
Aim: To perform DML operations with constraints like NOT NULL, UNIQUE, CHECK.
Theory: DML allows manipulation of data within tables. Constraints enforce data integrity.
*/

CREATE DATABASE SCHOOL;
USE SCHOOL;

CREATE TABLE STUDENT(
	ID INT PRIMARY KEY,
    Name VARCHAR(50) NOT NULL,
    Age INT CHECK(Age>=18),
    Email VARCHAR(50) UNIQUE
);

INSERT INTO student VALUES (1, 'John', 20, 'john@example.com'); 

SELECT * FROM STUDENT;

/*
Output: The expected output confirms successful execution of SQL commands and matches the theoretical concept.
Result: Successfully executed as per the aim of the experiment.
*/