/* [Set 02]
Hospital Management System - Table Creation (5 Marks)
TABLE: DOCTOR – DoctorlD INT PRIMARY KEY, Name VARCHAR(50) NOT NULL, Specialization
VARCHAR(40) NOT NULL, ConsultationFee DECIMAL(8,2) CHECK(ConsultationFee>=0)
TABLE: PATIENT - PatientID INT PRIMARY KEY, Name VARCHAR(50) NOT NULL, Age INT
CHECK(Age BETWEEN O AND 120), City VARCHAR(40)
TABLE: APPONTMENT – AppointmentD INT PRIMARY KEY, PatientID INT NOT NULL REFERENCES
PATIENT(PatientID), DoctorID INT NOT NULL REFERENCES DOCTOR(DoctorlD), VisitDate DATE NOT NULL

Insert Records (5 Marks)
Insert at least 10 meaningful records in eaçh table.

Write the following SQL Queries (5 x 4 = 20 Marks)
1. Display all doctors specializing in 'Cardiology'.
2. Display patient name, doctor name, shecialization and visit date for all appointments.
3. Display patients who have appointments with doctors whose consultation fee is above the average fee.
4. Display each doctor with the total nuimber of appointments. arranged from highest to lowest.
5. Display each specialization with total appointments and total fee collected, arranged from highest to lowest.
*/

-- TABLE CREATION (5 Marks)

CREATE TABLE DOCTOR (
    DoctorID        INT PRIMARY KEY,
    Name            VARCHAR(50) NOT NULL,
    Specialization  VARCHAR(40) NOT NULL,
    ConsultationFee DECIMAL(8,2) CHECK (ConsultationFee >= 0)
);

CREATE TABLE PATIENT (
    PatientID INT PRIMARY KEY,
    Name      VARCHAR(50) NOT NULL,
    Age       INT CHECK (Age BETWEEN 0 AND 120),
    City      VARCHAR(40)
);

CREATE TABLE APPONTMENT (
    AppointmentID INT PRIMARY KEY,
    PatientID     INT NOT NULL REFERENCES PATIENT(PatientID),
    DoctorID      INT NOT NULL REFERENCES DOCTOR(DoctorID),
    VisitDate     DATE NOT NULL
);

INSERT INTO DOCTOR (DoctorID, Name, Specialization, ConsultationFee) VALUES
(1,  'Dr. Arjun Mehta',     'Cardiology',        800.00),
(2,  'Dr. Bhavna Shah',     'Dermatology',       600.00),
(3,  'Dr. Chetan Patel',    'Orthopedics',       700.00),
(4,  'Dr. Deepa Nair',      'Cardiology',        900.00),
(5,  'Dr. Eshan Gupta',     'General Medicine',  500.00),
(6,  'Dr. Prakash Modha',      'Neurology',     1200.00),
(7,  'Dr. Gaurav Jani',    'Pediatrics',         400.00),
(8,  'Dr. Harshita Raval',    'Gynecology',      750.00),
(9,  'Dr. Ishaan Desai',    'Cardiology',       1000.00),
(10, 'Dr. Jyoti Raval',     'ENT',               550.00);

INSERT INTO PATIENT (PatientID, Name, Age, City) VALUES
(101, 'Amit Shah',        32, 'Ahmedabad'),
(102, 'Bhavi Patel',     45, 'Rajkot'),
(103, 'Chintan Khant',     28, 'Surat'),
(104, 'Deepa Modi',      52, 'Mumbai'),
(105, 'Nisha Singh',       15, 'Delhi'),
(106, 'Farhan Ali',       60, 'Vadodara'),
(107, 'Gaurang Jain',      39, 'Jaipur'),
(108, 'Harshi Rao',   26, 'Pune'),
(109, 'Isha Doshi',     48, 'Ahmedabad'),
(110, 'Jyoti Nair',       35, 'Kochi');

INSERT INTO APPONTMENT (AppointmentID, PatientID, DoctorID, VisitDate) VALUES
(1,  101, 1,  '2025-01-02'),
(2,  102, 4,  '2025-01-05'),
(3,  103, 2,  '2025-01-07'),
(4,  104, 6,  '2025-01-09'),
(5,  105, 5,  '2025-01-10'),
(6,  106, 9,  '2025-01-12'),
(7,  107, 7,  '2025-01-15'),
(8,  108, 8,  '2025-01-18'),
(9,  109, 1,  '2025-01-20'),
(10, 110, 3,  '2025-01-22'),
(11, 101, 9,  '2025-01-25'),
(12, 102, 6,  '2025-01-28');

-- 1. Display all doctors specializing in 'Cardiology'.
SELECT * FROM DOCTOR WHERE Specialization = 'Cardiology';

-- 2. Display patient name, doctor name, specialization and visit date for all appointments.
SELECT p.Name AS PatientName, d.Name AS DoctorName, d.Specialization, a.VisitDate
FROM APPONTMENT a
JOIN PATIENT p ON a.PatientID = p.PatientID
JOIN DOCTOR  d ON a.DoctorID  = d.DoctorID;

-- 3. Display patients who have appointments with doctors whose consultation fee is above the average fee.
SELECT DISTINCT p.PatientID, p.Name, p.Age, p.City
FROM PATIENT p
JOIN APPONTMENT a ON p.PatientID = a.PatientID
JOIN DOCTOR d ON a.DoctorID  = d.DoctorID
WHERE d.ConsultationFee > (SELECT AVG(ConsultationFee) FROM DOCTOR);

-- 4. Display each doctor with the total number of appointments, arranged from highest to lowest.
SELECT d.DoctorID, d.Name, d.Specialization, COUNT(a.AppointmentID) AS TotalAppointments
FROM DOCTOR d
LEFT JOIN APPONTMENT a ON d.DoctorID = a.DoctorID
GROUP BY d.DoctorID, d.Name, d.Specialization
ORDER BY TotalAppointments DESC;

-- 5. Display each specialization with total appointments and total fee collected, arranged from highest to lowest.
SELECT d.Specialization, COUNT(a.AppointmentID) AS TotalAppointments, SUM(d.ConsultationFee) AS TotalFeeCollected
FROM DOCTOR d
JOIN APPONTMENT a ON d.DoctorID = a.DoctorID
GROUP BY d.Specialization
ORDER BY TotalAppointments DESC, TotalFeeCollected DESC;
