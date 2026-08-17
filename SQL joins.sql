

--- creating database

CREATE DATABASE employee1



--- creating employee table

CREATE TABLE employee(
	employee_id INT PRIMARY KEY,
	first_name VARCHAR (20) NOT NULL,
	last_name VARCHAR (20) NOT NULL,
	department_id INT
	
);

---Inserting values into employee table

INSERT INTO employee (employee_id, first_name, last_name, department_id)
	VALUES (1, 'Rahul', 'Sharma',101),
	       (2, 'Priya', 'Mehta', 102),
		   (3, 'Ankit', 'Verma',103),
		   (4, 'Simran', 'Kaur', NULL),
		   (5, 'Aman', 'Singh', 101);





--- creating another table named department

CREATE TABLE department (
	department_id INT,
	department_name VARCHAR (20)


);


--- inserting values into department table

INSERT INTO department (department_id, department_name)
	VALUES (101,'sales'),
	       (102,'Marketing'),
		   (103,'IT'),
		   (104,'HR');



SELECT * FROM employee;


SELECT * FROM department;



--- Join employee and department table by INNER JOIN ----- INNER JOIN

SELECT e.employee_id, e.first_name, e.last_name,
d.department_id, d.department_name
FROM employee e
INNER JOIN
department d
ON e.department_id = d.department_id  ORDER BY employee_id ASC;




--- Join employee and department table by LEFT JOIN ----- LEFT JOIN

SELECT e.employee_id, e.first_name, e.last_name,
d.department_id, d.department_name
FROM employee e
LEFT JOIN
department d
ON e.department_id = d.department_id  ORDER BY employee_id ASC;






--- Join employee and department table by RIGHT JOIN ----- RIGHT JOIN

SELECT e.employee_id, e.first_name, e.last_name,
d.department_id, d.department_name
FROM employee e
RIGHT JOIN
department d
ON e.department_id = d.department_id  ORDER BY employee_id ASC;




--- Join employee and department table by FULL JOIN ----- FULL JOIN

SELECT e.employee_id, e.first_name, e.last_name,
d.department_id, d.department_name
FROM employee e
FULL JOIN
department d
ON e.department_id = d.department_id  ORDER BY employee_id ASC;





--- Retrivr all possible combinations of employee and department table ----- CROSS JOIN

SELECT e.employee_id, e.first_name, e.last_name,
d.department_id, d.department_name
FROM employee e
CROSS JOIN
department d;



---Find employee who share the samr department ------ SELF JOIN

SELECT e1.first_name AS employee_name1,
       e2.first_name AS employee_name2,
	   d.*
FROM employee e1 JOIN employee e2 
ON e1.department_id=e2.department_id AND e1.employee_id <> e2.employee_id
JOIN
department d
ON
e1.department_id=d.department_id;












