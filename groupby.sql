-- grouping of data : GROUP BY
-- grouping is used to perform aggregation
-- GROUP BY is used with AGGREGATION FUNCTION like COUNT , MAX , MIN , AVG , SUM
-- by deafault : GROUP BY is treated as DISTINCT
SELECT department FROM worker GROUP BY department;

-- find number of workers in different department 
SELECT COUNT(department) as total_worker , department FROM worker GROUP BY department;

-- find average salary per department
SELECT AVG(salary) as avg_salary , department FROM worker GROUP BY department;

-- min salary per department
SELECT MIN(salary) as min_salary , department FROM worker GROUP BY department;

-- total salry per department
SELECT SUM(salary) as total_salary , department FROM worker GROUP BY department;



-- HAVING is used with GROUP BY for filtering
-- department , count of workers where more than 2 workers
SELECT count(department) as count , department FROM worker GROUP BY department HAVING count(department) > 2;

-- find department where sum of salary is greater than 100000
SELECT SUM(salary) as total_salary , department FROM worker GROUP BY department HAVING SUM(salary) > 500000;


-- find the sum of salary of each department from table employee also arrange the result in ascending orderto department
SELECT department , SUM(salary) FROM employee
GROUP BY department
ORDER BY department ASC;

-- find the sum salary of each department from employee where sum of salary is more than 17000
SELECT department , SUM(salary) FROM employee
GROUP BY department 
HAVING SUM(salary) > 17000;

-- -- find the sum salary of each department excepet Admin from employee where sum of salary is more than 17000
SELECT department , SUM(salary) FROM employee
WHERE department != 'ADMIN' 
GROUP BY department
HAVING SUM(salary) > 17000;


-- find the number of student studying same subject in same semester
SELECT subject , semester , COUNT(*) FROM student
GROUP BY subject , semester;
