-- =====================================================
-- Office Asset Tracker System
-- File: create_tables.sql
-- Description: Database Table Creation
-- =====================================================

-- =====================================================
-- Department Table
-- Stores office departments
-- =====================================================

CREATE TABLE departments
(

```
department_id NUMBER PRIMARY KEY,

department_name VARCHAR2(100) NOT NULL
```

);

-- =====================================================
-- Employee Table
-- Stores employee information
-- =====================================================

CREATE TABLE employees
(

```
employee_id NUMBER PRIMARY KEY,

first_name VARCHAR2(50),

last_name VARCHAR2(50),

email VARCHAR2(100),

phone_number VARCHAR2(20),

department_id NUMBER,

CONSTRAINT fk_employee_department

FOREIGN KEY(department_id)

REFERENCES departments(department_id)
```

);

-- =====================================================
-- Asset Table
-- Stores office assets
-- =====================================================

CREATE TABLE assets
(

```
asset_id NUMBER PRIMARY KEY,

asset_name VARCHAR2(100) NOT NULL,

asset_type VARCHAR2(50),

serial_number VARCHAR2(100) UNIQUE,

purchase_date DATE,

asset_value NUMBER,

asset_status VARCHAR2(30)
```

);

-- =====================================================
-- Assignment Table
-- Tracks asset allocation
-- =====================================================

CREATE TABLE assignments
(

```
assignment_id NUMBER PRIMARY KEY,

employee_id NUMBER,

asset_id NUMBER,

assignment_date DATE,

return_date DATE,

assignment_status VARCHAR2(30),


CONSTRAINT fk_assignment_employee

FOREIGN KEY(employee_id)

REFERENCES employees(employee_id),


CONSTRAINT fk_assignment_asset

FOREIGN KEY(asset_id)

REFERENCES assets(asset_id)
```

);

-- =====================================================
-- Maintenance Table
-- Stores asset maintenance records
-- =====================================================

CREATE TABLE maintenance
(

```
maintenance_id NUMBER PRIMARY KEY,

asset_id NUMBER,

maintenance_date DATE,

description VARCHAR2(200),

cost NUMBER,


CONSTRAINT fk_maintenance_asset

FOREIGN KEY(asset_id)

REFERENCES assets(asset_id)
```

);

-- =====================================================
-- Public Holidays Reference Table
-- Used by business rule triggers
-- =====================================================

CREATE TABLE public_holidays
(

```
holiday_id NUMBER PRIMARY KEY,

holiday_name VARCHAR2(100),

holiday_date DATE
```

);

-- =====================================================
-- Audit Table
-- Stores database changes
-- =====================================================

CREATE TABLE asset_audit
(

```
audit_id NUMBER PRIMARY KEY,

username VARCHAR2(50),

action_type VARCHAR2(30),

action_date DATE,

asset_id NUMBER
```

);

-- =====================================================
-- User Activity Tracking Table
-- =====================================================

CREATE TABLE user_activity_log
(

```
activity_id NUMBER PRIMARY KEY,

username VARCHAR2(50),

activity_type VARCHAR2(50),

activity_time DATE
```

);

-- =====================================================
-- End of create_tables.sql
-- =====================================================
