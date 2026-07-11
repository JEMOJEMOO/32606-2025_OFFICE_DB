-- =====================================================
-- Office Asset Tracker System
-- File: queries.sql
-- Description: SQL Queries for Reports and Analysis
-- =====================================================

-- =====================================================
-- Query 1: Display All Employees With Their Departments
-- Purpose:
-- Shows employee information and department details
-- =====================================================

SELECT

```
e.employee_id,

e.first_name,

e.last_name,

e.email,

d.department_name
```

FROM employees e

JOIN departments d

ON e.department_id = d.department_id;

-- =====================================================
-- Query 2: Display All Assets
-- Purpose:
-- Shows complete asset inventory
-- =====================================================

SELECT

```
asset_id,

asset_name,

asset_type,

serial_number,

asset_value,

asset_status
```

FROM assets;

-- =====================================================
-- Query 3: Display Assigned Assets
-- Purpose:
-- Shows which employee has which asset
-- =====================================================

SELECT

```
e.first_name || ' ' || e.last_name AS employee_name,

a.asset_name,

a.asset_type,

ass.assignment_date,

ass.assignment_status
```

FROM employees e

JOIN assignments ass

ON e.employee_id = ass.employee_id

JOIN assets a

ON ass.asset_id = a.asset_id;

-- =====================================================
-- Query 4: Count Assets By Status
-- Purpose:
-- Shows available, assigned, and maintained assets
-- =====================================================

SELECT

```
asset_status,

COUNT(*) AS total_assets
```

FROM assets

GROUP BY asset_status;

-- =====================================================
-- Query 5: Total Asset Value
-- Purpose:
-- Calculates total value of all assets
-- =====================================================

SELECT

```
SUM(asset_value) AS total_asset_value
```

FROM assets;

-- =====================================================
-- Query 6: Assets Per Department
-- Purpose:
-- Shows asset distribution among departments
-- =====================================================

SELECT

```
d.department_name,

COUNT(a.asset_id) AS total_assets
```

FROM departments d

JOIN employees e

ON d.department_id = e.department_id

JOIN assignments ass

ON e.employee_id = ass.employee_id

JOIN assets a

ON ass.asset_id = a.asset_id

GROUP BY d.department_name;

-- =====================================================
-- Query 7: Employees With More Than One Asset
-- Purpose:
-- Identifies employees managing multiple assets
-- =====================================================

SELECT

```
e.first_name,

e.last_name,

COUNT(ass.asset_id) AS asset_count
```

FROM employees e

JOIN assignments ass

ON e.employee_id = ass.employee_id

WHERE ass.assignment_status = 'Assigned'

GROUP BY

```
e.first_name,

e.last_name
```

HAVING COUNT(ass.asset_id) > 1;

-- =====================================================
-- Query 8: Maintenance Cost Report
-- Purpose:
-- Shows maintenance expenses per asset
-- =====================================================

SELECT

```
a.asset_name,

SUM(m.cost) AS total_maintenance_cost
```

FROM assets a

JOIN maintenance m

ON a.asset_id = m.asset_id

GROUP BY a.asset_name;

-- =====================================================
-- Query 9: Recently Added Assets
-- Purpose:
-- Displays newest assets
-- =====================================================

SELECT

```
asset_name,

purchase_date,

asset_value
```

FROM assets

ORDER BY purchase_date DESC;

-- =====================================================
-- Query 10: Audit History
-- Purpose:
-- Shows changes performed on assets
-- =====================================================

SELECT

```
username,

action_type,

action_date,

asset_id
```

FROM asset_audit

ORDER BY action_date DESC;

-- =====================================================
-- Query 11: Available Assets
-- Purpose:
-- Finds assets ready for assignment
-- =====================================================

SELECT

```
asset_id,

asset_name,

asset_type
```

FROM assets

WHERE asset_status = 'Available';

-- =====================================================
-- Query 12: Department Employee Count
-- Purpose:
-- Shows number of employees per department
-- =====================================================

SELECT

```
d.department_name,

COUNT(e.employee_id) AS employee_count
```

FROM departments d

LEFT JOIN employees e

ON d.department_id = e.department_id

GROUP BY d.department_name;

-- =====================================================
-- End of queries.sql
-- =====================================================
