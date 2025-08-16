-- Create the tables

CREATE DATABASE company;
USE company;

CREATE TABLE CLIENT_MASTER (
	CLIENTNO VARCHAR(6),
    NAME VARCHAR(20),
    ADDRESS1 VARCHAR(30), 
    ADDRESS2 VARCHAR(30),
    CITY VARCHAR(15),
    PINCODE INT,
    STATE VARCHAR(15),
    BALDUE DECIMAL(10,2)
);

CREATE TABLE PRODUCT_MASTER (
	PRODUCTNO VARCHAR(6),
    DESCRIPTION  VARCHAR(15),
    PROFITPERCENT DECIMAL(4,2),
    UNIT_MEASURE VARCHAR(10),
    QTYONHAND INT,
    REORDERL_VL INT, 
    SELLPRICE DECIMAL(8,2),
    COSTPRICE DECIMAL(8,2)
);

CREATE TABLE SALESMAN_MASTER (
	SALESMANNO VARCHAR(6),
    SALESMANNAME VARCHAR(20),
    ADDRESS1 VARCHAR(30), 
    ADDRESS2 VARCHAR(30),
    CITY VARCHAR(20),
    PINCODE INT,
    STATE VARCHAR(20),
    SALAMT Real,
    TGTTOGET DECIMAL,
    YTDSALES DOUBLE(6,2),
    REMARKS VARCHAR(60)
);

INSERT INTO CLIENT_MASTER (CLIENTNO,NAME,CITY,PINCODE,STATE,BALDUE) VALUES
('C00001', 'Ivan Bayross', 'Mumbai', 400054, 'Maharashtra', 15000),
('C00002', 'Mamta Muzumdar', 'Madras', 780001, 'Tamil Nadu', 0),
('C00003', 'Chhaya Bankar', 'Mumbai', 400057, 'Maharashtra', 5000),
('C00004', 'Ashwini Joshi', 'Bangalore', 560001, 'Karnataka', 0),
('C00005', 'Hansel Colaco', 'Mumbai', 400060, 'Maharashtra', 2000),
('C00006', 'Deepak Sharma', 'Mangalore', 560050, 'Karnataka', 0);

INSERT INTO PRODUCT_MASTER 
(ProductNo, Description, ProfitPercent, Unit_Measure, QtyOnHand, ReorderL_vl, SellPrice, CostPrice) VALUES
('P00001', 'T-Shirt', 5, 'Piece', 200, 50, 350, 250),
('P0345', 'Shirts', 6, 'Piece', 150, 50, 500, 350),
('P06734', 'Cotton jeans', 5, 'Piece', 100, 20, 600, 450),
('P07865', 'Jeans', 5, 'Piece', 100, 20, 750, 500),
('P07868', 'Trousers', 2, 'Piece', 150, 50, 850, 550),
('P07885', 'Pull Overs', 2.5, 'Piece', 80, 30, 700, 450),
('P07965', 'Denim jeans', 4, 'Piece', 100, 40, 350, 250),
('P07975', 'Lycra tops', 5, 'Piece', 70, 30, 300, 175),
('P08865', 'Skirts', 5, 'Piece', 75, 30, 450, 300);

INSERT INTO SALESMAN_MASTER 
(SalesmanNo, SalesmanName, Address1, Address2, City, PinCode, State, SalAmt, TgtToGet, YtdSales, Remarks) VALUES
('S00001', 'Aman', 'A/14', 'Worli', 'Mumbai', 400002, 'Maharashtra', 3000, 100, 50, 'Good'),
('S00002', 'Omkar', '65', 'Nariman', 'Mumbai', 400001, 'Maharashtra', 3000, 200, 100, 'Good'),
('S00003', 'Raj', 'P-7', 'Bandra', 'Mumbai', 400032, 'Maharashtra', 3000, 200, 100, 'Good'),
('S00004', 'Ashish', 'A/5', 'Juhu', 'Mumbai', 400044, 'Maharashtra', 3500, 200, 150, 'Good');


SELECT * FROM CLIENT_MASTER;
SELECT * FROM PRODUCT_MASTER;
SELECT * FROM SALESMAN_MASTER;