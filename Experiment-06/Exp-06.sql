/*
Title: Use of Inbuilt functions and relational algebra operation and Transaction control commands, Commit, Rollback, save point 
Objective: To understand the use of inbuilt function and relational algebra with SQL query.
Aim: To demonstrate use of Relational algebra, COMMIT, ROLLBACK, and SAVEPOINT.
Theory: Transaction control commands manage changes made by DML statements.
*/

CREATE DATABASE transc;
USE transc;

CREATE TABLE employee (
	emp_no INT PRIMARY KEY,
    name VARCHAR(15),
    role VARCHAR(7)
);

START TRANSACTION;
INSERT INTO employee VALUES (101, 'Alice', 'HR');
SAVEPOINT sp1;
INSERT INTO employee VALUES (102, 'Bob', 'IT');

SELECT * FROM employee;

ROLLBACK TO sp1;
COMMIT;

SELECT * FROM employee;

/*
Output: The expected output confirms successful execution of SQL commands and matches the theoretical concept.
Result: Successfully executed as per the aim of the experiment.
*/