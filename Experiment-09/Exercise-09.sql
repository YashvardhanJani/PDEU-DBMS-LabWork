-- Write the SQL Queries for the following queries (use EMP and DEPT table of Exp 8). 
USE company;

-- 1. List the Deptno where there are no emps.
SELECT DEPTNO, DNAME
FROM DEPT
WHERE DEPTNO NOT IN (SELECT DISTINCT DEPTNO FROM EMP);

-- 2. List the No.of emp’s and Avg salary within each department for each job.
SELECT DEPTNO, JOB, COUNT(*) AS Num_Emps, AVG(SAL) AS Avg_Salary
FROM EMP
GROUP BY DEPTNO, JOB;

-- 3. Find the maximum average salary drawn for each job except for ‘President’.
SELECT JOB, MAX(AVG_SAL) AS Max_Avg_Salary
FROM (
    SELECT JOB, DEPTNO, AVG(SAL) AS AVG_SAL
    FROM EMP
    WHERE JOB <> 'PRESIDENT'
    GROUP BY JOB, DEPTNO
) AS JobAvg
GROUP BY JOB;

-- 4. List the department details where at least two emps are working.
SELECT D.*
FROM DEPT D
JOIN EMP E ON D.DEPTNO = E.DEPTNO
GROUP BY D.DEPTNO, D.DNAME, D.LOC
HAVING COUNT(E.EMPNO) >= 2;

-- 5. List the no. of emps in each department where the no. is more than 3.  
SELECT DEPTNO, COUNT(*) AS Num_Employees
FROM EMP
GROUP BY DEPTNO
HAVING COUNT(*) > 3;

-- 6. List the names of the emps who are getting the highest sal dept wise.
SELECT E.ENAME, E.DEPTNO, E.SAL
FROM EMP E
WHERE E.SAL = (
    SELECT MAX(SAL)
    FROM EMP
    WHERE DEPTNO = E.DEPTNO
);

-- 7. List the Deptno and their average salaries for dept with the average salary less than the averages for all departments.
SELECT DEPTNO, AVG(SAL) AS Dept_Avg_Sal
FROM EMP
GROUP BY DEPTNO
HAVING AVG(SAL) < (
    SELECT AVG(SAL) FROM EMP
);

-- 8. In addition refer Experiment 7 & 8 and execute the same questions by using join.
	-- 1. List the details of the emps whose Salaries more than the employee BLAKE. 
	SELECT E.*
	FROM EMP E
	JOIN EMP B ON B.ENAME = 'BLAKE'
	WHERE E.SAL > B.SAL;

	-- 2. List the emps whose Jobs are same as ALLEN.  \
	SELECT E.*
	FROM EMP E
	JOIN EMP A ON A.ENAME = 'ALLEN'
	WHERE E.JOB = A.JOB;

	-- 3. List the Emps whose Sal is same as FORD or SMITH in desc order of Names.  
	SELECT DISTINCT E.*
	FROM EMP E
	JOIN EMP F ON (F.ENAME = 'FORD' OR F.ENAME = 'SMITH')
	WHERE E.SAL = F.SAL
	ORDER BY E.ENAME DESC;

	-- 4. List the emps whose Jobs are same as MILLER or Sal is more than ALLEN.  
	SELECT DISTINCT E.*
	FROM EMP E
	LEFT JOIN EMP M ON M.ENAME = 'MILLER'
	LEFT JOIN EMP A ON A.ENAME = 'ALLEN'
	WHERE E.JOB = M.JOB OR E.SAL > A.SAL;

	-- 5. Find the highest paid employee of sales department.  
	SELECT E.*
	FROM EMP E
	JOIN DEPT D ON E.DEPTNO = D.DEPTNO
	WHERE D.DNAME = 'SALES'
	  AND E.SAL = (
		  SELECT MAX(E2.SAL)
		  FROM EMP E2
		  JOIN DEPT D2 ON E2.DEPTNO = D2.DEPTNO
		  WHERE D2.DNAME = 'SALES'
	  );

	/* 6. List the employees who are senior to most recently hired employee working under king. 
	List the employees who are senior to most recently hired employee working under king. */
	SELECT E.*
	FROM EMP E
	JOIN (
		SELECT MAX(HIREDATE) AS LatestHireDate
		FROM EMP
		WHERE MGR = (SELECT EMPNO FROM EMP WHERE ENAME = 'KING')
	) L ON E.HIREDATE < L.LatestHireDate;

	-- 7. List the names of the emps who are getting the highest sal dept wise.  
	SELECT E.ENAME, E.DEPTNO, E.SAL
	FROM EMP E
	JOIN (
		SELECT DEPTNO, MAX(SAL) AS MAX_SAL
		FROM EMP
		GROUP BY DEPTNO
	) M ON E.DEPTNO = M.DEPTNO AND E.SAL = M.MAX_SAL;

	-- 8. List the emps whose sal is equal to the average of max and minimum  
	SELECT E.*
	FROM EMP E
	JOIN (
		SELECT (MAX(SAL) + MIN(SAL)) / 2 AS Mid_Salary
		FROM EMP
	) X ON E.SAL = X.Mid_Salary;

	-- 9. List the emps who joined in the company on the same date. 
	SELECT E1.*
	FROM EMP E1
	JOIN EMP E2 ON E1.HIREDATE = E2.HIREDATE AND E1.EMPNO <> E2.EMPNO
	ORDER BY E1.HIREDATE;

	-- 10. Find out the emps who joined in the company before their Managers. 
	SELECT E1.*
	FROM EMP E1
	JOIN EMP M ON E1.MGR = M.EMPNO
	WHERE E1.HIREDATE < M.HIREDATE;