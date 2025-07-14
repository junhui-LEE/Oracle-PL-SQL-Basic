-- 함수를 실행하려면(함수가 잘 만들어 졌는지 확인하려면)
-- SELECT 문에 함수를 넣어주면 된다.
SELECT tmp_ord.*,
    F_GET_OPT_PRICE(mnu_id, mnu_size) AS opt_size_price,
    F_GET_OPT_PRICE(mnu_id, mnu_ice) AS opt_ice_price
FROM tmp_ord;
--------------------------------------------------------------
SELECT 
    tmp_ord.*,
    (
    -- 기준단가
        SELECT x.mnu_price
        FROM menu x
        WHERE x.mnu_id = tmp_ord.mnu_id
    )AS price,
    -- 사이즈 옵션 가격
    F_GET_OPT_PRICE(mnu_id, mnu_size) AS opt_size_price,
    -- 아이스 옵션 가격
    F_GET_OPT_PRICE(mnu_id, mnu_ice) AS opt_ice_price
FROM tmp_ord; 
-- 질의 결과를 보면 수량(qty), 기준단가(price) 사이즈옵션 가격(opt_size_price)
-- 아이스 옵션 가격(opt_ice_price)를 확인 할수 있는데 
-- 수량*(기준단가 + 사이즈옵션 가격 + 아이스옵션 가격) 이렇게 하면 동일한 상품들에
-- 대한 전체 가격을 뽑아 낼 수 있다. 즉, 주문금액을 알 수 있다. 
-- M사이즈의 아이스 아메리카노 상품 3개에 대해서 가격(주문금액)을 뽑아낼 수 있다. 















