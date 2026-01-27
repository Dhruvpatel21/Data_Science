create database practical;
use practical;

select * from department;

insert into department values 
(10,"ACCOUNTING","NEW YORK"),
(20,"RESERCH","DALLAS"),
(30,"SALES","CHICAGO"),
(40,"OPERATIONS","BOSTON");

create table EMPLOYEE (
Empno int(4) primary key default 0,
Ename varchar(10),
 job varchar(9),
 mgr int(4),
 Hiredate date,
 sal decimal(7,2),
 comm decimal(7,2),
 deptno int(2) ,
 foreign key (deptno) references department(deptno)
);
drop  table EMPLOYEE ;
INSERT INTO EMPLOYEE (Empno, Ename, job, mgr, Hiredate, sal, comm, deptno) VALUES
(7369, 'SMITH',  'CLERK',     7902, '1980-12-17',  800.00,  NULL,    20),
(7499, 'ALLEN',  'SALESMAN',  7698, '1981-02-20', 1600.00,  300.00,  30),
(7521, 'WARD',   'SALESMAN',  7698, '1981-02-22', 1250.00,  500.00,  30),
(7566, 'JONES',  'MANAGER',   7839, '1981-04-02', 2975.00,  NULL,    20),
(7654, 'MARTIN', 'SALESMAN',  7698, '1981-09-28', 1250.00, 1400.00,  30),
(7698, 'BLAKE',  'MANAGER',   7839, '1981-05-01', 2850.00,  NULL,    30),
(7782, 'CLARK',  'MANAGER',   7839, '1981-06-09', 2450.00,  NULL,    10),
(7788, 'SCOTT',  'ANALYST',   7566, '1987-06-11', 3000.00,  NULL,    20),
(7839, 'KING',   'PRESIDENT', NULL, '1981-11-17', 5000.00,  NULL,    10),
(7844, 'TURNER', 'SALESMAN',  7698, '1981-08-09', 1500.00,  0.00,    30),
(7876, 'ADAMS',  'CLERK',     7788, '1987-07-13', 1100.00,  NULL,    20),
(7900, 'JAMES',  'CLERK',     7698, '1981-03-12',  950.00,  NULL,    30),
(7902, 'FORD',   'ANALYST',   7566, '1981-03-12', 3000.00,  NULL,    20),
(7934, 'MILLER', 'CLERK',     7782, '1982-01-23', 1300.00,  NULL,    10);

select * from EMPLOYEE;
select * from department;

/* 1. Select unique job from EMP table.  */
select distinct job from EMPLOYEE;

/* 2. List the details of the emps in asc order of the Dptnos and desc of Jobs?  */
select  * from EMPLOYEE
order by deptno asc,job desc;

/* 3. Display all the unique job groups in the descending order?  */
select distinct job from EMPLOYEE
order by job desc;

/* 4. List the emps who joined before 1981.  */
select  * from EMPLOYEE
WHERE Hiredate < '1981-01-01';

/* 5. Empno, Ename, Sal, Daily sal in asc order of annual sal */
SELECT Empno, Ename, sal, (sal/30) AS daily_sal
FROM EMPLOYEE
ORDER BY sal*12 ASC;

/* 6. Empno, Ename, Sal, Exp of emps working for mgr 7369 */
SELECT Empno, Ename, sal
FROM EMPLOYEE
WHERE mgr != 7369;

/* 7. Display all the details of the emps whose comm is more than sal */
SELECT * 
FROM EMPLOYEE
WHERE comm > sal;

/* 8. List the emps who are either CLERK or ANALYST in desc order */
SELECT * 
FROM EMPLOYEE
WHERE job IN ('CLERK','ANALYST')
ORDER BY job DESC;

/* 9. List the emps whose annual sal between 22000 and 45000 */
SELECT * 
FROM EMPLOYEE
WHERE sal*12 BETWEEN 22000 AND 45000;

/* 10. List the enames starting with S and with five characters */
SELECT Ename
FROM EMPLOYEE
WHERE Ename LIKE 'S____';

/* 11. List the emps whose empno not starting with 78 */
SELECT * 
FROM EMPLOYEE
WHERE Empno NOT LIKE '78%';

/* 12. List all the clerks of deptno 20 */
SELECT * 
FROM EMPLOYEE
WHERE job = 'CLERK' AND deptno = 20;

/* 13. List the emps who are senior to their own managers */
SELECT e.*
FROM EMPLOYEE e
JOIN EMPLOYEE m ON e.mgr = m.Empno
WHERE e.Hiredate < m.Hiredate;

/* 14. List the emps of deptno 20 whose jobs same as deptno 10 */
SELECT * 
FROM EMPLOYEE
WHERE deptno = 20
AND job IN (SELECT job FROM EMPLOYEE WHERE deptno = 10);

/* 15. List the emps whose sal same as FORD or SMITH in desc order */
SELECT * 
FROM EMPLOYEE
WHERE sal IN (
    SELECT sal FROM EMPLOYEE WHERE Ename IN ('FORD','SMITH')
)
ORDER BY sal DESC;

/* 16. List the emps whose jobs same as SMITH or ALLEN */
SELECT * 
FROM EMPLOYEE
WHERE job IN (
    SELECT job FROM EMPLOYEE WHERE Ename IN ('SMITH','ALLEN')
);

/* 17. Any jobs of deptno 10 not found in deptno 20 */
SELECT DISTINCT job
FROM EMPLOYEE
WHERE deptno = 10
AND job NOT IN (SELECT job FROM EMPLOYEE WHERE deptno = 20);

/* 18. Find the highest sal of EMPLOYEE table */
SELECT MAX(sal) AS highest_salary
FROM EMPLOYEE;

/* 19. Find details of highest paid employee */
SELECT * 
FROM EMPLOYEE
WHERE sal = (SELECT MAX(sal) FROM EMPLOYEE);

/* 20. Find the total sal given to the manager */
SELECT SUM(sal) AS total_manager_salary
FROM EMPLOYEE
WHERE job = 'MANAGER';

/* 21. List the emps whose names contains A */
SELECT * 
FROM EMPLOYEE
WHERE Ename LIKE '%A%';

/* 22. Minimum salary job wise in ascending order */
SELECT *
FROM EMPLOYEE e
WHERE sal = (
    SELECT MIN(sal)
    FROM EMPLOYEE
    WHERE job = e.job
)
ORDER BY sal ASC;

SELECT job, MIN(sal) AS min_salary
FROM EMPLOYEE
GROUP BY job
ORDER BY job ASC;

/* 23. List the emps whose sal greater than BLAKE */
SELECT * 
FROM EMPLOYEE
WHERE sal > (
    SELECT sal FROM EMPLOYEE WHERE Ename = 'BLAKE'
);

/* 24. Create view v1 */
CREATE VIEW v1 AS
SELECT e.Ename, e.job, d.dname, d.loc
FROM EMPLOYEE e
JOIN department d ON e.deptno = d.deptno;

SELECT * FROM v1;

/* 25. Create procedure with deptno as input */
DELIMITER $$
CREATE PROCEDURE get_emp_dept(IN dno INT)
BEGIN
    SELECT e.Ename, d.dname
    FROM EMPLOYEE e
    JOIN department d ON e.deptno = d.deptno
    WHERE e.deptno = dno;
END$$
DELIMITER ;

CALL get_emp_dept(10);

/* 26. Add pin column in student table */
CREATE TABLE student (
    sid INT PRIMARY KEY,
    sname VARCHAR(50)
);

ALTER TABLE student
ADD pin BIGINT;

select * from student;

/* 27. Modify the student table to change the sname length from 14 to 40. Create trigger to insert data in emp_log table whenever any update of sal in EMP table. You can set action as ‘New Salary’.  */
ALTER TABLE student
MODIFY sname VARCHAR(40);

/* Trigger to insert data in emp_log on salary update */

CREATE TABLE emp_log (
    emp_id INT,
    log_date DATE,
    new_salary INT,
    action VARCHAR(30)
);


DELIMITER $$
CREATE TRIGGER trg_salary_update
AFTER UPDATE ON EMPLOYEE
FOR EACH ROW
BEGIN
    IF OLD.sal <> NEW.sal THEN
        INSERT INTO emp_log(emp_id, log_date, new_salary, action)
        VALUES (NEW.Empno, CURDATE(), NEW.sal, 'New Salary');
    END IF;
END$$
DELIMITER ;

UPDATE EMPLOYEE
SET sal = sal + 1000
WHERE empno = 7369;

SELECT * FROM emp_log;

drop table emp_log;










