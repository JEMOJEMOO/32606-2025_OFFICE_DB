-- =====================================================
-- Office Asset Tracker System
-- File: constraints.sql
-- Description: Additional Database Constraints
-- =====================================================

-- =====================================================
-- 1. Asset Value Constraint
-- Prevents negative asset values
-- =====================================================

ALTER TABLE assets

ADD CONSTRAINT chk_asset_value

CHECK(asset_value >= 0);

-- =====================================================
-- 2. Asset Status Constraint
-- Allows only valid asset statuses
-- =====================================================

ALTER TABLE assets

ADD CONSTRAINT chk_asset_status

CHECK
(
asset_status IN
(
'Available',
'Assigned',
'Under Maintenance',
'Retired'
)
);

-- =====================================================
-- 3. Assignment Status Constraint
-- Controls assignment states
-- =====================================================

ALTER TABLE assignments

ADD CONSTRAINT chk_assignment_status

CHECK
(
assignment_status IN
(
'Assigned',
'Returned'
)
);

-- =====================================================
-- 4. Maintenance Cost Constraint
-- Prevents negative maintenance costs
-- =====================================================

ALTER TABLE maintenance

ADD CONSTRAINT chk_maintenance_cost

CHECK(cost >= 0);

-- =====================================================
-- 5. Employee Email Constraint
-- Ensures email is unique
-- =====================================================

ALTER TABLE employees

ADD CONSTRAINT uq_employee_email

UNIQUE(email);

-- =====================================================
-- 6. Employee Names Required
-- =====================================================

ALTER TABLE employees

MODIFY first_name CONSTRAINT nn_employee_firstname NOT NULL;

ALTER TABLE employees

MODIFY last_name CONSTRAINT nn_employee_lastname NOT NULL;

-- =====================================================
-- 7. Asset Name Required
-- =====================================================

ALTER TABLE assets

MODIFY asset_name CONSTRAINT nn_asset_name NOT NULL;

-- =====================================================
-- 8. Department Name Required
-- =====================================================

ALTER TABLE departments

MODIFY department_name CONSTRAINT nn_department_name NOT NULL;

-- =====================================================
-- 9. Prevent Assignment Without Employee
-- =====================================================

ALTER TABLE assignments

MODIFY employee_id CONSTRAINT nn_assignment_employee NOT NULL;

-- =====================================================
-- 10. Prevent Assignment Without Asset
-- =====================================================

ALTER TABLE assignments

MODIFY asset_id CONSTRAINT nn_assignment_asset NOT NULL;

-- =====================================================
-- End of constraints.sql
-- =====================================================
