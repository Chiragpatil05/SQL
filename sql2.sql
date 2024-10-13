SELECT database();
USE db;
SHOW tables;
SELECT * from employee;

-- INSERT
INSERT INTO employee (firstName , lastName , age , salary , location) VALUES 
("Raj","Shamani",29,15000,"Banglore"),
("Alakah","Pandey",37,25436,"Prayagraj"),
("Ram","Yadav",21,1200,"Bhopal");

INSERT INTO employee (firstName , lastName , age , salary , location) VALUES
("Raj","Sharma",33,26000,"Vadodara");

-- UPDATE : is used to change the relational data of the table
UPDATE employee SET firstName = "Akshansh" WHERE EmpId = 5;
-- saare rows ko agar update karne jayenge toh sql update nhi karne dega due to safety reasons
-- so we have deactivate the safe mode , so that we can update the values
SET SQL_SAFE_UPDATES = 0; -- deactivate
SET SQL_SAFE_UPDATES = 1; -- activate
UPDATE employee SET salary = 927403 WHERE firstName = "Chirag";

-- DELETE : is used to remove records from the table
DELETE FROM employee WHERE EmpId = 8;
DELETE FROM employee; -- it will delete all records  

DESC employee;

-- ALTER: is used to change the schema of the table
-- using alter , we can add new column , modify the datatype of a column , rename column name , change table name , drop column
ALTER TABLE employee MODIFY  firstName varchar(15);
ALTER TABLE employee ADD position varchar(20) ;
 
UPDATE employee SET position = "Founder" WHERE firstName = "Chirag";
UPDATE employee SET position = "Podacaster" WHERE firstName = "Raj" AND lastname = "Shamani";
UPDATE employee SET position = "HR" where EmpID = 7;

SELECT * FROM employee ORDER BY position ;
SELECT salary from employee ORDER BY salary;

-- select distinct position of the employee
SELECT DISTINCT position  from employee;

-- AGGREGATION functions : 
-- count total employee works in the company
SELECT COUNT(EmpId) as total_Employee from employee;

-- what is the highest or maximum salary of an employee
SELECT MAX(salary) as maximum_salary from employee ;

-- what is the minimum salary of an employee
SELECT MIN(salary) as minimum_salary from employee;

-- what is the average salary of the employee
SELECT AVG(salary) as avg_salary from employee;

-- total sum of salary
SELECT SUM(salary) as total_salary from employee;

-- find the employee having highest salary
SELECT EmpID , firstName , lastName , salary from employee ORDER BY salary DESC LIMIT 1;
