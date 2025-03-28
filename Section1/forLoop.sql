-- For Loop 문
DECLARE
    name varchar2(100) := '홍길동';
    age number(10) := 20;
    x number;
BEGIN
    name := '홍길동';
    age := 20;
    x := 0;
    dbms_output.put_line('Hello ' || name|| to_char(age));
    
    For x IN 1..100
    Loop
        If x<age Then
            dbms_output.put_line('x 카운트 ' || x);
            continue;
        ELSE
            dbms_output.put_line('x 카운트 ' || x);
        END If;
        dbms_output.put_line('마지막 Loop Line');
--        exit;
    END Loop;
    dbms_output.put_line('For Loop문 종료');
END;
