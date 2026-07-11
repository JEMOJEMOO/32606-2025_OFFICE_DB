-- =====================================================
-- Office Asset Tracker System
-- File: cursors.sql
-- Description: Explicit Cursor Examples
-- =====================================================


-- =====================================================
-- Cursor 1: Display All Assigned Assets
-- Purpose:
-- Retrieves all assets currently assigned to employees
-- =====================================================


DECLARE


    CURSOR assigned_assets_cursor IS

        SELECT

            e.first_name || ' ' || e.last_name AS employee_name,

            a.asset_name,

            a.asset_status

        FROM employees e


        JOIN assignments ass

        ON e.employee_id = ass.employee_id


        JOIN assets a

        ON ass.asset_id = a.asset_id


        WHERE ass.assignment_status = 'Assigned';



    v_employee_name VARCHAR2(100);

    v_asset_name VARCHAR2(100);

    v_status VARCHAR2(30);



BEGIN


    OPEN assigned_assets_cursor;


    LOOP


        FETCH assigned_assets_cursor

        INTO

        v_employee_name,

        v_asset_name,

        v_status;



        EXIT WHEN assigned_assets_cursor%NOTFOUND;



        DBMS_OUTPUT.PUT_LINE(

            'Employee: ' || v_employee_name ||

            ' | Asset: ' || v_asset_name ||

            ' | Status: ' || v_status

        );



    END LOOP;



    CLOSE assigned_assets_cursor;



END;
/
