INSERT INTO CheckoutRecord
VALUES
(
    v_NewID,
    p_EmployeeID,
    p_AssetID,
    SYSDATE,
    p_ExpectedReturnDate,
    NULL,
    'Borrowed'
);
