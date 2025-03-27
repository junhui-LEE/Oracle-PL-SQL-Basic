-- 제어문(if)
DECLARE
    -- 변수선언, 서브프로그램
    name varchar2(100) := '홍길동';
    age number(10) := 20;
BEGIN
    -- 실행구문
    name := '홍길동';
    age := 20;
    dbms_output.put_line('Hello '|| name|| to_char(age));
    IF age<13 Then
        dbms_output.put_line('초등학생');
    ELSIF age<16 Then
        dbms_output.put_line('중학생');
    ELSE
        dbms_output.put_line('고등학생이상');
    END IF;
END;
