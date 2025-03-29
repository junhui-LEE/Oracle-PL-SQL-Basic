-- GOTO 구문
BEGIN
--    <<last_mission>>   <-- 여기 라벨을 선언하면 무한루프 돈다.
--    dbms_output.put_line('Goto move');
    FOR fc IN (SELECT * FROM TAB)
    LOOP
        dbms_output.put_line(fc.tname);
        IF fc.tname='COFFEE_MENU' THEN
            goto last_mission;
        END IF;    
    END LOOP;
    <<last_mission>>
    dbms_output.put_line('Goto move');
END;
