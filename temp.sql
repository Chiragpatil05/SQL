-- this table is for experimental purpose , solve questions , do changes and all
SELECT database();
CREATE TABLE PERSON(
	person_id int ,
    fullName varchar(50) NOT null
);
DESC PERSON;

INSERT INTO PERSON(person_id,fullName) VALUES
(1,'Chirag Patil'),
(2,'Virat Sharma'),
(3,'Peter Jasiwal'),
(4,'Harry Jain'),
(5,'Yashwant Bankwala');

INSERT INTO PERSON(person_id,fullName) VALUES (1,'Virat Sharma') , (4,'Harry Jain') , (5,'Yashwant Bankwala');

SELECT * FROM PERSON;

-- fetch first name from full name column
SELECT SUBSTRING(fullName , 0 , CHARINDEX(' ' , fullName)) FROM PERSON;

-- fetch the duplicate records
SELECT person_id,fullName FROM PERSON GROUP BY person_id , fullName HAVING COUNT(*) > 1;

-- delete duplicate records
DELETE FROM PERSON WHERE person_id IN (SELECT person_id FROM PERSON GROUP BY person_id , fullName HAVING COUNT(*) > 1);
