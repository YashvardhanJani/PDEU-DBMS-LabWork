/*
TITLE: Group by & having clause and Join in SQL
Objective: To understand the use of group by and having clause.
To use GROUP BY, HAVING clauses and SQL JOIN operations.
Theory: GROUP BY is used to group rows with same values. HAVING is used to filter aggregated data. JOIN is used to combine rows from two or more tables. 
*/

SELECT dept_id, COUNT(*)
FROM employee
GROUP BY dept_id
HAVING COUNT(*) > 1;

SELECT e.emp_name, d.dept_name
FROM employee e
JOIN department d ON e.dept_id = d.dept_id; 

/*
Output: The expected output confirms successful execution of SQL commands and matches the theoretical concept.
Result: Successfully executed as per the aim of the experiment. 
*/