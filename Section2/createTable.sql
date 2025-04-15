-- #테이블 생성1
-- 고객정보 테이블
CREATE TABLE cst_info(
    cst_id VARCHAR2(20) NOT NULL,
    name VARCHAR2(20) NOT NULL,
    birth NUMBER(8) NOT NULL,
    mobile VARCHAR(20) NOT NULL,
    point NUMBER(8) DEFAULT 0 NOT NULL,
    reg_day DATE DEFAULT SYSDATE,
    CONSTRAINT pk_cst_info PRIMARY KEY (cst_id)
);
COMMENT ON COLUMN cst_info.cst_id IS '고객ID';
COMMENT ON COLUMN cst_info.name IS '고객명';
COMMENT ON COLUMN cst_info.birth IS '출생년도';
COMMENT ON COLUMN cst_info.mobile IS '핸드폰번호';
COMMENT ON COLUMN cst_info.point IS '포인트적립';
COMMENT ON COLUMN cst_info.reg_day IS '등록일자';
COMMENT ON TABLE cst_info IS '고객정보 테이블';

SELECT * FROM USER_TAB_COMMENTS;
SELECT * FROM USER_COL_COMMENTS;

-- 메뉴 테이블
CREATE TABLE menu(
    mnu_id VARCHAR2(20) NOT NULL,
    mnu_type VARCHAR2(20) NOT NULL,
    mnu_nm VARCHAR2(20) NOT NULL,
    mnu_price NUMBER(10) DEFAULT 0 NOT NULL,
    use_yn CHAR(1) DEFAULT 'Y' NOT NULL,
    reg_day DATE DEFAULT SYSDATE NOT NULL,
    CONSTRAINT pk_menu PRIMARY KEY(mnu_id)
);

COMMENT ON COLUMN menu.mnu_id IS '메뉴ID';
COMMENT ON COLUMN menu.mnu_type IS '메뉴 타입:커피/맥주';
COMMENT ON COLUMN menu.mnu_nm IS '메뉴명칭';
COMMENT ON COLUMN menu.mnu_price IS '메뉴가격';
COMMENT ON COLUMN menu.use_yn IS '사용유무';
COMMENT ON COLUMN menu.reg_day IS '등록일자';
COMMENT ON TABLE menu IS '메뉴 테이블';

-- 메뉴 옵션 테이블
CREATE TABLE menu_opt(
    mnu_type VARCHAR2(20) NOT NULL,
    mnu_opt VARCHAR2(20) NOT NULL,
    mnu_price NUMBER(10) NOT NULL,
    reg_day DATE DEFAULT SYSDATE,
    CONSTRAINT pk_menu_opt PRIMARY KEY(mnu_type, mnu_opt)
);
COMMENT ON COLUMN menu_opt.mnu_type IS '메뉴 타입:커피/맥주';
COMMENT ON COLUMN menu_opt.mnu_opt IS '옵션정보:Size(CC) , Ice';
COMMENT ON COLUMN menu_opt.mnu_price IS '옵션가격';
COMMENT ON COLUMN menu_opt.reg_day IS '등록일자';
COMMENT ON TABLE menu_opt IS '메뉴 옵션 테이블 : 기본 메뉴금액에 옵션가를 추가';

-- #테이블 생성2
-- Cart(장바구니) 테이블
CREATE TABLE tmp_ord(
    cst_id VARCHAR2(20) NOT NULL,
    mnu_id VARCHAR2(20) NOT NULL,
    mnu_size VARCHAR2(20) DEFAULT 'N' NOT NULL, -- 강사님께서 DEFAULT로 NULL이 들어가는 것을
    mnu_ice VARCHAR2(20) DEFAULT 'N' NOT NULL,  -- 좋아하지 않으셔서 'N'을 넣었다고 얘기함
    qty NUMBER(10) NOT NULL CONSTRAINT qty_nozero CHECK(qty>0),
    -- 수량은 0보다 커야 한다는 제약조건을 넣었다. CHECK구문을 사용하면 편하다.
    -- 제약조건 설정을 별도로 컬럼선언처럼 별도로 선언할 수도 있지만 컬럼 옆에
    -- 그 컬럼에 대한 제약조건을 컬럼선언과 동시에 선언할 수 있다.
    point_use NUMBER(10) DEFAULT 0 NOT NULL,
    reg_day DATE DEFAULT SYSDATE,
    CONSTRAINT pk_tmp_ord PRIMARY KEY(cst_id, mnu_id)
    -- 별도로 제약조건 선언
);

COMMENT ON COLUMN tmp_ord.cst_id IS '고객ID : cst_info.cst_id';
COMMENT ON COLUMN tmp_ord.mnu_id IS '메뉴ID : menu.mnu_id';
COMMENT ON COLUMN tmp_ord.mnu_size IS '메뉴 size : menu_opt.mnu_opt';
COMMENT ON COLUMN tmp_ord.mnu_ice IS '메뉴 Ice : menu_opt.mnu_opt';
COMMENT ON COLUMN tmp_ord.qty IS '주문수량, 0 보다 커야 함';
COMMENT ON COLUMN tmp_ord.reg_day IS '등록일자';
COMMENT ON TABLE tmp_ord IS 'Cart (장바구니) 테이블';

-- MySQL이나 MariaDB는 AUTO_INCREMENT 가 있다. 그래서 컬럼에 AUTO_INCREMENT를 
-- 적용시켜주면 컬럼이 자동으로 증가된다. 하지만 Oracle에는 그런 기능이 없다. 
-- Oracle에서 그런 기능(AUTO_INCREMENT, 자동 증가)을 사용할 수 있도록 하는 것이 
-- SEQUENCE이다. 

-- 1) SEQUENCE를 만들자.
-- CREATE SEQUENCE {DB스키마명.}[시퀀스명] {속성1}{속성2}{속성3}...
CREATE SEQUENCE sq_real_ord
    INCREMENT BY 1     -- INCREMENT BY : 시퀀스 실행 시 증가시킬 값
    START WITH 1000000 -- START WITH : 시퀀스의 시작값이다.(MINVALUE보다 크거나 같아야 한다.)
    MINVALUE 1         -- MINVALUE : 시퀀스가 시작되는 최솟값이다.
    MAXVALUE 9999999   -- MAXVALUE : 시퀀스가 끝나는 값이다.
    NOCYCLE            -- NOCYCLE | CYCLE : NOCYCLE(반복안함), CYCLE(시퀀스의 최댓값에 도달 시 최솟값 1부터 다시시작)
    CACHE 20           -- NOCACHE | CACHE : NOCACHE(사용안함), CACHE(캐시를 사용하여 미리 값을 할당해 놓아서 속도가 빠르며, 동시 사용자가 많을 경우 유리)
    NOORDER;           -- NOORDER | ORDER : NOORDER(사용안함)
                       --                   ORDER(요청 순서로 값을 생성하여 발생 순서를 보장하지만 조금의 시스템 부하가 있음)
-- 2) 만든 SEQUENCE를 사용해 보자
-- [만든 시퀀스명].NEXTVAL : 시퀀스의 다음 값을 넣어라
CREATE TABLE real_ord(
    -- 주문서 테이블 생성
    ord_no NUMBER(10) DEFAULT sq_real_ord.NEXTVAL NOT NULL,
    -- ord_no컬럼에 다음 시퀀스 값을 넣으라고 설정했기 때문에 ord_no컬럼에 값을 넣지 않아도 
    -- MySQL의 AUTO_INCREMENT처럼 값이 증가되어 들어간다.
    ord_seq NUMBER(5) NOT NULL,
    cst_id VARCHAR2(20),
    mnu_id VARCHAR2(20),
    mnu_size VARCHAR2(20) DEFAULT 'N' NOT NULL,
    mnu_ice VARCHAR2(20) DEFAULT 'N' NOT NULL,
    qty NUMBER(10) NOT NULL ENABLE,
    price NUMBER(10),
    total_price NUMBER(10),
    point_use NUMBER(10,0) DEFAULT 0 NOT NULL,
    -- point_use : 얼마만큼의 포인트를 사용했는지를 의미한다.
    -- "포인트로 살게요,포인트를 사용할게요!"하면 point_use컬럼에 값이 들어간다.
    point_add NUMBER(10,0) DEFAULT 0 NOT NULL,
    -- point_add : 추가해야할 포인트는 얼마인지를 의미한다.
    -- 포인트를 사용하지 않고 주문했을때, 1%를 적립해 준다던지 그러한 내용은 point_add에
    -- 넣은 다음에 고객정보의 포인트에 넣어주면 된다.
    reg_day DATE DEFAULT SYSDATE,
    CONSTRAINT pk_real_ord PRIMARY KEY(ord_no,ord_seq)
);
COMMENT ON COLUMN real_ord.ord_seq IS '주문순차';
COMMENT ON COLUMN real_ord.cst_id IS '고객ID';
COMMENT ON COLUMN real_ord.mnu_id IS '메뉴ID';
COMMENT ON COLUMN real_ord.mnu_size IS '메뉴 size : menu_opt.mnu_opt';
COMMENT ON COLUMN real_ord.mnu_ice IS '메뉴 Ice : menu_opt.mnu_opt';
COMMENT ON COLUMN real_ord.qty IS '주문수량 , 0 보다 커야 함';
COMMENT ON COLUMN real_ord.price IS '단가';
COMMENT ON COLUMN real_ord.total_price IS '주문금액 : 수량 * 단가';
COMMENT ON COLUMN real_ord.point_use IS '포인트 : 사용포인트';
COMMENT ON COLUMN real_ord.point_add IS '포인트 : 추가포인트';
COMMENT ON COLUMN real_ord.reg_day IS '등록일자';
