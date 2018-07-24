-- create an Oracle library for the DLL
create or replace library DeptLib AS 'C:\ExtProc\dept.dll';

-- create an external function definition
create or replace
  function EmpCount(p_DeptNo in dept.deptno%type)
  return number
  as external language c
  name "EmpCount"
  library DeptLib
  with context;
/

-- assuming the dll is in place, the following query should demonstrate
-- the created empcount function
select deptno, dname, empcount(deptno) from dept;