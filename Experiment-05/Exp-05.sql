/*
TITLE: DCL(Data Control Language) commands with Data Constraints  
Objective: To understand the concept of data constraints that are enforced on data being stored in the table. Focus on Primary Key, The Foreign Key and constraints.  
Aim: To implement Data Control Language commands like GRANT and REVOKE.
Theory: DCL deals with rights, permissions, and other controls of the database system.
*/

USE company;
GRANT SELECT, INSERT ON employee TO 'root'@'localhost';
REVOKE INSERT ON employee FROM 'root'@'localhost';
REVOKE ALL ON employee FROM 'root'@'localhost';
GRANT ALL ON employee TO 'root'@'localhost';

SELECT * FROM employee;

/*
Output: The expected output confirms successful execution of SQL commands and matches the theoretical concept.
Result: Successfully executed as per the aim of the experiment. 
*/