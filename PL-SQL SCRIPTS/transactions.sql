BEGIN

    UPDATE assets

    SET asset_status = 'Assigned'

    WHERE asset_id = 1001;


    SAVEPOINT before_change;


    DELETE FROM assignments

    WHERE assignment_id = 1;


    ROLLBACK TO before_change;


    COMMIT;


END;
/
