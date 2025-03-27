--1강) 기본문법

DECLARE
    --변수선언(BEGIN 위에 변수 선언한다.), 서브프로그램(여기 부분에 변수선언되고 서브프로그램 넣을 수 있다. 변수나 서브프로그램
    -- 없으면 DECLARE도 없어도 된다.
BEGIN
    --실행구문 (BEGIN과 END사이에 여러가지 SQL문장들, 제어문 등등 들어간다.
    dbms_output.put_line('Hello PL/SQL');
    EXCEPTION when others then
    -- 예외처리 (java에서 try~catch를 안해도 되는 것 처럼 EXCEPTION 부분은 생략이 가능하다. 참고로
    -- PL/SQL에서 when others는 지정한 특정예외가 아닌 모든 예외를 처리하는 역할을 한다. 그런데 지정한
    -- 예외가 없기 때문에 해당 코드에서는 모든 예외를 처리하게 된다. 즉, EXCEPTION when others then을
    -- 해석하면 "(그 외)모든 예외 발생시"가 된다.
        null;    
END;
------------------------------------------------------------------------------------------------------------
DECLARE
    -- 변수선언, 서브 프로그램
    -- BEGIN~END 사이에 또 BEGIN~END가 들어갈 수 있고
    -- 그때 여기에 변수를 선언하면 "전역변수"가 된다. 
    -- 구체적인 쪽에서 전역변수를 참조해서 활용할 수 있다.
BEGIN
    dbms_output.put_line('Hello PL/SQL 1');
    -- (익명)블록 안에 또 (익명)블록(BEGIN~END)을 넣을 수 있는데,
    -- BEGIN과 END사이에 또 블록 코드를 넣을 수 있다.
    DECLARE
        -- 변수선언, 서브프로그램
    BEGIN
        dbms_output.put_line('Hello PL/SQL 2');
        BEGIN
            dbms_output.put_line('Hello PL/SQL 3');
        END;
    END;
    BEGIN
        dbms_output.put_line('Hello PL/SQL 4');
    END;
END;
----------------------------------------------------------------------------------------------------------
-- 변수 선언과 변수에 값을 채우고 채운 변수를 문자열과 더해서 출력하는 코드
DECLARE
    -- 변수의 타입설정을 일반적으로 DB테이블에 있는 컬럼명의 데이터타입을 PL/SQL의 변수의 타입으로 
    -- 가장 많이 사용한다.
    v_name varchar2(200);
BEGIN
    v_name := ' 홍길동';
    dbms_output.put_line('Hello PL/SQL' || v_name);
END;
----------------------------------------------------------------------------------------------------------
DECLARE
    v_name varchar2(200);
BEGIN
    v_name := 'value';
    dbms_output.put_line('v_name : ' || v_name);
    
    SELECT name 
    INTO v_name
    FROM sample
    WHERE name = '홍길동';

    dbms_output.put_line('v_name : ' || v_name);
END;
-----------------------------------------------------------------------------------------------------------
DECLARE
    v_name sample.name%type;
BEGIN
    select name into v_name
    from sample
    where name = '홍길순';
    dbms_output.put_line('v_name : ' || v_name);
END;
-------------------------------------------------------------------------------------------------------------
DECLARE
    r_sample sample%rowtype;
BEGIN
    select 
        name, age, reg_date
        into r_sample
    from sample
    where name = '홍길순';
    dbms_output.put_line('홍길순 row ' || r_sample.name || ' ' || r_sample.age || ' ' || r_sample.reg_date);
END;

DECLARE
    r_sample sample%rowtype;
BEGIN
    r_sample.name := '홍길순2';
    dbms_output.put_line(r_sample.name);
END;

DECLARE
    r_sample sample%rowtype;
BEGIN
    select * into r_sample
    from sample
    where name='홍길동';
    dbms_output.put_line('result ' || r_sample.name || ' ' || r_sample.age || ' ' || r_sample.reg_date); 
END;



