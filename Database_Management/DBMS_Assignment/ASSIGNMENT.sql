DROP DATABASE IF EXISTS assignment;
CREATE DATABASE assignment;
USE assignment;



CREATE TABLE customer (
    customer_id INT PRIMARY KEY,
    cust_name VARCHAR(50),
    city VARCHAR(50),
    grade INT,
    salesman_id INT
);

CREATE TABLE salesman (
    salesman_id INT PRIMARY KEY,
    name VARCHAR(50),
    city VARCHAR(50),
    commission DECIMAL(4,2)
);

CREATE TABLE orders (
    ord_no INT PRIMARY KEY,
    purch_amt DECIMAL(10,2),
    ord_date DATE,
    customer_id INT,
    salesman_id INT
);

CREATE TABLE emp_details (
    emp_idno INT PRIMARY KEY,
    emp_fname VARCHAR(50),
    emp_lname VARCHAR(50),
    emp_dept INT
);

CREATE TABLE item_mast (
    pro_id INT PRIMARY KEY,
    pro_name VARCHAR(100),
    pro_price DECIMAL(10,2),
    pro_com INT
);

INSERT INTO salesman VALUES
(5001,'James Hoog','New York',0.15),
(5002,'Nail Knite','Paris',0.13),
(5005,'Pit Alex','London',0.11),
(5006,'Mc Lyon','Paris',0.14),
(5007,'Paul Adam','Rome',0.13),
(5003,'Lauson Hen','San Jose',0.12);

INSERT INTO customer VALUES
(3002,'Nick Rimando','New York',100,5001),
(3007,'Brad Davis','New York',200,5001),
(3005,'Graham Zusi','California',200,5002),
(3008,'Julian Green','London',300,5002),
(3004,'Fabian Johnson','Paris',300,5006),
(3009,'Geoff Cameron','Berlin',100,5003),
(3003,'Jozy Altidor','Moscow',200,5007),
(3001,'Brad Guzan','London',NULL,5005);

INSERT INTO orders VALUES
(70001,150.50,'2012-10-05',3005,5002),
(70009,270.65,'2012-09-10',3001,5005),
(70002,65.26,'2012-10-05',3002,5001),
(70004,110.50,'2012-08-17',3009,5003),
(70007,948.50,'2012-09-10',3005,5002),
(70005,2400.60,'2012-07-27',3007,5001),
(70008,5760.00,'2012-09-10',3002,5001),
(70010,1983.43,'2012-10-10',3004,5006),
(70003,2480.40,'2012-10-10',3009,5003),
(70012,250.45,'2012-06-27',3008,5002),
(70011,75.29,'2012-08-17',3003,5007),
(70013,3045.60,'2012-04-25',3002,5001);

INSERT INTO emp_details VALUES
(127323,'Michale','Robbin',57),
(526689,'Carlos','Snares',63),
(843795,'Enric','Dosio',57),
(328717,'Jhon','Snares',63),
(444527,'Joseph','Dosni',47),
(659831,'Zanifer','Emily',47),
(847674,'Kuleswar','Sitaraman',57),
(748681,'Henrey','Gabriel',47),
(555935,'Alex','Manuel',57),
(539569,'George','Mardy',27),
(733843,'Mario','Saule',63),
(631548,'Alan','Snappy',27),
(839139,'Maria','Foster',57);

INSERT INTO item_mast VALUES
(101,'Motherboard',3200.00,15),
(102,'Keyboard',450.00,16),
(103,'ZIP drive',250.00,14),
(104,'Speaker',550.00,16),
(105,'Monitor',5000.00,11),
(106,'DVD drive',900.00,12),
(107,'CD drive',800.00,12),
(108,'Printer',2600.00,13),
(109,'Refill cartridge',350.00,13),
(110,'Mouse',250.00,12);





CREATE TABLE regions (
    region_id INT PRIMARY KEY,
    region_name VARCHAR(25)
);

CREATE TABLE countries (
    country_id CHAR(2) PRIMARY KEY,
    country_name VARCHAR(40),
    region_id INT
);

CREATE TABLE locations (
    location_id INT PRIMARY KEY,
    street_address VARCHAR(40),
    postal_code VARCHAR(12),
    city VARCHAR(30),
    state_province VARCHAR(25),
    country_id CHAR(2)
);

CREATE TABLE jobs (
    job_id VARCHAR(10) PRIMARY KEY,
    job_title VARCHAR(35),
    min_salary INT,
    max_salary INT
);

CREATE TABLE departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(30),
    manager_id INT,
    location_id INT
);

CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    first_name VARCHAR(20),
    last_name VARCHAR(25),
    email VARCHAR(25),
    phone_number VARCHAR(20),
    hire_date DATE,
    job_id VARCHAR(10),
    salary DECIMAL(8,2),
    commission_pct DECIMAL(2,2),
    manager_id INT,
    department_id INT
);

CREATE TABLE job_history (
    employee_id INT,
    start_date DATE,
    end_date DATE,
    job_id VARCHAR(10),
    department_id INT,
    PRIMARY KEY (employee_id, start_date)
);




INSERT INTO regions VALUES
(1,'Europe'),
(2,'Americas'),
(3,'Asia'),
(4,'Middle East and Africa');




INSERT INTO countries VALUES
('US','United States of America',2),
('UK','United Kingdom',1),
('CA','Canada',2),
('IN','India',3),
('DE','Germany',1);




INSERT INTO locations VALUES
(1000,'2014 Jabberwocky Rd','26192','Southlake','Texas','US'),
(1100,'2011 Interiors Blvd','99236','South San Francisco','California','US'),
(1200,'6092 Boxwood St','1689','Toronto','Ontario','CA'),
(1300,'40-5-12 MG Road','560001','Bangalore','Karnataka','IN'),
(1400,'Unter den Linden','10117','Berlin','Berlin','DE');



INSERT INTO jobs VALUES
('AD_PRES','President',20000,40000),
('AD_VP','Administration Vice President',15000,30000),
('IT_PROG','Programmer',4000,10000),
('MK_MAN','Marketing Manager',9000,15000),
('FI_MGR','Finance Manager',8200,16000),
('SA_REP','Sales Representative',6000,12000);



INSERT INTO departments VALUES
(10,'Administration',NULL,1000),
(20,'Marketing',NULL,1100),
(40,'Human Resources',NULL,1200),
(60,'IT',NULL,1300),
(80,'Sales',NULL,1400),
(100,'Finance',NULL,1200);


INSERT INTO employees VALUES
(100,'Steven','King','SKING','515.123.4567','1987-06-17','AD_PRES',24000,NULL,NULL,10),
(101,'Neena','Kochhar','NKOCHHAR','515.123.4568','1989-09-21','AD_VP',17000,NULL,100,10),
(102,'Lex','De Haan','LDEHAAN','515.123.4569','1993-01-13','AD_VP',17000,NULL,100,10),
(103,'Alexander','Hunold','AHUNOLD','590.423.4567','1990-01-03','IT_PROG',9000,NULL,102,60),
(104,'Bruce','Ernst','BERNST','590.423.4568','1991-05-21','IT_PROG',6000,NULL,103,60),
(108,'Nancy','Greenberg','NGREENBE','515.124.4569','1994-08-17','FI_MGR',12000,NULL,101,100),
(201,'Michael','Hartstein','MHARTSTE','011.44.1346','1996-02-17','MK_MAN',13000,NULL,100,20),
(145,'John','Russell','JRUSSEL','011.44.1344','1996-10-01','SA_REP',14000,0.40,100,80),
(146,'Karen','Partners','KPARTNER','011.44.1345','1997-01-05','SA_REP',13500,0.30,145,80);



UPDATE departments SET manager_id = 100 WHERE department_id = 10;
UPDATE departments SET manager_id = 201 WHERE department_id = 20;
UPDATE departments SET manager_id = 103 WHERE department_id = 60;
UPDATE departments SET manager_id = 145 WHERE department_id = 80;
UPDATE departments SET manager_id = 108 WHERE department_id = 100;




INSERT INTO job_history VALUES
(102,'1993-01-13','1998-07-24','IT_PROG',60),
(101,'1989-09-21','1993-10-27','SA_REP',80),
(201,'1996-02-17','1999-12-19','SA_REP',80);




SET FOREIGN_KEY_CHECKS = 0;

ALTER TABLE countries
ADD CONSTRAINT fk_countries_regions
FOREIGN KEY (region_id) REFERENCES regions(region_id);

ALTER TABLE locations
ADD CONSTRAINT fk_locations_countries
FOREIGN KEY (country_id) REFERENCES countries(country_id);

ALTER TABLE departments
ADD CONSTRAINT fk_departments_locations
FOREIGN KEY (location_id) REFERENCES locations(location_id);

ALTER TABLE employees
ADD CONSTRAINT fk_employees_jobs
FOREIGN KEY (job_id) REFERENCES jobs(job_id);

ALTER TABLE employees
ADD CONSTRAINT fk_employees_departments
FOREIGN KEY (department_id) REFERENCES departments(department_id);

ALTER TABLE employees
ADD CONSTRAINT fk_employees_manager
FOREIGN KEY (manager_id) REFERENCES employees(employee_id);

ALTER TABLE departments
ADD CONSTRAINT fk_departments_manager
FOREIGN KEY (manager_id) REFERENCES employees(employee_id);

ALTER TABLE job_history
ADD CONSTRAINT fk_jh_emp
FOREIGN KEY (employee_id) REFERENCES employees(employee_id);

ALTER TABLE job_history
ADD CONSTRAINT fk_jh_job
FOREIGN KEY (job_id) REFERENCES jobs(job_id);

ALTER TABLE job_history
ADD CONSTRAINT fk_jh_dept
FOREIGN KEY (department_id) REFERENCES departments(department_id);

SET FOREIGN_KEY_CHECKS = 1;



ALTER TABLE customer
ADD CONSTRAINT fk_customer_salesman
FOREIGN KEY (salesman_id) REFERENCES salesman(salesman_id);

ALTER TABLE orders
ADD CONSTRAINT fk_orders_customer
FOREIGN KEY (customer_id) REFERENCES customer(customer_id);

ALTER TABLE orders
ADD CONSTRAINT fk_orders_salesman
FOREIGN KEY (salesman_id) REFERENCES salesman(salesman_id);





/* 1. write a SQL query to find customers who are either from the city 'New York' or who do not have a grade greater than 100.
 Return customer_id, cust_name, city, grade, and salesman_id. */
SELECT customer_id, cust_name, city, grade, salesman_id
FROM customer
WHERE city = 'New York'
   OR grade <= 100
   OR grade IS NULL;


/* 2. write a SQL query to find all the customers in ‘New York’ city who have a grade value above 100.
 Return customer_id, cust_name, city, grade, and salesman_id. */
SELECT customer_id, cust_name, city, grade, salesman_id
FROM customer
WHERE city = 'New York'
  AND grade > 100;
  
/* 3. Write a SQL query that displays order number, purchase amount, and the achieved and unachieved percentage (%)
for those orders that exceed 50% of the target value of 6000. */
SELECT ord_no,
       purch_amt,
       (purch_amt / 6000) * 100 AS achieved_percentage,
       100 - ((purch_amt / 6000) * 100) AS unachieved_percentage
FROM orders
WHERE purch_amt > 3000;


/* 4. write a SQL query to calculate the total purchase amount of all orders.
   Return total purchase amount. */
SELECT SUM(purch_amt) AS total_purchase_amount
FROM orders;

/* 5. write a SQL query to find the highest purchase amount
   ordered by each customer. Return customer ID, maximum purchase amount. */
SELECT customer_id,
MAX(purch_amt) AS max_purchase_amount
FROM orders
GROUP BY customer_id;


/* 6. write a SQL query to calculate the average product price.
   Return average product price. */

SELECT AVG(pro_price) AS average_product_price
FROM item_mast;


/* 7. write a SQL query to find those employees whose department is located at ‘Toronto’.
      Return first name, last name, employee ID, job ID. */

SELECT e.first_name,
       e.last_name,
       e.employee_id,
       e.job_id
FROM employees e
JOIN departments d ON e.department_id = d.department_id
JOIN locations l ON d.location_id = l.location_id
WHERE l.city = 'Toronto';


/* 8. write a SQL query to find those employees whose salary is
      lower than that of employees whose job title is "MK_MAN".
      Exclude employees of the Job title ‘MK_MAN’.
      Return employee ID, first name, last name, job ID. */

SELECT employee_id,
       first_name,
       last_name,
       job_id
FROM employees
WHERE salary < (
        SELECT MIN(salary)
        FROM employees
        WHERE job_id = 'MK_MAN'
      )
AND job_id <> 'MK_MAN';


/* 9. write a SQL query to find all those employees who work in
      department ID 80 or 40.
      Return first name, last name, department number and department name. */

SELECT e.first_name,
       e.last_name,
       e.department_id,
       d.department_name
FROM employees e
JOIN departments d
  ON e.department_id = d.department_id
WHERE e.department_id IN (80, 40);



/* 10.write a SQL query to calculate the average salary, the number of employees receiving commissions in that department.
 Return department name, average salary and number of employees. */

SELECT 
    d.department_name,
    AVG(e.salary) AS average_salary,
    COUNT(e.commission_pct) AS employees_with_commission
FROM employees e
JOIN departments d ON e.department_id = d.department_id
GROUP BY d.department_name;


/* 11. write a SQL query to find out which employees have the same 
      designation as the employee whose ID is 169. 
      Return first name, last name, department ID and job ID. */

SELECT 
    first_name,
    last_name,
    department_id,
    job_id
FROM employees
WHERE job_id = (
    SELECT job_id
    FROM employees
    WHERE employee_id = 169
);

/* 12. write a SQL query to find those employees who earn more than the average salary.
   Return employee ID, first name, last name. */

SELECT employee_id, first_name, last_name
FROM employees
WHERE salary > (
    SELECT AVG(salary)
    FROM employees
);

/* 13. write a SQL query to find all those employees who work in the Finance department.
   Return department ID, name (first), job ID and department name. */

SELECT 
    e.department_id,
    e.first_name,
    e.job_id,
    d.department_name
FROM employees e
JOIN departments d 
    ON e.department_id = d.department_id
WHERE d.department_name = 'Finance';


/* 14. From the following table, write a SQL query to find the employees 
   who earn less than the employee of ID 182.
   Return first name, last name and salary. */

SELECT 
    first_name,
    last_name,
    salary
FROM employees
WHERE salary < (
    SELECT salary
    FROM employees
    WHERE employee_id = 182
);


/* 15. Create a stored procedure CountEmployeesByDept 
   that returns the number of employees in each department */

DELIMITER $$

CREATE PROCEDURE CountEmployeesByDept()
BEGIN
    SELECT 
        d.department_id,
        d.department_name,
        COUNT(e.employee_id) AS total_employees
    FROM departments d
    LEFT JOIN employees e
        ON d.department_id = e.department_id
    GROUP BY d.department_id, d.department_name;
END$$

DELIMITER ;

CALL CountEmployeesByDept();



/* 16. Create a stored procedure AddNewEmployee 
   that adds a new employee to the database */

DELIMITER $$

CREATE PROCEDURE AddNewEmployee (
    IN p_employee_id INT,
    IN p_first_name VARCHAR(20),
    IN p_last_name VARCHAR(25),
    IN p_email VARCHAR(25),
    IN p_phone_number VARCHAR(20),
    IN p_hire_date DATE,
    IN p_job_id VARCHAR(10),
    IN p_salary DECIMAL(8,2),
    IN p_commission_pct DECIMAL(2,2),
    IN p_manager_id INT,
    IN p_department_id INT
)
BEGIN
    INSERT INTO employees (
        employee_id,
        first_name,
        last_name,
        email,
        phone_number,
        hire_date,
        job_id,
        salary,
        commission_pct,
        manager_id,
        department_id
    )
    VALUES (
        p_employee_id,
        p_first_name,
        p_last_name,
        p_email,
        p_phone_number,
        p_hire_date,
        p_job_id,
        p_salary,
        p_commission_pct,
        p_manager_id,
        p_department_id
    );
END$$

DELIMITER ;


CALL AddNewEmployee(
    170,
    'Rahul',
    'Sharma',
    'RSHARMA',
    '9876543210',
    '2023-01-15',
    'IT_PROG',
    8000,
    NULL,
    103,
    60
);


SELECT employee_id, first_name, last_name, job_id, salary, department_id
FROM employees
WHERE employee_id = 170;


/* 17. Create a stored procedure DeleteEmployeesByDept 
   that removes all employees from a specific department */

DELIMITER $$

CREATE PROCEDURE DeleteEmployeesByDept (
    IN p_department_id INT
)
BEGIN
    -- 1. Remove employee-to-manager references
    UPDATE employees
    SET manager_id = NULL
    WHERE department_id = p_department_id;

    -- 2. Remove department manager reference
    UPDATE departments
    SET manager_id = NULL
    WHERE department_id = p_department_id;

    -- 3. Now delete employees
    DELETE FROM employees
    WHERE department_id = p_department_id;
END$$

DELIMITER ;

CALL DeleteEmployeesByDept(60);

SELECT * FROM employees WHERE department_id = 60;



/* 18. Create a stored procedure GetTopPaidEmployees 
   that retrieves the highest-paid employee in each department */
DELIMITER $$

CREATE PROCEDURE GetTopPaidEmployees()
BEGIN
    SELECT 
        d.department_id,
        d.department_name,
        e.employee_id,
        e.first_name,
        e.last_name,
        e.salary
    FROM employees e
    JOIN departments d 
        ON e.department_id = d.department_id
    WHERE e.salary = (
        SELECT MAX(e2.salary)
        FROM employees e2
        WHERE e2.department_id = e.department_id
    )
    ORDER BY d.department_id;
END$$

DELIMITER ;


CALL GetTopPaidEmployees();



/* 19. Create a stored procedure PromoteEmployee 
   that increases an employee’s salary and changes their job role */
DELIMITER $$

CREATE PROCEDURE PromoteEmployee (
    IN p_employee_id INT,
    IN p_new_job_id VARCHAR(10),
    IN p_salary_increase DECIMAL(8,2)
)
BEGIN
    UPDATE employees
    SET 
        salary = salary + p_salary_increase,
        job_id = p_new_job_id
    WHERE employee_id = p_employee_id;
END$$

DELIMITER ;


CALL PromoteEmployee(103, 'AD_VP', 2000);



/* 20. Create a stored procedure AssignManagerToDepartment 
   that assigns a new manager to all employees in a specific department */
DELIMITER $$

CREATE PROCEDURE AssignManagerToDepartment (
    IN p_department_id INT,
    IN p_manager_id INT
)
BEGIN
    UPDATE employees
    SET manager_id = p_manager_id
    WHERE department_id = p_department_id;
END$$

DELIMITER ;

CALL AssignManagerToDepartment(80, 145);


SELECT employee_id, first_name, manager_id
FROM employees
WHERE department_id = 80;


/* Practical Tasks for NoSQL:  */

/* 1. Retrieve all employee records */
db.employees.find()


/* 2. Find employees who work in the IT department */
db.employees.find({ department: "IT" })


/* 3. Find employees who have a salary greater than 70,000 */
db.employees.find({ salary: { $gt: 70000 } })


/* 4. Find employees who joined after 2018 */
db.employees.find({
  join_date: { $gt: ISODate("2018-12-31") }
})


/* 5. Find employees between the ages of 30 and 40 */
db.employees.find({
  age: { $gte: 30, $lte: 40 }
})


/* 6. Increase the salary of all employees in the Finance department by 5% */
db.employees.updateMany(
  { department: "Finance" },
  { $mul: { salary: 1.05 } }
)



/* 7. Delete employees who joined before 2010 */
db.employees.deleteMany({
  join_date: { $lt: ISODate("2010-01-01") }
})



/* 8. Find the highest-paid employee */
db.employees.find().sort({ salary: -1 }).limit(1)


