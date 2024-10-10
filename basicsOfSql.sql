SHOW databases;
CREATE DATABASE if not exists db;

-- currently kis database pe hai , ye pata karne ke liye 
SELECT database();

USE db;

CREATE TABLE employee(
	EmpID int PRIMARY KEY AUTO_INCREMENT,
	firstName varchar(10) NOT NULL, 
    lastName  varchar(10) NOT NULL,
    age       int NOT NULL,
    salary    int NOT NULL,
    location  varchar(10) NOT NULL
);

SHOW tables;

DESC employee;	

DROP TABLE employee;						

-- insert records
INSERT INTO employee VALUES (1,"Chirag","Patil",20,199000,"Indore");

INSERT INTO employee (firstName , lastName , age , salary , location) VALUES
("Virat", "Kholi" , 38 , 220000 , "Delhi") , 
("MS" , "Dhoni" , 43 , 340000 , "Ranchi"),
("Jasprit" , "Bumrah" , 30 , 153000 , "Chandigarh"),
("Maakhan","Gupta",27,12343,"Khilchipur");

INSERT INTO employee (lastName , age , salary) VALUES ("Negi" , 23 , 75483);

SELECT * FROM employee;

-- we are dropping (DROP is used to delete table)the table because we want to add constraints on table
-- NOT NULL : to avoid any null values in a specific columns
-- Primary Key : uniquely identified each record in a table , unique & not null
-- auto_increment : increment value of column by 1

SELECT 	EmpId , firstName , lastName , salary location from employee;

-- WHERE
-- order of execution : FROM -> WHERE -> SELECT   
SELECT firstName , lastName , salary from employee WHERE salary >= 200000;

-- QUESTION ?? can we use SELECT keyword without using FROM clause ?
-- yes , using dual table
-- dual table are dummy table created by mysql , which helps users to do perform certain obvious action without referring the user defined table
SELECT now() AS server_time; -- gives current time
SELECT ucase("chirag") AS uppercase_name;
SELECT lcase("HAHAHA") AS lowercase_name;
SELECT 10 + 10 * 10 / 10 AS maths;

-- BETWEEN
SELECT * FROM employee WHERE age BETWEEN 30 AND 40;

-- IN : to redude OR conditions
SELECT * FROM employee WHERE age IN(20,27,37);
SELECT * FROM employee WHERE age NOT IN(20,27,37);

-- sorting : ORDER BY, when we want data in sorted order 
-- by default ORDER BY uses AESC (ascending order)
-- order of execution : FROM -> SELCET -> ORDER BY
SELECT firstName , lastName , salary from employee ORDER BY salary;
SELECT firstName , lastName , salary from employee ORDER BY salary DESC;
SELECT firstName from employee ORDER BY firstName;

-- agar top 2 records dikhane hai then we use LIMIT
-- ex : select data of employee having top 2 salaries
SELECT firstName , lastName , salary from employee ORDER BY salary DESC LIMIT 2;
-- ex : select data of employee having highest salary
SELECT * from employee ORDER BY salary DESC LIMIT 1; 

