-- Create two tables (EMP and DEPT) 

USE company;

CREATE TABLE EMP (
    EMPNO INT PRIMARY KEY,
    ENAME VARCHAR(20),
    JOB VARCHAR(20),
    MGR INT,
    HIREDATE DATE,
    SAL DECIMAL(10,2),
    COMM DECIMAL(10,2),
    DEPTNO INT
);

INSERT INTO EMP VALUES
(7369, 'SMITH',  'CLERK',    7902, '1980-12-17',  500,  800, 20),
(7499, 'ALLEN',  'SALESMAN', 7698, '1981-02-20', 1600,  300, 30),
(7521, 'WARD',   'SALESMAN', 7698, '1981-02-22', 1250,  500, 30),
(7566, 'JONES',  'MANAGER',  7839, '1981-04-02', 2975,   20, NULL),
(7654, 'MARTIN', 'SALESMAN', 7698, '1981-09-28', 1250, 1400, 30),
(7698, 'BLAKE',  'MANAGER',  7839, '1981-05-01', 2850,   30, NULL),
(7782, 'CLARK',  'MANAGER',  7839, '1981-06-09', 2450,   10, NULL),
(7788, 'SCOTT',  'ANALYST',  7566, '1982-12-09', 3000,   20, NULL),
(7839, 'KING',   'PRESIDENT', NULL, '1981-11-17', 5000, 10, NULL),
(7844, 'TURNER','SALESMAN',  7698, '1981-09-08', 1500,    0, 30),
(7876, 'ADAMS',  'CLERK',    7788, '1983-01-12', 1100,   20, NULL),
(7900, 'JAMES',  'CLERK',    7698, '1981-12-03',  950,   30, NULL),
(7902, 'FORD',   'ANALYST',  7566, '1981-12-03', 3000,   20, NULL),
(7934, 'MILLER', 'CLERK',    7782, '1982-01-23', 1300,   10, NULL);

CREATE TABLE DEPT (
    DEPTNO INT PRIMARY KEY,
    DNAME VARCHAR(20),
    LOC VARCHAR(20)
);

INSERT INTO DEPT VALUES
(10, 'ACCOUNTING', 'NEW YORK'),
(20, 'RESEARCH', 'DALLAS'),
(30, 'SALES', 'CHICAGO'),
(40, 'OPERATIONS', 'BOSTON');


-- 1. List the details of the emps whose Salaries more than the employee BLAKE. 
SELECT * FROM EMP WHERE SAL > (SELECT SAL FROM EMP WHERE ENAME = 'BLAKE');
 
-- 2. List the emps whose Jobs are same as ALLEN.  \
SELECT * FROM EMP WHERE JOB = (SELECT JOB FROM EMP WHERE ENAME = 'ALLEN');

-- 3. List the Emps whose Sal is same as FORD or SMITH in desc order of Names.  
SELECT * FROM EMP
WHERE SAL IN (
	(SELECT SAL FROM EMP WHERE ENAME = 'FORD'),
    (SELECT SAL FROM EMP WHERE ENAME = 'SMITH')
)
ORDER BY ENAME DESC;

-- 4. List the emps whose Jobs are same as MILLER or Sal is more than ALLEN.  
SELECT * FROM EMP
WHERE JOB = (SELECT JOB FROM EMP WHERE ENAME = 'MILLER')
   OR SAL > (SELECT SAL FROM EMP WHERE ENAME = 'ALLEN');

-- 5. Find the highest paid employee of sales department.  
SELECT * FROM EMP
WHERE DEPTNO = (SELECT DEPTNO FROM DEPT WHERE DNAME = 'SALES')
  AND SAL = (SELECT MAX(SAL) FROM EMP 
             WHERE DEPTNO = (SELECT DEPTNO FROM DEPT WHERE DNAME = 'SALES'));

/* 6. List the employees who are senior to most recently hired employee working under king. 
List the employees who are senior to most recently hired employee working under king. */
SELECT * FROM EMP
WHERE HIREDATE < (
    SELECT MAX(HIREDATE) FROM EMP 
    WHERE MGR = (SELECT EMPNO FROM EMP WHERE ENAME = 'KING')
);

-- 7. List the names of the emps who are getting the highest sal dept wise.  
SELECT E.ENAME, E.DEPTNO, E.SAL FROM EMP E
WHERE E.SAL = (
    SELECT MAX(SAL) 
    FROM EMP 
    WHERE DEPTNO = E.DEPTNO
);

-- 8. List the emps whose sal is equal to the average of max and minimum  
SELECT * FROM EMP
WHERE SAL = (SELECT (MAX(SAL) + MIN(SAL)) / 2 FROM EMP);

-- 9. List the emps who joined in the company on the same date. 
SELECT * FROM EMP
WHERE HIREDATE IN (
    SELECT HIREDATE FROM EMP 
    GROUP BY HIREDATE 
    HAVING COUNT(*) > 1
);

-- 10. Find out the emps who joined in the company before their Managers. 
SELECT * FROM EMP E
WHERE HIREDATE < (SELECT HIREDATE FROM EMP WHERE EMPNO = E.MGR);