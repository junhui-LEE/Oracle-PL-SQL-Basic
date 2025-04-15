-- 고객정보 테이블 - cst_info
INSERT INTO cst_info (cst_id, name, birth, mobile, point, reg_day) 
VALUES ('C001', '홍길동1', 20080304, '010-0000-1111', 100, SYSDATE);
INSERT INTO cst_info (cst_id, name, birth, mobile, point, reg_day)
VALUES ('C002', '홍길동2', 20000304, '010-0000-1112', 0, SYSDATE);
INSERT INTO cst_info (cst_id, name, birth, mobile, point, reg_day)
VALUES ('C003', '홍길동3', 19950304, '010-0000-1113', 5000, SYSDATE);
INSERT INTO cst_info (cst_id, name, birth, mobile, point, reg_day)
VALUES ('C004', '홍길동4', 19700304, '010-0000-1114', 0, SYSDATE);
INSERT INTO cst_info (cst_id, name, birth, mobile, point, reg_day)
VALUES ('C005', '홍길동5', 19600304, '010-0000-1115', 0, SYSDATE);

-- 메뉴 테이블 - menu
INSERT INTO menu (mnu_id, mnu_type, mnu_nm, mnu_price, use_yn, reg_day)
VALUES ('M001', '커피', '아메리카노', 3000, 'Y', SYSDATE);
INSERT INTO menu (mnu_id, mnu_type, mnu_nm, mnu_price, use_yn, reg_day)
VALUES ('M002', '커피', '카페라떼', 4000, 'Y', SYSDATE);
INSERT INTO menu (mnu_id, mnu_type, mnu_nm, mnu_price, use_yn, reg_day)
VALUES ('M003', '커피', '카푸치노', 4000, 'Y', SYSDATE);
INSERT INTO menu (mnu_id, mnu_type, mnu_nm, mnu_price, use_yn, reg_day)
VALUES ('M004', '맥주', '생맥주', 5000, 'Y', SYSDATE);
INSERT INTO menu (mnu_id, mnu_type, mnu_nm, mnu_price, use_yn, reg_day)
VALUES ('M005', '맥주', '흑맥주', 6000, 'Y', SYSDATE);

-- 메뉴 옵션 테이블 - menu_opt
INSERT INTO menu_opt (mnu_type, mnu_opt, opt_price, reg_day)
VALUES ('커피', 'M', 500, SYSDATE);
INSERT INTO menu_opt (mnu_type, mnu_opt, opt_price, reg_day)
VALUES ('커피', 'L', 1000, SYSDATE);
INSERT INTO menu_opt (mnu_type, mnu_opt, opt_price, reg_day)
VALUES ('커피', 'ICE', 500, SYSDATE);
INSERT INTO menu_opt (mnu_type, mnu_opt, opt_price, reg_day)
VALUES ('맥주', '1000', 5000, SYSDATE);
INSERT INTO menu_opt (mnu_type, mnu_opt, opt_price, reg_day)
VALUES ('맥주', '3000', 10000, SYSDATE);
INSERT INTO menu_opt (mnu_type, mnu_opt, opt_price, reg_day)
VALUES ('맥주', '5000', 20000, SYSDATE);

-- 장바구니 테이블 - tmp_ord
INSERT INTO tmp_ord (cst_id, mnu_id, mnu_size, mnu_ice, qty, point_use, reg_day)
VALUES ('C001', 'M001', 'M', 'N', 2, 0, SYSDATE);
INSERT INTO tmp_ord (cst_id, mnu_id, mnu_size, mnu_ice, qty, point_use, reg_day)
VALUES ('C002', 'M002', 'L', 'ICE', 3, 0, SYSDATE);
INSERT INTO tmp_ord (cst_id, mnu_id, mnu_size, mnu_ice, qty, point_use, reg_day)
VALUES ('C003', 'M004', '3000', 'N', 1, 3000, SYSDATE);

-- 메뉴옵션 테이블 - menu_opt
INSERT INTO menu_opt(mnu_type, mnu_opt, opt_price, reg_day)
VALUES('커피', 'M', 500, SYSDATE);
INSERT INTO menu_opt(mnu_type, mnu_opt, opt_price, reg_day)
VALUES('커피', 'L', 1000, SYSDATE);
INSERT INTO menu_opt(mnu_type, mnu_opt, opt_price, reg_day)
VALUES('커피', 'ICE', 500, SYSDATE);
INSERT INTO menu_opt(mnu_type, mnu_opt, opt_price, reg_day)
VALUES('맥주', '1000', 5000, SYSDATE);
INSERT INTO menu_opt(mnu_type, mnu_opt, opt_price, reg_day)
VALUES('맥주', '3000', 10000, SYSDATE);
INSERT INTO menu_opt(mnu_type, mnu_opt, opt_price, reg_day)
VALUES('맥주', '5000', 20000, SYSDATE);
