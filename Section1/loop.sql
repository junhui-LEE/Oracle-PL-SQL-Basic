DECLARE
    name varchar2(100) := '홍길동';
    age number(10) := 20;
    x number := 0;
BEGIN
    name := '홍길동';
    age := 20;
    dbms_output.put_line('Hello ' || name || to_char(age));
    
    Loop
    x := x+1;
    IF x<age Then
        dbms_output.put_line('x 카운트 '||x);
        continue;
    Else
        dbms_output.put_line('x 카운트 '||x);    
    End If;
        dbms_output.put_line('마지막 Loop Line');
        exit;
    End Loop;
END;
