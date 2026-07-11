CREATE OR REPLACE PROCEDURE CheckoutAsset
(
    p_EmployeeID NUMBER,
    p_AssetID NUMBER,
    p_ExpectedReturnDate DATE
)
AS
BEGIN
    ...
END CheckoutAsset;
/



returnasset






CREATE OR REPLACE PROCEDURE ReturnAsset
(
    p_CheckoutID NUMBER
)
AS
BEGIN
    ...
END ReturnAsset;
/






overdueasset




CREATE OR REPLACE PROCEDURE ShowOverdueAssets
AS
BEGIN
    ...
END ShowOverdueAssets;
/
