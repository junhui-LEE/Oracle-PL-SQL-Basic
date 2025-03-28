-- CASE문
DECLARE
    name varchar2(100) := '홍길동';
    age number(10) := 20;
BEGIN
    name := '홍길동';
    age := 20;
    dbms_output.put_line('Hello '|| name|| to_char(age));
    
    Case age
    When 13 Then
        dbms_output.put_line('초등학생');
    When 16 Then
        dbms_output.put_line('중학생');
    When 20 Then
        dbms_output.put_line('대학생');
    ELSE
        dbms_output.put_line('고등학생 이상');
    END Case;
END;
---------------------------------------------------------------------------------------------------------
DECLARE
    name varchar2(100) := '홍길동';
    age number(10) := 20;
BEGIN
    name := '홍길순';
    age := 8;
    dbms_output.put_line('Hello '|| name|| to_char(age));
    
    Case
    When age<13 Then
        dbms_output.put_line('초등학생');
    When age<16 Then
        dbms_output.put_line('중학생');
    When age<20 Then
        dbms_output.put_line('고등학생');
    ELSE
        dbms_output.put_line('고등학생 이상');
    END Case;
END;
