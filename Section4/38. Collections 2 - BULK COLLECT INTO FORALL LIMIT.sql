--DECLARE
--    TYPE NL_CST_INFO IS TABLE OF CST_INFO%ROWTYPE; -- Nested Tables
--    I_CST_INFO NL_CST_INFO := NL_CST_INFO(); -- 변수 생성
--BEGIN
--    SELECT *
--    BULK COLLECT INTO I_CST_INFO
--    FROM CST_INFO;
--    
--END
--;
--
CREATE TABLE CST_INFO2 AS SELECT * FROM CST_INFO;
SELECT * FROM CST_INFO2;
INSERT INTO CST_INFO2(SELECT * FROM CST_INFO);
DELETE FROM CST_INFO2;
DROP TABLE CST_INFO2;
--
--DECLARE
--    TYPE NL_CST_INFO IS TABLE OF CST_INFO%ROWTYPE; -- Nested Table
--    I_CST_INFO NL_CST_INFO := NL_CST_INFO(); -- 초기화
--BEGIN
--    SELECT * 
--    BULK COLLECT INTO I_CST_INFO
--    FROM CST_INFO;
--    DBMS_OUTPUT.PUT_LINE(CHR(10)||CHR(13));
--    FORALL indx IN I_CST_INFO.FIRST..I_CST_INFO.COUNT
--        INSERT INTO CST_INFO2(
--            CST_ID, NAME, 
--            BIRTH, MOBILE, 
--            POINT, REG_DAY
--        )
--        VALUES(
--            I_CST_INFO(indx).CST_ID, I_CST_INFO(indx).NAME,
--            I_CST_INFO(indx).BIRTH, I_CST_INFO(indx).MOBILE,
--            I_CST_INFO(indx).POINT, I_CST_INFO(indx).REG_DAY
--        );
--        UPDATE CST_INFO2 SET CST_ID = CST_ID||'dd', NAME = NAME||'aa'
--        ;
--END;

ALTER TABLE JUNHEE.CST_INFO2
ADD CONSTRAINT PK_CST_INFO2 PRIMARY KEY (CST_ID);

ALTER TABLE JUNHEE.CST_INFO2
DROP CONSTRAINT PK_CST_INFO2;

DECLARE
    TYPE NL_CST_INFO IS TABLE OF CST_INFO%ROWTYPE; -- Nested Table
    I_CST_INFO NL_CST_INFO := NL_CST_INFO(); -- 초기화
    MY_CURSOR SYS_REFCURSOR; -- WEAK CURSOR VARIABLE
BEGIN
    OPEN MY_CURSOR FOR SELECT * FROM CST_INFO;
    LOOP
        FETCH MY_CURSOR BULK COLLECT INTO I_CST_INFO LIMIT 2;
        -- 기존 2개로 초기화 된 I_CST_INFO에 추가로 2개의 key-value들이 생기는 것이
        -- 아니라 매번 새로운 컬렉션 내용을 새로 덮어 쓴다. BULT COLLECT INTO 는
        -- 기본적으로 대상 컬렉션을 새 FETCH 결과로 교체한다. 
        FORALL indx IN I_CST_INFO.FIRST..I_CST_INFO.COUNT
            INSERT INTO CST_INFO2(
                CST_ID, NAME, 
                BIRTH, MOBILE, 
                POINT, REG_DAY
            )
            VALUES(
                I_CST_INFO(indx).CST_ID, I_CST_INFO(indx).NAME,
                I_CST_INFO(indx).BIRTH, I_CST_INFO(indx).MOBILE,
                I_CST_INFO(indx).POINT, I_CST_INFO(indx).REG_DAY
            );
        DBMS_OUTPUT.PUT_LINE('asdf');
        EXIT WHEN MY_CURSOR%NOTFOUND;
    END LOOP;
    CLOSE MY_CURSOR;
END;




