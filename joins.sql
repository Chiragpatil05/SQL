-- JOINS --
SELECT database();
USE temp;
SHOW tables;

-- employee table 
CREATE TABLE employee (
	id int primary key auto_increment,
    fname varchar(15) not null,
    lname varchar(15) not null,
    age int,
    emailId varchar(20) not null,
    phoneNo int,
    city varchar(15)
);

INSERT INTO employee (id,fname,lname,age,emailId,phoneNo,city) VALUES 
(1,'Aman','Proto',32,'aman@gmail.com',898,'Delhi'),
(2,'Yagya','Narayan',44,'yagya@gmail.com',222,'Palam'),
(3,'Rahul','BD',22,'rahul@gmail',444,'Kolkata'),
(4,'Jatin','Hermit',31,'jatin@gmail.com',666,'Raipur'),
(5,'PK','Pandey',21,'pk@gmail.com',555,'Jaipur');

SELECT * FROM employee;

-- client table
CREATE TABLE client(
	id int primary key,
    first_name varchar(20),
    last_name varchar(20),
    age int,
    emailId varchar(15),
    phoneNo int,
    city varchar(15),
    empId int,
    foreign key(empId) references employee(id) on delete cascade
);

ALTER TABLE client MODIFY emailId varchar(30);

INSERT INTO client (id,first_name,last_name,age,emailId,phoneNo,city,empId) VALUES
(1,'Mac','Rogers',47,'mac@hotmail.com',333,'Kolkata',3),
(2,'Max','Poirier',27,'max@gmail.com',222,'Kolkata',3),
(3,'Peter','Jain',24,'peter@abc.com',111,'Delhi',1),
(4,'Sushant','Aggarwal',23,'sushant@yahoo.com',45454,'Hydrabad',5),
(5,'Pratap','Singh',47,'p@xyz.com',77767,'Mumbai',2);

SELECT * from client;

-- project table
CREATE TABLE project (
	id int primary key,
    empId int,
    name varchar(5),
    startdate timestamp,
    clientId int,
    foreign key (empId) references employee(id) on delete cascade,
    foreign key (clientId) references client(id) on delete cascade
);

INSERT INTO project (id,empId,name,startdate,clientId) VALUES
(1,1,'A','2021-04-21',3),
(2,2,'B','2021-03-12',1),
(3,3,'C','2021-01-16',5),
(4,3,'D','2021-04-27',2),
(5,5,'E','2021-05-01',4);

SELECT * from project;

-- INNER JOIN
-- elist all the employee ids , names along with their project allocated to them
SELECT e.id,e.fname,e.lname,p.id,p.name FROM employee as e
INNER JOIN project as p 
ON e.id = p.empId;

-- fetch out all the employee ids and their contact details who have been working from jaipur with the clients name working in hydrabad
SELECT e.id,e.emailId,e.phoneNo,c.first_name,c.last_name FROM employee as e 
INNER JOIN client as c ON e.id = c.empId
WHERE e.city = 'Jaipur' AND c.city = 'Hydrabad';


-- LEFT JOIN
-- fetch out each project allocated to each employee
SELECT e.id,e.fname,e.lname,p.id,p.name FROM employee as e
LEFT JOIN project as p
ON e.id = p.empId;


-- RIGHT JOIN
-- list out all the projects along with the employee name and thier respective email id
SELECT e.fname,e.lname,e.emailId,p.id,p.name FROM employee as e
RIGHT JOIN project as p 
ON e.id = p.empId;


-- CROSS JOIN : cartesian product
-- list out all the combinations for employee name and projects that can exist
SELECT e.id,e.fname,e.lname,p.id,p.name FROM employee as e
CROSS JOIN project as p;


-- QUESTION. can we use JOIN without using join keyword
-- YES , select * from left_table , right_table WHERE left_table.id = right_table.id;