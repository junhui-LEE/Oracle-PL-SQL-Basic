create or replace NONEDITIONABLE FUNCTION F_GET_OPT_PRICE 
(
  P_MNU_ID IN VARCHAR2 
, P_MNU_OPT IN VARCHAR2 
) RETURN NUMBER AS 
    v_mnu_type menu.mnu_type%TYPE;
    v_opt_price menu_opt.opt_price%TYPE;
BEGIN
    SELECT mnu_type
    INTO v_mnu_type
    FROM menu
    WHERE mnu_id = p_mnu_id;
    
    SELECT opt_price
    INTO v_opt_price
    FROM menu_opt
    WHERE mnu_type = v_mnu_type 
        AND mnu_opt = p_mnu_opt;
    RETURN v_opt_price;
EXCEPTION WHEN OTHERS THEN
    RETURN 0;
END F_GET_OPT_PRICE;
