IF v_Status <> 'Available' THEN

    RAISE_APPLICATION_ERROR
    (
        -20001,
        'Asset is not available'
    );

END IF;
