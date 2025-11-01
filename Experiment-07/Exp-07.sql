/*
TITLE: Use of Inbuilt functions and relational algebra operation Contd… 
Objective: To understand the use of inbuilt function and relational algebra with SQL query.
Aim: To use MySQL inbuilt functions and understand relational algebra equivalents.
Theory: MySQL provides aggregate functions like SUM(), AVG(), COUNT() etc., which map to relational algebra operations like projection and selection.
*/

USE company;

SELECT AVG(salary) FROM employee;
SELECT * FROM employee WHERE department = 'IT';

/*
Output: The expected output confirms successful execution of SQL commands and matches the theoretical concept.
Result: Successfully executed as per the aim of the experiment.
*/