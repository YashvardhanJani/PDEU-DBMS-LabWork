/*
1. Consider the following table structure and attempt. 
Supplier-(scode,sname,scity,turnover) 
Part-(pcode,weigh,color,cost,sellingprice) 
Supplier_Part-(scode,pcode,qty) 
a) Create tables 
b) Populate the table. 
*/

USE company;

CREATE TABLE Supplier (
	scode INT PRIMARY KEY,
    sname VARCHAR(20),
    scity VARCHAR(10),
    turnover DECIMAL(12,2)
);

CREATE TABLE Part (
    pcode INT PRIMARY KEY,
    weigh DECIMAL(8,2),
    color VARCHAR(30),
    cost DECIMAL(10,2),
    sellingprice DECIMAL(10,2)
);

CREATE TABLE Supplier_Part (
    scode INT,
    pcode INT,
    qty INT,
    PRIMARY KEY (scode, pcode),
    FOREIGN KEY (scode) REFERENCES Supplier(scode),
    FOREIGN KEY (pcode) REFERENCES Part(pcode)
);

INSERT INTO Supplier VALUES 
(101, 'ABC Traders', 'Mumbai', 1500000.00),
(102, 'XYZ Supplies', 'Delhi', 2300000.00),
(103, 'Prime Corp', 'Bangalore', 1250000.00);

INSERT INTO Part VALUES 
(201, 1.25, 'Red', 150.00, 200.00),
(202, 0.75, 'Blue', 100.00, 140.00),
(203, 2.00, 'Green', 250.00, 310.00),
(204, 1.00, 'Black', 180.00, 230.00);

INSERT INTO Supplier_Part VALUES
(101, 201, 500),
(101, 202, 300),
(102, 203, 700),
(102, 204, 400),
(103, 201, 250),
(103, 204, 600);


-- 2. Write appropriate SQL Statement for the following: 

	-- 1. Get the supplier number and part number in ascending order of supplier number. 
SELECT scode, pcode FROM Supplier_Part ORDER BY scode;     

	-- 2. Get the details of supplier who operate from Bombay with turnover 50 lakh. 
SELECT * FROM Supplier WHERE scity = 'Bombay' AND turnover = 5000000;
    
	-- 3. Get the total number of supplier. 
SELECT COUNT(*) AS Total_Supplier FROM Supplier; 
    
	-- 4. Get the part number weighing between 25 and 35. 
SELECT pcode FROM Part WHERE weigh BETWEEN 25 AND 35;    
    
	-- 5. Get the supplier number whose turnover is null.
SELECT scode FROM Supplier WHERE turnover = NULL;    
    
	-- 6. Get the part number that cost 20, 30 or 40 rupees.
SELECT pcode FROM Part WHERE cost = 20 OR cost = 30 OR cost = 40;   

	-- 7. Get the total quantity of part 2 that is supplied. 
SELECT SUM(qty) AS Total_Quantity FROM Supplier_Part WHERE pcode = 202;
    
    -- 8. Get the name of supplier who supply part 2.
SELECT DISTINCT s.sname FROM Supplier s JOIN Supplier_Part sp ON s.scode = sp.scode WHERE sp.pcode = 202;
    
    -- 9. Get the part number whose cost is greater than the average cost. 
SELECT pcode, cost FROM Part WHERE cost > (SELECT AVG(cost) FROM Part);
    
    -- 10. Get the supplier number and turnover in descending order of turnover.
SELECT scode, turnover FROM Supplier ORDER BY turnover DESC;