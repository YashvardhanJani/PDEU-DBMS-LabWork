/*
TITLE: Joins in SQL
OBJECTIVE: SQL joins are used to query data from two or more tables, based on a relationship between certain columns in these tables.
Aim: To demonstrate the use of Embedded SQL, PL/SQL blocks including Cursors, Procedures, Functions, and Triggers.
Theory: PL/SQL is Oracle's procedural extension to SQL.
Cursors allow row-by-row processing, triggers respond to database events and procedures/functions encapsulate reusable logic.
*/

USE company;

-- View
CREATE VIEW DepartmentDetails AS
SELECT * 
FROM DEPT
WHERE DEPTNO IN (
    SELECT DEPTNO 
    FROM EMP 
    GROUP BY DEPTNO 
    HAVING COUNT(*) >= 2
);

-- Save procedure
DELIMITER //
CREATE PROCEDURE GetEmpInfo()
BEGIN
    SELECT * 
	FROM DEPT
	WHERE DEPTNO IN (
		SELEGetEmpInfoCT DEPTNO 
		FROM EMP 
		GROUP BY DEPTNO 
		HAVING COUNT(*) >= 2
	);
END //

/*
Output: The expected output confirms successful execution of SQL commands and matches the theoretical concept.
Result: Successfully executed as per the aim of the experiment. 
*/