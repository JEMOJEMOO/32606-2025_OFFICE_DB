CREATE OR REPLACE FUNCTION TotalBorrowedAssets
(
    p_EmployeeID NUMBER
)
RETURN NUMBER
AS
    v_Total NUMBER;
BEGIN

    SELECT COUNT(*)
    INTO v_Total
    FROM CheckoutRecord
    WHERE EmployeeID = p_EmployeeID;

    RETURN v_Total;

END;
/
