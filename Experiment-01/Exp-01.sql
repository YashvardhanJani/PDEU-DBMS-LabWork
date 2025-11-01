/*
TITLE: Dataset Creation and Updating using File Handling Program. 
Objective: How to store and retrieve dataset in table format using file handling programming.
Aim: To create and update a dataset using a file handling program and import it into MySQL database.
Theory: File handling allows us to read and write data into files. We can use Python/Java/C/C++ to create and update text or CSV files, which can then be imported into a MySQL table using the `LOAD DATA INFILE` command.
*/

USE bank;

LOAD DATA INFILE 'basicinfo.csv'
INTO TABLE basicinfo
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

SELECT * FROM basicinfo;

/*
Output: The expected output confirms successful execution of SQL commands and matches the theoretical concept.
Result: Successfully executed as per the aim of the experiment.
*/