SHOW databases;
CREATE DATABASE if not exists db;

-- currently kis database pe hai , ye pata karne ke liye 
SELECT database();

USE db;

CREATE TABLE employee(
	firstName varchar(10) , 
    lastName  varchar(10),
    age       int,
    salary    int,
    location  varchar(10)
);

DESC employee;

SHOW tables;

