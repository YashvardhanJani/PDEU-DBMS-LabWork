/*
TITLE: DDL (Data Definition Language) commands with Data Constraints  
Objective: To understand the concept of data constraints that is enforced on data being stored in the table. Focus on Primary Key and the Foreign Key.
Aim: To define tables using constraints such as PRIMARY KEY, FOREIGN KEY, etc.
Theory: Constraints are used to maintain accuracy and integrity of data. 
*/

USE company;

CREATE TABLE department(
	dept_id INT PRIMARY KEY,
    dept_name VARCHAR(30) 
);

CREATE TABLE employee(
	emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    dept_id INT,
    FOREIGN KEY (dept_id) REFERENCES department(dept_id)
);

/*
Output: The expected output confirms successful execution of SQL commands and matches the theoretical concept.
Result: Successfully executed as per the aim of the experiment. 
*/