-- =====================================================
-- Office Asset Tracker System
-- File: audit_system.sql
-- Description: Audit System and User Activity Tracking
-- =====================================================

-- =====================================================
-- 1. Create Audit Table
-- Stores all changes performed on assets
-- =====================================================

CREATE TABLE asset_audit
(

```
audit_id NUMBER PRIMARY KEY,

username VARCHAR2(50),

action_type VARCHAR2(20),

action_date DATE,

asset_id NUMBER,

old_value VARCHAR2(200),

new_value VARCHAR2(200)
```

);

-- =====================================================
-- 2. Create Audit Sequence
-- Automatically generates audit IDs
-- =====================================================

CREATE SEQUENCE audit_seq

START WITH 1

INCREMENT BY 1;

-- =====================================================
-- 3. Detailed Asset Audit Trigger
-- Tracks old and new values during updates
-- =====================================================

CREATE OR REPLACE TRIGGER detailed_asset_audit

AFTER INSERT OR UPDATE OR DELETE

ON assets

FOR EACH ROW

BEGIN

```
IF INSERTING THEN



    INSERT INTO asset_audit

    (

        audit_id,

        username,

        action_type,

        action_date,

        asset_id,

        new_value

    )


    VALUES

    (

        audit_seq.NEXTVAL,

        USER,

        'INSERT',

        SYSDATE,

        :NEW.asset_id,

        :NEW.asset_name

    );




ELSIF UPDATING THEN



    INSERT INTO asset_audit

    (

        audit_id,

        username,

        action_type,

        action_date,

        asset_id,

        old_value,

        new_value

    )


    VALUES

    (

        audit_seq.NEXTVAL,

        USER,

        'UPDATE',

        SYSDATE,

        :NEW.asset_id,

        :OLD.asset_name,

        :NEW.asset_name

    );




ELSIF DELETING THEN



    INSERT INTO asset_audit

    (

        audit_id,

        username,

        action_type,

        action_date,

        asset_id,

        old_value

    )


    VALUES

    (

        audit_seq.NEXTVAL,

        USER,

        'DELETE',

        SYSDATE,

        :OLD.asset_id,

        :OLD.asset_name

    );



END IF;
```

END;
/

-- =====================================================
-- 4. User Activity Tracking Table
-- Stores database user activities
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
-- 5. User Activity Sequence
-- =====================================================

CREATE SEQUENCE activity_seq

START WITH 1

INCREMENT BY 1;

-- =====================================================
-- 6. Activity Logging Procedure
-- Records user actions
-- =====================================================

CREATE OR REPLACE PROCEDURE log_user_activity

(

```
p_activity VARCHAR2
```

)

AS

BEGIN

```
INSERT INTO user_activity_log

(

    activity_id,

    username,

    activity_type,

    activity_time

)


VALUES

(

    activity_seq.NEXTVAL,

    USER,

    p_activity,

    SYSDATE

);



COMMIT;
```

END;
/

-- =====================================================
-- End of audit_system.sql
-- =====================================================
