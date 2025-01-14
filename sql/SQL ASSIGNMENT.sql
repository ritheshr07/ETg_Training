
--1. Show the structure of the DEPT table. Select all the data from the Dept table.
 EXEC sp_help 'DBO.DEPT';

 SELECT * 
 FROM DEPT;

--2. Show the structure of the EMP table. Create a query to display the name, job, hiredate and employee number.
  EXEC sp_help 'DBO.EMP';
  SELECT	ENAME,
			JOB,
			HIREDATE,
			EMPNO
  FROM EMP;

--3. Display the employee name, job, monthly and annual salary with appropriate column titles.
  SELECT	ENAME,
			JOB,
			SAL AS 'MONTHLY SALARY',
			SAL*12 AS 'ANNUAL SALARY'
  FROM EMP;

--4. Display the name concatenated with the job, separated by a comma and space, and the name the column Employee and Title.
  
  SELECT	ENAME + ' , ' + JOB AS 'EMPLOYEE AND DETAILS'
  FROM EMP;

--5. Display unique jobs from the emp table.
  
  SELECT DISTINCT JOB
  FROM EMP;

--6. Display the name and salary of employees earning more than 2850.
  
  SELECT	ENAME, 
			SAL
  FROM EMP
  WHERE SAL > 2850;

--7. Create a query to display the employee name and department number for employee SMITH.
  
  SELECT	ENAME,
			DEPTNO
  FROM EMP
  WHERE ENAME='SMITH';  

--8. Display the employee name, job and start date of employees hired between February 20, 1981 and May 1, 1981. Order the query in ascending order of start date.
  
  SELECT	ENAME, 
			JOB,
			HIREDATE
  FROM EMP
  WHERE HIREDATE BETWEEN '1981-02-20' AND '1981-05-01'
  ORDER BY HIREDATE;

--9. Display the employee name and department number of all employees in departments 10 and 30 in alphabetical order by name.
  
  SELECT	ENAME,
			DEPTNO
  FROM EMP
  WHERE DEPTNO= 10 OR DEPTNO = 30 
  ORDER BY ENAME;

--10. Display the name and hiredate of every employee who was hired in 1982.
   
   SELECT	ENAME, 
			HIREDATE 
   FROM EMP
   WHERE HIREDATE BETWEEN '1982-01-01' AND '1982-12-31';
  
--11. Display the name and title of all employees who do not have a manager.
   
   SELECT	ENAME, 
			JOB 
   FROM EMP
   WHERE MGR IS NULL;

--12. Write a query to display the current date. Label the column Date.
    
	SELECT GETDATE() AS 'DATE' ;

--13. Display the employees who were hired before their managers.
   
   SELECT	e.ENAME, 
			e.HIREDATE,
			m.ENAME,
			m.HIREDATE
   FROM EMP e,EMP m
   WHERE e.EMPNO = m.MGR AND e.HIREDATE < m.HIREDATE;

--14. Determine the number of managers without listing them.
   
   SELECT COUNT(JOB) AS 'NO_OF_MANAGER'
   FROM EMP
   WHERE JOB = 'MANAGER';

--15. List employee details working in departments 20,30 & 40.
   
   SELECT *
   FROM EMP
   WHERE DEPTNO IN (20,30,40);
   
--16. List of employees whose names start with T and end with R.
   
   SELECT ENAME
   FROM EMP
   WHERE ENAME LIKE 'T%R';

--17. List the name and hiredate of the employee in department 30.
   
   SELECT	ENAME,
			HIREDATE 
   FROM EMP
   WHERE DEPTNO = 30;

--18. Display the hiredate in emp table formatted as �mm/dd/yy�.

select format(hiredate, 'MM-dd-yy') as 'Date' from emp;

--19. Retrieve the analysts� record with the hiredate formatted as �the 3rd of Decemeber, 1984�.
   
   SELECT *
   FROM EMP
   WHERE JOB = 'ANALYST' AND  HIREDATE='1984-12-03';

--20. List the names of all employees whose hiredate anniversary is in the month of December.


SELECT	ename, 
		hiredate 
FROM emp 
WHERE month(HIREDATE)  LIKE '12';

    
--21. Give SQL command to find the average annual salary per job in each department.
   
   SELECT	JOB,
			DEPTNO, 
			AVG(SAL*12) AS 'ANNUAL SALARY'
   FROM EMP
   GROUP BY JOB ,DEPTNO;
   
--22. In one query, count the number of people in department in 30 who receive a salary and the number of people who receive a commission.
   
   SELECT	COUNT(SAL) AS 'TOTAL SALARY',
			COUNT(COMM) AS 'TOTAL COMMISSION'
   FROM EMP
   WHERE DEPTNO = 30 ;

--23. Compute the average, minimum and maximum salaries of those groups of employees having the job as clerk or manager.
   
   SELECT	AVG(SAL) AS 'AVERAGE', 
			MIN(SAL) AS 'MINIMUM',
			MAX(SAL) AS 'MAXIMUM'
   FROM EMP
   WHERE JOB = 'CLERK' OR JOB ='MANAGER' ;

--24. Display the department numbers of departments which have more than one clerk.
   
   SELECT DEPTNO
   FROM EMP
   WHERE EXISTS (SELECT COUNT(JOB) AS CLERK_COUNT 
                FROM EMP
                WHERE JOB = 'CLERK'
                GROUP BY DEPTNO)
   GROUP BY DEPTNO;

--25. Which employees earn less than 30 persent of the presidents salary.
   
   SELECT	ENAME, 
			SAL
   FROM EMP
   WHERE SAL < (SELECT SAL*0.3 AS SAL
                 FROM EMP 
                 WHERE JOB= 'PRESIDENT');

				 				 								 								 								 								 
--26.	How many employees work in Chicago?

select	count(ename)
from emp
join
dept
on loc='chicago';

--27.	Which employees work in Chicago?

select	ename
from emp
join
dept
on loc='chicago';

--28.	List the employees� names and cities in which they work. Order the list by city.

select	ename,
		loc
from emp e
join dept d
on e.DEPTNO=d.DEPTNO
order by loc; 

--29.	Find the number or different employees and number of departments.

select	count(distinct deptno)
from emp;

--30.	Determine the average salaries of employees.

select	top 1 ename,
		avg(sal) as average_salary
from emp
group by ename
order by average_salary;


--31.	Determine number of departments in the company.

select count(*) as DEPTNO
from EMP

--32.	List department number, department name, location and total commission paid and total salary of each department.

select	distinct e.deptno,
		dname,
		loc,
		sum(comm) as totalcomm,
		sum(sal) as totalofeachdept
from emp e,dept d
group by e.DEPTNO,DNAME,LOC
order by DEPTNO;

--33.Display the employee name, job description and the salary multiplied by 12.

SELECT	ENAME,
		JOB,
		SAL*12 AS 'ANUAL SALARY' 
FROM EMP;

--34.List the name, job and commission of employee who earn no commission.

SELECT	ENAME,
		JOB,
		COMM 
FROM EMP 
WHERE  COMM IS NULL ;

--35. List the name, job and commission of employee who earn commission.

SELECT	ENAME,
		JOB,
		COMM 
FROM EMP 
WHERE COMM IS NOT NULL ;

--36. List the employee name, job description and salary where the third character of employee name is R.

SELECT	ENAME,
		JOB,
		SAL 
FROM EMP 
WHERE ENAME LIKE '__R%'; 

--37. List all the information from emp that are five characters long.

SELECT	* 
FROM EMP 
WHERE ENAME LIKE '_';

--38. List all the information from emp that are not five characters long.

SELECT	* 
FROM EMP 
WHERE ENAME LIKE '__';

--39. List names that have A and followed by R.

SELECT	* 
FROM EMP 
WHERE ENAME LIKE '%AR%';


--40.	List all the details of employee from emp table where department number is equal to 30, order the list  by their salary.

select	ename,
		sal
from emp
where deptno=30
order by sal;


--41.	Select name and salary of employees who earn between 1250 and 1600.

select	ename,
		sal
from emp
where sal between 1250 and 1600;


--42.	List the name and salary of employees who earn less than 1250 or more than 1600.

select sal,ename,
(case
when sal = any (select sal
from emp
where 1250>sal) then 'lessthan1250'
when sal = any (select sal
from emp
where 1600<sal) then 'morethan1600' end) as 'status-result'
from emp;


--43.	Compute the total salary of all employees.

select sum(sal) as totalsalofallemp
from emp;

--44.	Count the number of employees who have job titles(that is, the number of rows where JOB is not NULL).

select	count(ename)
from emp
where job is not null;



--45.	Compute the minimum and the maximum salary in the company.

select	top 1 e.ename,
		min(sal) as minsalary
from EMP e
group by ename
order by minsalary;


select	top 1 ename,
		max(sal) as maxsalary
from EMP e
group by ename
order by maxsalary desc;



--46.	Write a query that produces all rows from the emp table with columns in  the following order with these as heading.
	--	Emp #, Employee, Salary, Job, Date of Hire, Commission, Department No, MGR No.

select 
	ename as Employee,
	sal as Salary,
	job as Job,
	hiredate as 'Date of Hire',
	comm as Commission,
	deptno as 'Department No',
	mgr as 'MGR No'
from EMP;


--47.	What is the earliest date on which someone was hired, and what is the latest date on which someone was hired.

select e.ename as EarliestDate , c.ename as LatestDate
from emp e , emp c
where e.empno = c.mgr and c.HIREDATE < e.HIREDATE;


--48.	Count the number of employees working in department 10.

select count(e.deptno)
from emp e
where e.deptno>10;



--49.	Write a query that will give you the names and jobs of all employees in New York with a commission above 10.

select ename,sal,comm
from emp e
join 
dept d
on loc='NEW YORK'
where e.comm > 10;


--50.	Format the hiredate with the following date formats.
--a.	DAY MONTH DD, YYYY
--b.	DY DD Mon YYYY
--c.	Day ddth Month YYYY


select datename(weekday,getdate()) 'Day Name', format(getdate(), 'MM-dd-yy') as 'Date'

select datename(weekday,getdate()) 'Day Name', format(getdate(), 'dd-mm-yy') as 'Date'

select datename(weekday,getdate()) 'Day Name', format(getdate(), 'yy-MM-dd') as 'Date'