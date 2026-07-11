-- =====================================================
-- Office Asset Tracker System
-- File: functions.sql
-- Description: Functions for Asset Management
-- =====================================================

-- =====================================================
-- Function 1: Count Total Assets
-- Purpose:
-- Returns the total number of assets in the system
-- =====================================================

CREATE OR REPLACE FUNCTION total_assets
RETURN NUMBER

IS

```
v_total NUMBER;
```

BEGIN

```
SELECT COUNT(*)
INTO v_total
FROM assets;


RETURN v_total;
```

END total_assets;
/

-- =====================================================
-- Function 2: Count Available Assets
-- Purpose:
-- Returns number of assets currently available
-- =====================================================

CREATE OR REPLACE FUNCTION available_assets
RETURN NUMBER

IS

```
v_available NUMBER;
```

BEGIN

```
SELECT COUNT(*)
INTO v_available
FROM assets
WHERE asset_status = 'Available';


RETURN v_available;
```

END available_assets;
/

-- =====================================================
-- Function 3: Calculate Total Asset Value
-- Purpose:
-- Calculates the total monetary value of all assets
-- =====================================================

CREATE OR REPLACE FUNCTION total_asset_value
RETURN NUMBER

IS

```
v_value NUMBER;
```

BEGIN

```
SELECT SUM(asset_value)
INTO v_value
FROM assets;


RETURN NVL(v_value,0);
```

END total_asset_value;
/

-- =====================================================
-- Function 4: Get Employee Asset Count
-- Purpose:
-- Returns number of assets assigned to an employee
-- =====================================================

CREATE OR REPLACE FUNCTION employee_asset_count

(
p_employee_id NUMBER
)

RETURN NUMBER

IS

```
v_count NUMBER;
```

BEGIN

```
SELECT COUNT(*)

INTO v_count

FROM assignments

WHERE employee_id = p_employee_id

AND assignment_status = 'Assigned';



RETURN v_count;
```

END employee_asset_count;
/

-- =====================================================
-- Function 5: Check Asset Status
-- Purpose:
-- Returns the current status of an asset
-- =====================================================

CREATE OR REPLACE FUNCTION get_asset_status

(
p_asset_id NUMBER
)

RETURN VARCHAR2

IS

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

END get_asset_status;
/

-- =====================================================
-- Function 6: Calculate Maintenance Cost
-- Purpose:
-- Returns total maintenance cost for an asset
-- =====================================================

CREATE OR REPLACE FUNCTION asset_maintenance_cost

(
p_asset_id NUMBER
)

RETURN NUMBER

IS

```
v_cost NUMBER;
```

BEGIN

```
SELECT SUM(cost)

INTO v_cost

FROM maintenance

WHERE asset_id = p_asset_id;



RETURN NVL(v_cost,0);
```

END asset_maintenance_cost;
/

-- End of functions.sql
