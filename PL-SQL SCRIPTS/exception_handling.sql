DECLARE

    v_asset_name VARCHAR2(100);


BEGIN


    SELECT asset_name

    INTO v_asset_name

    FROM assets

    WHERE asset_id = 9999;


    DBMS_OUTPUT.PUT_LINE(v_asset_name);



EXCEPTION


    WHEN NO_DATA_FOUND THEN

        DBMS_OUTPUT.PUT_LINE(
            'Asset does not exist'
        );


    WHEN TOO_MANY_ROWS THEN

        DBMS_OUTPUT.PUT_LINE(
            'More than one record found'
        );


    WHEN OTHERS THEN

        DBMS_OUTPUT.PUT_LINE(
            'Unexpected error occurred'
        );


END;
/
