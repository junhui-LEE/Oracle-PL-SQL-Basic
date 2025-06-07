DECLARE
-- 우리는 장바구니테이블에서 데이터 뽑아서 주문서 테이블에 데이터를 넣으려고 한다.
-- 변수선언, 서브프로그램
    v_cst_id cst_info.cst_id%TYPE := 'C003';
    v_mnu_id tmp_ord.mnu_id%TYPE;
    v_mnu_size tmp_ord.mnu_size%TYPE;
    -- 주문서 변수
--    v_price real_ord.total_price%TYPE := 100;
--    v_total_price real_ord.total_price%TYPE := 2000;
--    v_point_add real_ord.point_add%TYPE := 0;
    r_real_ord real_ord%ROWTYPE;

BEGIN
    -- 실행구문
    -- 1. 장바구니의 자료를 가져온다.
    -- 2. 장바구니의 갯수만큼 LOOP 진행을 한다.
    FOR fc IN (SELECT * FROM tmp_ord WHERE cst_id = v_cst_id)
    LOOP
        v_mnu_size := fc.mnu_size;
        dbms_output.put_line(fc.cst_id);
        dbms_output.put_line(fc.mnu_id);
        dbms_output.put_line(fc.mnu_size);
        -- 3. 주문서에 필요한 기본 정보를 가져온다.
        -- 3.1 맥주일 경우 미성년자 체크를 한다.
        -- 4. 옵션가를 가져온다.
        -- 5. 주문금액을 계산한다. 수량*(기준단가+옵션가)
        r_real_ord.price := 200;
        r_real_ord.total_price := 92000;
        -- 5. 포인트 추가를 한다. 1%추가
        r_real_ord.point_add := 2000;
        -- 6. 주문서를 생성한다.
        INSERT INTO real_ord(ord_seq, cst_id, mnu_id, mnu_size, mnu_ice,
                        qty, price, total_price, point_use, point_add)
        VALUES(1, fc.cst_id, fc.mnu_id, fc.mnu_size, fc.mnu_ice,
                    fc.qty, r_real_ord.price, r_real_ord.total_price, fc.point_use, r_real_ord.point_add);
        -- 7. 개인정보에 포인트를 넣어준다.
        
    END LOOP;
END;
/

SELECT * FROM real_ord;
--SELECT * FROM tmp_ord WHERE cst_id = 'C003';
