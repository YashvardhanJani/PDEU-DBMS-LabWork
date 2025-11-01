/*
TITLE: Nested SQL Queries or Subqueries 
Objective: To understand the use SQL Subquery
Aim: To implement nested queries (subqueries) in SQL.
Theory: A subquery is a query within another query, used for complex filtering or calculations.
*/

USE company;

SELECT ename FROM emp
WHERE sal > (SELECT AVG(sal) FROM employee); 

/*
Output: The expected output confirms successful execution of SQL commands and matches the theoretical concept.
Result: Successfully executed as per the aim of the experiment.
*/