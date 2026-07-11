-- =====================================================
-- Office Asset Tracker System
-- File: security_controls.sql
-- Description: Database Security Controls
-- =====================================================

-- =====================================================
-- 1. Create Roles
-- Roles control what users can access
-- =====================================================

CREATE ROLE asset_manager_role;

CREATE ROLE asset_viewer_role;

-- =====================================================
-- 2. Grant Permissions to Asset Manager
-- Allows full management of asset records
-- =====================================================

GRANT SELECT, INSERT, UPDATE, DELETE

ON assets

TO asset_manager_role;

GRANT SELECT, INSERT, UPDATE, DELETE

ON assignments

TO asset_manager_role;

GRANT SELECT, INSERT, UPDATE, DELETE

ON maintenance

TO asset_manager_role;

GRANT SELECT

ON asset_audit

TO asset_manager_role;

-- =====================================================
-- 3. Grant Permissions to Asset Viewer
-- Allows read-only access
-- =====================================================

GRANT SELECT

ON assets

TO asset_viewer_role;

GRANT SELECT

ON assignments

TO asset_viewer_role;

GRANT SELECT

ON maintenance

TO asset_viewer_role;

GRANT SELECT

ON asset_audit

TO asset_viewer_role;

-- =====================================================
-- 4. Create Application Users
-- Example users for the system
-- =====================================================

CREATE USER asset_admin

IDENTIFIED BY AssetAdmin123;

CREATE USER asset_user

IDENTIFIED BY AssetUser123;

-- =====================================================
-- 5. Assign Roles to Users
-- =====================================================

GRANT asset_manager_role

TO asset_admin;

GRANT asset_viewer_role

TO asset_user;

-- =====================================================
-- 6. Basic Login Privilege
-- Allows users to connect
-- =====================================================

GRANT CREATE SESSION

TO asset_admin;

GRANT CREATE SESSION

TO asset_user;

-- =====================================================
-- 7. Restrict Direct Table Access
-- Users should use controlled roles
-- =====================================================

REVOKE INSERT, UPDATE, DELETE

ON asset_audit

FROM asset_viewer_role;

-- =====================================================
-- 8. Security Audit View
-- Displays user activities
-- =====================================================

CREATE OR REPLACE VIEW security_activity_report

AS

SELECT

```
username,

activity_type,

activity_time
```

FROM user_activity_log;

-- =====================================================
-- End of security_controls.sql
-- =====================================================
