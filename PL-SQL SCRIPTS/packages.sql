-- =====================================================
-- Office Asset Tracker System
-- File: packages.sql
-- Description: Asset Management Package
-- =====================================================

-- =====================================================
-- PACKAGE SPECIFICATION
-- Contains declarations of procedures and functions
-- =====================================================

CREATE OR REPLACE PACKAGE asset_management_pkg

AS

```
-- Assign asset to employee
PROCEDURE assign_asset (

    p_employee_id NUMBER,
    p_asset_id NUMBER

);


-- Return asset from employee
PROCEDURE return_asset (

    p_assignment_id NUMBER

);


-- Update asset status
PROCEDURE update_status (

    p_asset_id NUMBER,
    p_status VARCHAR2

);


-- Get current asset status
FUNCTION check_status (

    p_asset_id NUMBER

)

RETURN VARCHAR2;



-- Count employee assigned assets
FUNCTION employee_assets (

    p_employee_id NUMBER

)

RETURN NUMBER;
```

END asset_management_pkg;
/

-- =====================================================
-- PACKAGE BODY
-- Contains actual implementation
-- =====================================================

CREATE OR REPLACE PACKAGE BODY asset_management_pkg

AS

-- =====================================================
-- Procedure: Assign Asset
-- =====================================================

PROCEDURE assign_asset (

```
p_employee_id NUMBER,
p_asset_id NUMBER
```

)

AS

```
v_status VARCHAR2(50);
```

BEGIN

```
SELECT asset_status

INTO v_status

FROM assets

WHERE asset_id = p_asset_id;



IF v_status <> 'Available' THEN


    RAISE_APPLICATION_ERROR(

        -20101,

        'Asset is currently unavailable'

    );


END IF;



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



UPDATE assets

SET asset_status = 'Assigned'

WHERE asset_id = p_asset_id;



COMMIT;
```

END assign_asset;

-- =====================================================
-- Procedure: Return Asset
-- =====================================================

PROCEDURE return_asset (

```
p_assignment_id NUMBER
```

)

AS

```
v_asset_id NUMBER;
```

BEGIN

```
SELECT asset_id

INTO v_asset_id

FROM assignments

WHERE assignment_id = p_assignment_id;



UPDATE assignments

SET

    assignment_status = 'Returned',

    return_date = SYSDATE


WHERE assignment_id = p_assignment_id;



UPDATE assets

SET asset_status = 'Available'

WHERE asset_id = v_asset_id;



COMMIT;
```

END return_asset;

-- =====================================================
-- Procedure: Update Asset Status
-- =====================================================

PROCEDURE update_status (

```
p_asset_id NUMBER,

p_status VARCHAR2
```

)

AS

BEGIN

```
UPDATE assets

SET asset_status = p_status

WHERE asset_id = p_asset_id;



COMMIT;
```

END update_status;

-- =====================================================
-- Function: Check Asset Status
-- =====================================================

FUNCTION check_status (

```
p_asset_id NUMBER
```

)

RETURN VARCHAR2

AS

```
v_status VARCHAR2(50);
```

BEGIN

```
SELECT asset_status

INTO v_status

FROM assets

WHERE asset_id = p_asset_id;



RETURN v_status;
```

EXCEPTION

```
WHEN NO_DATA_FOUND THEN

    RETURN 'Asset Not Found';
```

END check_status;

-- =====================================================
-- Function: Employee Asset Count
-- =====================================================

FUNCTION employee_assets (

```
p_employee_id NUMBER
```

)

RETURN NUMBER

AS

```
v_total NUMBER;
```

BEGIN

```
SELECT COUNT(*)

INTO v_total

FROM assignments

WHERE employee_id = p_employee_id

AND assignment_status = 'Assigned';



RETURN v_total;
```

END employee_assets;

END asset_management_pkg;
/

-- End of packages.sql
