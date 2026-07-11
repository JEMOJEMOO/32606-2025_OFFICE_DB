CREATE OR REPLACE PROCEDURE assign_asset(
p_employee_id NUMBER,
p_asset_id NUMBER
)
AS
BEGIN

INSERT INTO assignments
VALUES(
assignment_seq.NEXTVAL,
p_employee_id,
p_asset_id,
SYSDATE
);

END;
/
