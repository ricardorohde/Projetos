create or replace package DeptAPI is

  type t_deptcursor is ref cursor return dept%rowtype;

  procedure SelectRecords(p_cursor in out t_deptcursor,
                          p_order  varchar2);

  procedure LockRecord(p_deptno dept.deptno%type);

  procedure InsertRecord(p_deptno in out dept.deptno%type,
                         p_dname  dept.dname%type,
                         p_loc    dept.loc%type);

  procedure UpdateRecord(p_olddeptno dept.deptno%type,
                         p_deptno    dept.deptno%type,
                         p_dname     dept.dname%type,
                         p_loc       dept.loc%type);

  procedure DeleteRecord(p_deptno dept.deptno%type);

end DeptAPI;
/
create or replace package body DeptAPI is
  
  -- Open a cursor to select departments in a particular order
  procedure SelectRecords(p_cursor in out t_deptcursor,
                          p_order  varchar2) is
  begin
    if upper(p_order) = 'DNAME' 
    then
      open p_cursor for select * from dept order by dname, loc;
    elsif upper(p_order) = 'DEPTNO'
    then
      open p_cursor for select * from dept order by deptno;
    elsif upper(p_order) = 'LOC'
    then
      open p_cursor for select * from dept order by loc, dname;
    else
      open  p_cursor for select * from dept;
    end if;
  end;

  -- Lock a department record
  procedure LockRecord(p_deptno dept.deptno%type) is
    dummy varchar2(1);
  begin
    select 'x' into dummy from dept
     where deptno = p_deptno for update nowait;
  exception
    when timeout_on_resource then
      raise_application_error(-20000, 'This department is locked by another user');
    when no_data_found then
      raise_application_error(-20000, 'This department has been deleted by another user');
  end;

  -- Insert a new department
  procedure InsertRecord(p_deptno in out dept.deptno%type,
                         p_dname  dept.dname%type,
                         p_loc    dept.loc%type) is
  begin
    -- Determine the maximum department number if necessary
    if p_deptno is null
    then
      select nvl(max(deptno), 0) + 1 into p_deptno from dept;
    end if;
    -- Insert the new record
    insert into dept (deptno, dname, Loc)
      values (p_deptno, p_dname, p_loc);
  end;
                            
  -- Update a department
  procedure UpdateRecord(p_olddeptno dept.deptno%type,
                         p_deptno    dept.deptno%type,
                         p_dname     dept.dname%type,
                         p_loc       dept.loc%type) is
  begin
    update dept
       set deptno = p_deptno,
           dname  = p_dname,
           loc    = p_loc
     where deptno = p_olddeptno;
  exception when dup_val_on_index then
    raise_application_error(-20000, 'This department already exists');
  end;
                        
  -- Delete a department
  procedure DeleteRecord(p_deptno dept.deptno%type) is
  begin
    delete from dept where deptno = p_deptno;
  end;
  
end DeptAPI;
/
