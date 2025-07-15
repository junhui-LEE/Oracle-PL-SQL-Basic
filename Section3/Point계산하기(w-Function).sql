create or replace NONEDITIONABLE FUNCTION F_GET_ADDPOINT 
(
  P_PRICE IN NUMBER 
--  프로시저는 OUT이나 IN OUT을 사용할수 있지만 함수는 IN만 사용한다.
-- 함수도 그렇고 프로시저도 그렇고 IN이 기본 값이다. 그래서 P_PRICE NUMBER 이라고 쓰면
-- 기본으로 P_PRICE IN NUMBER과 같은 것이다. 


) RETURN NUMBER AS 
-- AS 말고 IS를 써도 오류가 나지 않는다. 
-- 적립포인트
--    v_point real_ord.point_add%type;
--    v_point number;
    v_point cst_info.point%type;
    
    
BEGIN
  v_point := ROUND(P_PRICE * 0.1);
  RETURN v_point;
EXCEPTION WHEN OTHERS THEN
    RETURN 0;
    
END F_GET_ADDPOINT;
