SELECT database();
USE temp;
SHOW TABLES;

CREATE TABLE employeeNew (
	EID int primary key,
    first_name varchar(15),
    last_name varchar(15),
    age int ,
    salary int,
    location varchar(15)
);
DESC employeeNew;

INSERT INTO employeeNew (EID , first_name , last_name , age , salary , location) VALUES 
(1,'Priya','Bhatt',27,200000,'Bengaluru'),
(2,'Akhil','George',26,100000,'Gurugram'),
(3,'Kaneesha','Brownlee',27,300000,'London'),
(4,'Naga','Sai',30,150000,'Bengaluru'),
(5,'Prabhuvta','Kakkar',35,70000,'Noida'),
(6,'Yashaswi','Gandhak',29,90000,'Delhi'),
(7,'Jeevan','Hegde',27,200000,'Noida'),
(8,'Sidish','Kumar',25,200000,'Bengaluru')
;
SELECT * FROM employeeNew;

-- ex : we have to display count and average salaries of different location 
SELECT location , COUNT(*) as count , AVG(salary) FROM employeeNew
GROUP BY location;

-- ex : we have to display count , average salaries of different location , but we also have to display first_name , last_name 
-- in this case GROUP BY cannot be used bcos aggregate functions are used with group by

-- WINDOW FUNCTIONS : 
-- PARTITION BY
-- in this scenarios partition by is used , its working is similar to group by , but only difference is it can be used to diaplay non-aggregare columns
SELECT first_name , last_name , location ,
COUNT(location) OVER (partition by location) as count_emp,
AVG(salary) OVER (partition by location) as avg_salary 
FROM employeeNew;


-- ROW_NUMBER() 
-- it is used to map values with numbers , order by is used with row_number
-- it will give different priority to the all employee , means employee having same salary will also get different priority
-- if 2 employee has same salary , then the employee which comes first(inserted first) will get higher priority
-- ex : suppose we want to give priority to the employee on the basis of their salary , means higher salary employee gets higher salary
SELECT first_name , last_name , salary , 
ROW_NUMBER() OVER (ORDER BY salary DESC) as priority_no
FROM employeeNew; 
 

-- RANK()  , it will overcome the limitation of ROW_NUMBER()
-- if we want that if 2 ore more employee has same salary , then their priority should also be same
-- but rank() will skip some priority or rank
SELECT first_name , last_name , salary , 
RANK() OVER (ORDER BY salary DESC) as priority_no 
FROM employeeNew;


-- DENSE_RANK() , it will overcome the limitation of RANK()
-- it will not skip any rank value or priority , and will give same priority/ rank to employee having same salary
SELECT first_name , last_name , salary ,
DENSE_RANK() OVER (ORDER BY salary DESC) as priority_no
FROM employeeNew;

-- very important interview question : difference between ROW_NUMBER() , ROW() , DENSE_RANK()

-- second highest salary
-- method 1 : using sub query
SELECT MAX(salary) as salary FROM employeeNew
WHERE salary < (SELECT MAX(salary) FROM employeeNew);

-- method 2 : using DENSE_RANK()
SELECT * FROM
(SELECT first_name , last_name , salary , DENSE_RANK() OVER (ORDER BY salary DESC) as priority_no FROM employeeNew) as temp
WHERE priority_no = 2;

-- question : specify the detailes of highest salary people in each location
SELECT * FROM 
(SELECT first_name , last_name , salary , location , 
ROW_NUMBER() OVER (partition by location ORDER BY salary DESC) as priority_no
FROM employeeNew) AS temp
WHERE priority_no = 1;