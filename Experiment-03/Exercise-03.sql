USE COMPANY;

-- TO off safe mode
SET SQL_SAFE_UPDATES = 0;

-- a. Find out the names of all the clients.
SELECT NAME FROM CLIENT_MASTER;

-- b. Retrieve the entire contents of the Client_Master table.
SELECT * FROM CLIENT_MASTER;

-- c. Retrieve the list of names,city and the state of all the clients.
SELECT NAME, CITY, STATE FROM CLIENT_MASTER;

-- d. List the various products available from the Product_Master table. 
SELECT DESCRIPTION FROM PRODUCT_MASTER;

-- e. List all the clients who are located in Mumbai.
SELECT NAME FROM CLIENT_MASTER WHERE CITY = "Mumbai"; 

-- f. Find the names of salesman who have a salary equal to Rs.3000. 
SELECT SALESMANNAME FROM SALESMAN_MASTER WHERE SALAMT = 3000; 


-- 1. Exercise on updating records in a table
   -- a. Change the city of ClientNo ‘C00005’ to ‘Bangalore’.
UPDATE CLIENT_MASTER SET CITY='Bangalore' WHERE CLIENTNO='C00005';
   
   -- b. Change the BalDue of ClientNo ‘C00001’ to Rs.1000.
UPDATE CLIENT_MASTER SET BALDUE=1000 WHERE CLIENTNO='C00001';   

   -- c. Change the cost price of ‘Trousers’ to rs.950.00.
UPDATE PRODUCT_MASTER SET SELLPRICE=950.00 WHERE DESCRIPTION='Trousers'; 
SELECT * FROM PRODUCT_MASTER;
   
   -- d. Change the city of the salesman to Pune.
UPDATE SALESMAN_MASTER SET CITY='Pune';
SELECT * FROM SALESMAN_MASTER;


/*
2. Exercise on deleting records in a table 
   a. Delete all salesman from the Salesman_Master whose salaries are equal to Rs.3500. 
*/
DELETE FROM SALESMAN_MASTER WHERE SALAMT=3500;


-- 3.  a. Delete all products from  Product_Master where the quantity on hand is equal to 100.
DELETE FROM PRODUCT_MASTER WHERE QTYONHAND=100;

-- 3.  b. Delete from Client_Master where the column state holds the value ‘Tamil Nadu’.
DELETE FROM CLIENT_MASTER WHERE STATE='Tamil Nadu';    

-- 4. Exercise on altering the table structure
   -- a. Add a column called ‘Telephone’ of data type integer to the Client_Master table.
ALTER TABLE CLIENT_MASTER ADD TELEPHONE INT;  
   -- b. Change the size of SellPrice column in Product_Master to 10, 2. 
ALTER TABLE PRODUCT_MASTER MODIFY SELLPRICE DECIMAL(10,2);


/*
5. Exercise on deleting the table structure along with the data
   a. Destroy the table Client_Master along with its data. 
*/
DROP TABLE CLIENT_MASTER;


/*
6. Exercise on renaming the table
   a. Change the name of the Salesman_Master to sman_mast.
*/
RENAME TABLE SALESMAN_MASTER TO sman_mast;