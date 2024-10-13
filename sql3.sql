USE temp;
SELECT database();
SHOW tables;

-- constraints : are rules defined on the columns
-- 1. NOT NULL : column should not cont ain NULL VALUES
-- 2. UNIQUE : column should have unique values
-- 3. CHECK : it is a consistency contraint
-- 4. DEFAULT : if value is not assigned then default value will be given
-- 5. Primary Key : which is used to uniquely identify each record / row in a table , NOT NULL , UNIQUE , only one Pk in a table
-- 6. Foreign Key : refers to primary key of another table , it is used to maitain integrity
-- 7. AUTO_INCREMENT : it automatically increases the value by 1 of the assigned column

CREATE TABLE bank_account(
	id int primary KEY auto_increment,
    name varchar(15) NOT NULL,
    address varchar(50) UNIQUE,
    age int DEFAULT 18,
    balance int,
    CONSTRAINT account_balance CHECK(balance > 1000)
);
	
DESC bank_account;

-- INSERT is an DML command used to insert records into a table
INSERT INTO bank_account (name , address , balance)  VALUES 
('A' , 'airport road' , 3453);
INSERT INTO bank_account (name , address , balance)  VALUES 
('B' , 'MG road delhi' , 3453);
INSERT INTO bank_account (name , address , balance)  VALUES 
('A' , 'saket nagar' , 3453);
INSERT INTO bank_account (name , address , balance)  VALUES 
('A' , 'chickpokli' , 3453);

-- violating the check constraint rule
INSERT INTO bank_account (name , address , balance)  VALUES 
('A' , 'hathi pole' , 45);


SELECT * from bank_account;


-- ALTER is used to change the structure of schema
-- ALTER is a DDL command
-- it is used to add new column , modify the column data type , rename the column , delete a column or rename table name

-- add new column
ALTER TABLE bank_account ADD interst float NOT NULL DEFAULT 0;

-- change the column name
ALTER TABLE bank_account CHANGE interst account_interest DOUBLE NOT NULL DEFAULT 0;

-- modify the column data type
ALTER TABLE bank_account MODIFY address VARCHAR(25);

-- drop column is used to delete column
ALTER TABLE bank_account DROP age;

-- change the table name
ALTER TABLE bank_account RENAME TO account_details;
ALTER TABLE account_details RENAME TO bank_account;






-- DML : data manupulation language
-- UPDATE is used to update the existing data
UPDATE bank_account SET name = 'Shrevanya' WHERE id = 1;
SET SQL_SAFE_UPDATES = 0; -- deactivate the safe mode 
SET SQL_SAFE_UPDATES = 1;
UPDATE bank_account SET balance = 2700000 WHERE id =1 ;
UPDATE bank_account SET name = 'Chirag' , balance = 9900000 WHERE id = 5;
UPDATE bank_account SET name = 'Rounak' WHERE id = 4;

-- DELETE is used to delete one or more row
DELETE FROM bank_account WHERE id = 6;
DELETE FROM bank_account; -- it will delete whole table , but structure of table remains

-- REPLACE
-- if the data already exists , it will replace the data , else it will insert the data
REPLACE INTO bank_account (id , name , address , balance) VALUES (1 , 'Ramesh' , 'Sangam Nagar' , 157345); -- alreadt id 1 ke liye data toh isne replace kardiya
REPLACE INTO bank_account (id , name , address , balance , account_interest) VALUES (3 , 'Nikhil' , 'Shivaji Nagar' , 8700000 , 100);