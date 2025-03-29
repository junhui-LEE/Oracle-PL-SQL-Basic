-- NULL Statement
BEGIN
    FOR fc IN(SELECT * FROM TAB)
    LOOP
        dbms_output.put_line(fc.tname);
        IF fc.tname='SAMPLE' THEN
            dbms_output.put_line(fc.tname);
            goto last_mission;
        ELSE
            NULL;
            dbms_output.put_line('a');
            /*
            dbms_output.put_line(1);
            dbms_output.put_line(2);
            dbms_output.put_line(3);
            dbms_output.put_line(4);
            */
        END IF;
    END LOOP;
    <<last_mission>>
    dbms_output.put_line('Goto move');
    dbms_output.put_line('b'); 
    EXCEPTION WHEN OTHERS THEN
        NULL;
        dbms_output.put_line('c');
        dbms_output.put_line('d');
END;
