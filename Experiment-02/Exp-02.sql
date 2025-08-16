/*
TITLE: DDL (Data Definition Language) commands 
Objective: To understand the concept of designing issues related to the database with creating, populating the tables.
Aim: To use various DDL commands like CREATE, ALTER, and DROP.
Theory: DDL commands are used to define the database structure or schema. They do not manipulate data but affect table definitions and structures.
*/

USE company;

CREATE TABLE employee (
	id INT PRIMARY KEY,
    name VARCHAR(50), 
    salary DECIMAL(10, 2)
);

ALTER TABLE employee ADD department VARCHAR(30);

SELECT * FROM employee;

DROP TABLE employee;

/*
Output: The expected output confirms successful execution of SQL commands and matches the theoretical concept.
Result: Successfully executed as per the aim of the experiment.
*/