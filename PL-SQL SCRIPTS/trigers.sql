-- =====================================================
-- Office Asset Tracker System
-- File: triggers.sql
-- Description: Database Triggers
-- =====================================================

-- =====================================================
-- Trigger 1: Prevent Asset Changes During Weekdays
-- Business Rule:
-- Block INSERT, UPDATE, DELETE from Monday-Friday
-- =====================================================

CREATE OR REPLACE TRIGGER prevent_weekday_asset_changes

BEFORE INSERT OR UPDATE OR DELETE

ON assets

BEGIN

```
IF TO_CHAR(SYSDATE,'DY','NLS_DATE_LANGUAGE=ENGLISH')

IN ('MON','TUE','WED','THU','FRI')

THEN


    RAISE_APPLICATION_ERROR(

        -20001,

        'Asset modifications are not allowed during weekdays'

    );


END IF;
```

END;
/

-- =====================================================
-- Trigger 2: Prevent Changes During Public Holidays
-- Business Rule:
-- Block INSERT, UPDATE, DELETE on stored holidays
-- =====================================================

CREATE OR REPLACE TRIGGER prevent_holiday_changes

BEFORE INSERT OR UPDATE OR DELETE

ON assets

DECLARE

```
v_count NUMBER;
```

BEGIN

```
SELECT COUNT(*)

INTO v_count

FROM public_holidays

WHERE holiday_date = TRUNC(SYSDATE);



IF v_count > 0 THEN


    RAISE_APPLICATION_ERROR(

        -20002,

        'Changes are not allowed on public holidays'

    );


END IF;
```

END;
/

-- =====================================================
-- Trigger 3: Validate Asset Value
-- Business Rule:
-- Asset value cannot be negative
-- =====================================================

CREATE OR REPLACE TRIGGER validate_asset_value

BEFORE INSERT OR UPDATE

ON assets

FOR EACH ROW

BEGIN

```
IF :NEW.asset_value < 0 THEN


    RAISE_APPLICATION_ERROR(

        -20003,

        'Asset value cannot be negative'

    );


END IF;
```

END;
/

-- =====================================================
-- Trigger 4: Automatically Set Asset Status
-- Purpose:
-- New assets are automatically marked Available
-- =====================================================

CREATE OR REPLACE TRIGGER set_default_asset_status

BEFORE INSERT

ON assets

FOR EACH ROW

BEGIN

```
IF :NEW.asset_status IS NULL THEN


    :NEW.asset_status := 'Available';



END IF;
```

END;
/

-- =====================================================
-- Trigger 5: Audit Asset Activities
-- Purpose:
-- Tracks INSERT, UPDATE, DELETE operations
-- =====================================================

CREATE OR REPLACE TRIGGER asset_activity_audit

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

        asset_id

    )

    VALUES

    (

        audit_seq.NEXTVAL,

        USER,

        'INSERT',

        SYSDATE,

        :NEW.asset_id

    );




ELSIF UPDATING THEN



    INSERT INTO asset_audit

    (

        audit_id,

        username,

        action_type,

        action_date,

        asset_id

    )

    VALUES

    (

        audit_seq.NEXTVAL,

        USER,

        'UPDATE',

        SYSDATE,

        :NEW.asset_id

    );





ELSIF DELETING THEN



    INSERT INTO asset_audit

    (

        audit_id,

        username,

        action_type,

        action_date,

        asset_id

    )

    VALUES

    (

        audit_seq.NEXTVAL,

        USER,

        'DELETE',

        SYSDATE,

        :OLD.asset_id

    );



END IF;
```

END;
/

-- =====================================================
-- Trigger 6: Prevent Duplicate Asset Serial Numbers
-- =====================================================

CREATE OR REPLACE TRIGGER prevent_duplicate_serial

BEFORE INSERT OR UPDATE

ON assets

FOR EACH ROW

DECLARE

```
v_count NUMBER;
```

BEGIN

```
SELECT COUNT(*)

INTO v_count

FROM assets

WHERE serial_number = :NEW.serial_number

AND asset_id <> NVL(:NEW.asset_id,0);



IF v_count > 0 THEN


    RAISE_APPLICATION_ERROR(

        -20004,

        'Asset serial number already exists'

    );


END IF;
```

END;
/

-- End of triggers.sql
