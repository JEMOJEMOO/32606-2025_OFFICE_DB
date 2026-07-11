-- =====================================================
-- Office Asset Tracker System
-- File: procedures.sql
-- Description: Stored Procedures for Asset Management
-- =====================================================

-- =====================================================
-- Procedure 1: Assign Asset to Employee
-- Purpose:
-- Assigns an available asset to an employee
-- =====================================================

CREATE OR REPLACE PROCEDURE assign_asset (
p_employee_id NUMBER,
p_asset_id NUMBER
)
AS
v_status VARCHAR2(20);
BEGIN

```
-- Check asset availability
SELECT asset_status
INTO v_status
FROM assets
WHERE asset_id = p_asset_id;


IF v_status <> 'Available' THEN

    RAISE_APPLICATION_ERROR(
        -20001,
        'Asset is not available for assignment'
    );

END IF;


-- Insert assignment record
INSERT INTO assignments
(
    assignment_id,
    employee_id,
    asset_id,
    assignment_date,
    assignment_status
)
VALUES
(
    assignment_seq.NEXTVAL,
    p_employee_id,
    p_asset_id,
    SYSDATE,
    'Assigned'
);


-- Update asset status
UPDATE assets
SET asset_status = 'Assigned'
WHERE asset_id = p_asset_id;


COMMIT;
```

EXCEPTION

```
WHEN NO_DATA_FOUND THEN

    RAISE_APPLICATION_ERROR(
        -20002,
        'Asset does not exist'
    );
```

END assign_asset;
/

-- =====================================================
-- Procedure 2: Return Asset
-- Purpose:
-- Returns an assigned asset back to available status
-- =====================================================

CREATE OR REPLACE PROCEDURE return_asset (
p_assignment_id NUMBER
)
AS

```
v_asset_id NUMBER;
```

BEGIN

```
-- Get asset linked to assignment
SELECT asset_id
INTO v_asset_id
FROM assignments
WHERE assignment_id = p_assignment_id;



-- Update assignment
UPDATE assignments

SET
    assignment_status = 'Returned',
    return_date = SYSDATE

WHERE assignment_id = p_assignment_id;



-- Make asset available again
UPDATE assets

SET
    asset_status = 'Available'

WHERE asset_id = v_asset_id;



COMMIT;
```

EXCEPTION

```
WHEN NO_DATA_FOUND THEN

    RAISE_APPLICATION_ERROR(
        -20003,
        'Assignment record not found'
    );
```

END return_asset;
/

-- =====================================================
-- Procedure 3: Record Asset Maintenance
-- Purpose:
-- Adds maintenance information for an asset
-- =====================================================

CREATE OR REPLACE PROCEDURE add_maintenance_record (

```
p_asset_id NUMBER,
p_description VARCHAR2,
p_cost NUMBER
```

)

AS

BEGIN

```
INSERT INTO maintenance

(
    maintenance_id,
    asset_id,
    maintenance_date,
    description,
    cost
)

VALUES

(
    maintenance_seq.NEXTVAL,
    p_asset_id,
    SYSDATE,
    p_description,
    p_cost
);


COMMIT;
```

END add_maintenance_record;
/

-- =====================================================
-- Procedure 4: Update Asset Status
-- Purpose:
-- Changes the status of an asset
-- =====================================================

CREATE OR REPLACE PROCEDURE update_asset_status (

```
p_asset_id NUMBER,
p_new_status VARCHAR2
```

)

AS

BEGIN

```
UPDATE assets

SET asset_status = p_new_status

WHERE asset_id = p_asset_id;



IF SQL%ROWCOUNT = 0 THEN

    RAISE_APPLICATION_ERROR(
        -20004,
        'Asset not found'
    );

END IF;


COMMIT;
```

END update_asset_status;
/

-- End of procedures.sql
