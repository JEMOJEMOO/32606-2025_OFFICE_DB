--SELECT
SELECT Status
INTO v_Status
FROM Asset
WHERE AssetID = p_AssetID;

--INSERT
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


--UPDATE
UPDATE Asset
SET Status='Checked Out'
WHERE AssetID=p_AssetID;



--DDL OPERATION 
--CREATE TABLE

CREATE TABLE Asset
(
    AssetID NUMBER PRIMARY KEY,
    AssetName VARCHAR2(100),
    Status VARCHAR2(20)
);



--ALTER TABLE

ALTER TABLE Asset
ADD CONSTRAINT chk_status
CHECK (Status IN
('Available',
 'Checked Out',
 'Maintenance'));


--CREATE PACKAGE
CREATE PACKAGE AssetPackage

--CREATE PROCEDURE
CREATE PROCEDURE CheckoutAsset

--CREATE FUNCTION
CREATE FUNCTION TotalBorrowedAssets


