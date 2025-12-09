/* [Set 04]
College Management System - Table Creation (5 Marks)
TABLE: STUDENT - StudentlD INT PRIMARY KEY, Name VARCHAR(50) NOT NULL, Department
VARCHAR(40) NOT NULL, Semester INT CHECK(Semester BETWEEN I AND 8), CGPA DECIMAL(3,2)
CHECK(CGPA BETWEENO AND 10)
TABLE: COURSE - CourselD VARCHAR(10) PRIMARY KEY, CourseName VARCHAR(60) NOT NULL,
Credits INT CHECK(Credits BETWEEN 1 AND 5), Department VARCHAR(40) NOT NULL
TABLE: ENROLLMENT - EnrollID INT PRIMARY KEY, StudentID INT NOT NULL REFERENCES
STUDENT(StudentID), CourselD VARCHAR(10) NOT NULL REFERENCES COURSE(CourselD), Grade
CHAR(2) CHECK (Grade IN('AA','AB','BB','BC','CC','CD','DD','FF'))

Insert Records (5 Marks)
Insert at least 10 meaningful records in each table.

Write the following SQL Queries (5x4 = 20 Marks)
1. Display all students from the CSE department.
2. Display enrollment details with student name, course name and grade.
3. Display students whose CGPA is greater than the average CGPA of their department.
4. Display each course with total number of students enrolled, arranged from highest to lowest.
5. Display each department with total students, total courses and average CGPA, arranged from highest to lowest average CGPA.
*/

CREATE TABLE STUDENT (
    StudentID  INT PRIMARY KEY,
    Name       VARCHAR(50) NOT NULL,
    Department VARCHAR(40) NOT NULL,
    Semester   INT CHECK (Semester BETWEEN 1 AND 8),
    CGPA       DECIMAL(3,2) CHECK (CGPA BETWEEN 0 AND 10)
);

CREATE TABLE COURSE (
    CourseID   VARCHAR(10) PRIMARY KEY,
    CourseName VARCHAR(60) NOT NULL,
    Credits    INT CHECK (Credits BETWEEN 1 AND 5),
    Department VARCHAR(40) NOT NULL
);

CREATE TABLE ENROLLMENT (
    EnrollID  INT PRIMARY KEY,
    StudentID INT NOT NULL REFERENCES STUDENT(StudentID),
    CourseID  VARCHAR(10) NOT NULL REFERENCES COURSE(CourseID),
    Grade     CHAR(2) CHECK (Grade IN ('AA','AB','BB','BC','CC','CD','DD','FF'))
);

INSERT INTO STUDENT (StudentID, Name, Department, Semester, CGPA) VALUES
(201, 'Amit Shah',        'CSE',   3, 8.20),
(202, 'Bhavna Patel',     'CSE',   5, 7.60),
(203, 'Chetan Joshi',     'ECE',   4, 8.75),
(204, 'Deepa Mehta',      'ME',    6, 7.10),
(205, 'Esha Singh',       'CSE',   2, 9.05),
(206, 'Harshdip Zala',    'CIVIL', 7, 6.80),
(207, 'Gaurav Jani',      'ECE',   3, 9.95),
(208, 'Harshita Raval',   'ME',    1, 9.10),
(209, 'Ishaan Desai',     'CSE',   8, 7.25),
(210, 'Jyoti Nair',       'CIVIL', 5, 8.40);

INSERT INTO COURSE (CourseID, CourseName, Credits, Department) VALUES
('CS101', 'Programming in C',                 4, 'CSE'),
('CS102', 'Data Structures',                  4, 'CSE'),
('CS201', 'Database Management Systems',      4, 'CSE'),
('CS301', 'Operating Systems',                4, 'CSE'),
('EC201', 'Signals and Systems',              3, 'ECE'),
('EC202', 'Digital Electronics',              3, 'ECE'),
('ME301', 'Thermodynamics',                   3, 'ME'),
('ME302', 'Machine Design',                   4, 'ME'),
('CE101', 'Engineering Mechanics',            3, 'CIVIL'),
('CE201', 'Structural Analysis',              4, 'CIVIL');

INSERT INTO ENROLLMENT (EnrollID, StudentID, CourseID, Grade) VALUES
(1,  201, 'CS101', 'AA'),
(2,  201, 'CS102', 'AB'),
(3,  202, 'CS101', 'BB'),
(4,  202, 'CS201', 'BC'),
(5,  203, 'EC201', 'AA'),
(6,  203, 'EC202', 'AB'),
(7,  204, 'ME301', 'BC'),
(8,  205, 'CS102', 'AA'),
(9,  205, 'CS201', 'AB'),
(10, 206, 'CE101', 'CC'),
(11, 209, 'CS301', 'BB'),
(12, 210, 'CE201', 'AB');

-- 1. Display all students from the CSE department.
SELECT * FROM STUDENT WHERE Department = 'CSE';

-- 2. Display enrollment details with student name, course name and grade.
SELECT e.EnrollID, s.Name AS StudentName, c.CourseName AS CourseName, e.Grade
FROM ENROLLMENT e
JOIN STUDENT   s ON e.StudentID = s.StudentID
JOIN COURSE    c ON e.CourseID  = c.CourseID;

-- 3. Display students whose CGPA is greater than the average CGPA of their department.
SELECT s.StudentID, s.Name, s.Department, s.Semester, s.CGPA
FROM STUDENT s
WHERE s.CGPA > (SELECT AVG(s2.CGPA) FROM STUDENT s2 WHERE s2.Department = s.Department);

-- 4. Display each course with total number of students enrolled, arranged from highest to lowest.
SELECT c.CourseID, c.CourseName, c.Department, COALESCE(COUNT(e.EnrollID), 0) AS TotalStudentsEnrolled
FROM COURSE c
LEFT JOIN ENROLLMENT e ON c.CourseID = e.CourseID
GROUP BY c.CourseID, c.CourseName, c.Department
ORDER BY TotalStudentsEnrolled DESC;

-- 5. Display each department with total students, total courses and average CGPA, arranged from highest to lowest average CGPA.
SELECT s.Department, COUNT(s.StudentID) AS TotalStudents, (SELECT COUNT(*) FROM COURSE c WHERE c.Department = s.Department) AS TotalCourses,
    AVG(s.CGPA) AS AvgCGPA
FROM STUDENT s
GROUP BY s.Department
ORDER BY AvgCGPA DESC;