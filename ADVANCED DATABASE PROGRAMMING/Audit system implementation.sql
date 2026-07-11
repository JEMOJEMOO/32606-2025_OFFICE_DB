CREATE OR REPLACE TRIGGER Asset_Audit_Trigger
AFTER UPDATE ON Asset
FOR EACH ROW
BEGIN

    INSERT INTO AssetAudit
    (
        ...
    )
    VALUES
    (
        ...
    );

END;
/
