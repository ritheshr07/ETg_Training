
select e.ename,E.EMPNO,d.loc
from emp e,dept d 
WHERE E.DEPTNO=D.DEPTNO AND D.LOC='CHICAGO';

select e.ename,E.EMPNO,d.loc,D.DEPTNO 
from emp e,dept d 
WHERE E.DEPTNO=D.DEPTNO
ORDER BY LOC;

SELECT E.ENAME +' WORKS FOR '+ C.ENAME
FROM EMP E, EMP C
WHERE C.EMPNO=E.MGR;

select e.ename , c.ename
from emp e , emp c
where e.empno = c.mgr and e.HIREDATE < c.HIREDATE;



SELECT EMP.ENAME, DEPT.DNAME 
FROM EMP,DEPT;

SELECT  E.ENAME,E.EMPNO,D.LOC,D.DEPTNO
FROM EMP E,DEPT D
WHERE E.DEPTNO=D.DEPTNO;

SELECT E.EMPNO,E.ENAME,E.HIREDATE,J.STARTDATE,J.ENDDATE
FROM EMP E,JOBHIST J
WHERE E.HIREDATE BETWEEN J.STARTDATE AND J.ENDDATE;

