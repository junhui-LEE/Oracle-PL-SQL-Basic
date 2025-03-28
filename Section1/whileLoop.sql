-- 반복문 While Loop
DECLARE
    -- 변수선언, 서브프로그램
    name varchar2(100) := '홍길동';
    age number(10) := 20;
    x number := 0;
BEGIN
    -- 실행구문
    name := '홍길동';
    age := 20;
    dbms_output.put_line('Hello '|| name|| to_char(age));
    
    While x<age
    Loop
        x := x+1;
        dbms_output.put_line('x count '|| x);
    End Loop;
    
    x := 0; --변수 초기화
    
    Loop
        x := x+1;
        dbms_output.put_line('x count '|| x);
    Exit When x=age;
    End Loop;
END;
