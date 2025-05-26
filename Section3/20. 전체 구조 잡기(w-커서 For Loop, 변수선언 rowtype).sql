-- 오라클 PL/SQL중의 FUNCTION 연습
CREATE OR REPLACE FUNCTION f_test(
    -- 파라미터이름 + [IN | OUT | IN OUT] + 데이터타입
    p_mnu_name IN VARCHAR2,                   -- VARCHAR2(20) 또는 NUMBER(10, 0)처럼 길이나 정밀도를 지정하는 데이터타입은  
    p_mnu_price IN NUMBER                     -- 프로시저나 함수의 파라미터 선언에서는 허용되지 않는다. 그냥 데이터 타입만 써야 한다.   
)RETURN VARCHAR2  -- PL/SQL 중의 FUNCTION에서는 반환타입(ex: RETURN VARCHAR2)을 반드시 써줘야 한다. 안쓰면 툴상에서 에러난다.
IS  -- FUNCTION 구현부의 시작으로 [IS|AS]를 써준다.   
    v_result VARCHAR2(100);      -- FUNCTION에서 변수를 선언하는 자리([IS|AS]~BEGIN)이다. 
BEGIN                                         -- FUNCTINON 의 구현부(BEGIN~END) 같은 경우에는 반드시 RETURN 을 해줘야 한다. 
    dbms_output.put_line('가격 올랐습니다.');
    p_mnu_name := '오른 ' || p_mnu_name;       -- IN으로 선언한 파라미터는 함수나 프로시저 내부에서 수정할 수 없다. 
    p_mnu_price := p_mnu_price + 500;         -- 툴이 오류(빨간줄)을 선언하지는 않지만 컴파일을 시도하면 툴상에 우선 
    v_result := p_mnu_name || p_mnu_price;    -- 컴파일이 되었다고 표기가 되고 "'P_MNU_NAME' 식은 피할당자로 사용될 수 없습니다"
    dbms_output.put_line(v_result);           -- 이런식으로 파라미터는 새로이 값을 할당할 수 없다는 에러가 나온다. 지금 이러한 상태
    RETURN v_result;                          -- (파라미터에 새로이 값을 할당하려고 하는 상태)는 INVAILID 한 상태이다. 나중에 INVAILID한 함수를
END;                                          -- 다른곳에서 호출하면 INVAILID 에러가 나온다. 
                                             -- 그냥 *IN으로 선언된 파라미터는 함수나 프로시저 구현부에서 수정하면 안된다.*
                                             
-- *함수 정의가 끝난 END; 뒤에 /(슬래시)를 써주는 것 같은데, 이 부분은 나중에 알아본다.*

-- 함수가 컴파일은 되었는데, 함수가 INVAILID 상태이고 이때 함수를 실행시키면 함수에서 에러가 난다.
-- 즉, 선언한 함수가 INVAILID 상태인지 VAILID 상태인지를 확인할 필요가 있는데, 아래와 같이 
-- SELECT 문을 써주면 된다.
SELECT object_name, status
FROM user_objects
WHERE object_type='FUNCTION' AND object_name='F_TEST';

-- 위의 코드는 오류가 나지만 선언한 함수를 실행시키기 위해서는 아래와 같이 코드를 짜고 실행시키면 된다. 
-- SELECT f_test('케이크', 5000) FROM dual;




