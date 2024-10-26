USE TEMP;
SHOW TABLES;

SELECT * FROM employee;
SELECT * FROM project;
SELECT * FROM client;	

-- sub queries : query inside query
-- subqueries are alternate methods to join , but slower than join
-- outerQuery(innerQuery) , outerQuery depends on innerQuery & innerQuery Executes first

-- employee whose age is greater than 30
SELECT * FROM employee WHERE age > 30;
SELECT * FROM employee WHERE age IN (SELECT age FROM employee WHERE age > 30);

-- emp details working in more than 1 project
SELECT * FROM employee WHERE id IN(SELECT empId FROM project GROUP BY empId HAVING COUNT(*) > 1);

-- select details of employee having age more than avergae age of all employee
SELECT * FROM employee WHERE age > (SELECT AVG(age) FROM employee);

-- select max age person first name has'a'
SELECT max(age) FROM (SELECT * FROM employee WHERE fname LIKE '%a%') AS temp;

-- VIEWS , are the way by which a single database or a table can be viewed differently to different user
SELECT * FROM employee;
CREATE VIEW emp_view AS SELECT fname,lname,age,city FROM employee;
SELECT * FROM emp_view;

-- altering a view
ALTER VIEW emp_view AS SELECT id,fname,lname,city FROM employee;

-- droping a view
DROP VIEW IF EXISTS emp_view;

-- create an empty table with same structure as another table
CREATE TABLE employee_copy AS (SELECT * from employee WHERE 1 = 2);
DESC employee_copy;
SELECT * FROM employee_copy;