CREATE OR REPLACE PACKAGE AssetPackage AS

    PROCEDURE CheckoutAsset
    (
        p_EmployeeID NUMBER,
        p_AssetID NUMBER,
        p_ExpectedReturnDate DATE
    );

    PROCEDURE ReturnAsset
    (
        p_CheckoutID NUMBER
    );

    FUNCTION TotalBorrowedAssets
    (
        p_EmployeeID NUMBER
    )
    RETURN NUMBER;

END AssetPackage;
/



package body



CREATE OR REPLACE PACKAGE BODY AssetPackage AS

    ...

END AssetPackage;
/
