-- Creating Database
CREATE DATABASE employee;

--Deleting employee table if exists
DROP TABLE IF EXISTS employee;

--Creating employee table
CREATE TABLE employee(
    employee_id INT PRIMARY KEY,
	first_name VARCHAR (50) NOT NULL,
	last_name VARCHAR (50) NOT NULL,
	email VARCHAR (50),
	department VARCHAR (50),
	salary NUMERIC (10,2),
	joining_date DATE,
	age INT
);


-- Importing csv data in employee table 
COPY employee (employee_id, first_name, last_name, email, department,salary, joining_date, age)
FROM 'C:\SQL\SQL operators\employee_data.csv'
DELIMITER ','
CSV HEADER;





SELECT * FROM employee;




--Retrive the first_name,salary, and 10% bonus on the salary
SELECT first_name, salary,
(salary*0.10) AS bonus
FROM employee;


--Calculate annual salary and 5% increment salary and show new salary also 
SELECT first_name, last_name, salary,
(salary*12) AS annual_salary,
(salary*0.05) AS increment_salary,
(salary*1.05) AS new_salary,
(salary+salary*0.05) AS new_salary2
	FROM employee;


SELECT * FROM employee;


--Matche all except age 40
SELECT * FROM employee
WHERE age != 40;

-- salary is greater than 50000
SELECT * FROM employee
WHERE salary>50000;


--Find a specific person's whose age is more than 50 AND salary is also more than 50000 
SELECT * FROM employee
WHERE age > 50 AND salary > 50000;


--find those person whose age is 50 OR their salary is equal or more than 50000
SELECT * FROM employee
WHERE age = 50 OR salary >= 50000;


--find those person whose age is 50 OR their salary is equal to 50000
SELECT * FROM employee
WHERE age = 50 OR salary = 50000;


--find those peron who is NOT from the 'IT' department
SELECT * FROM employee
WHERE NOT (department='IT')

--Retrive employees whose salary is BETWEEN 40000 to 60000
SELECT * FROM employee
WHERE salary BETWEEN 40000 AND 60000;

--Retrive employee whose age is 50 AND salary is BETWEEN 40000 to 60000
SELECT * FROM employee
WHERE age = 50 AND salary BETWEEN 40000 AND 60000

--Find employee whose email end with gmail.com use LIKE operator
SELECT * FROM employee
WHERE email LIKE ('%gmail.com');


--find employee whose last_name start with Ram use LIKE operator  
SELECT * FROM employee
WHERE last_name LIKE ('Ram%');


--Retrive employee who belong to financial either marketing department Use IN operator
SELECT * FROM employee
WHERE department IN ('Finance', 'Marketing');


--Find employee where email column IS NULL (if applicable)  IS NULL Operator
SELECT * FROM employee
WHERE email IS NULL;


--List employees sorted by salary in Descending order  ORDER BY OPERATOR 
SELECT * FROM employee
ORDER BY salary DESC;


--Retreive the top 5 highest paid employee  LIMIT Operator
SELECT * FROM employee
ORDER BY salary DESC
LIMIT 5;


-- Retrieve a list of unique departments   DISTINCT Operator
SELECT DISTINCT department
FROM employee;










