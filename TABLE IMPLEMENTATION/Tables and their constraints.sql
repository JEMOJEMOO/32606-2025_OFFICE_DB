
CREATE TABLE Department (
    DepartmentID NUMBER PRIMARY KEY,
    DepartmentName VARCHAR2(100) NOT NULL UNIQUE,
    Location VARCHAR2(100) NOT NULL
);



CREATE TABLE Employee (
    EmployeeID NUMBER PRIMARY KEY,
    EmployeeName VARCHAR2(100) NOT NULL,
    DepartmentID NUMBER NOT NULL,
    Email VARCHAR2(100) NOT NULL UNIQUE,
    Phone VARCHAR2(20) UNIQUE,

    CONSTRAINT fk_emp_department
        FOREIGN KEY (DepartmentID)
        REFERENCES Department(DepartmentID)
);




CREATE TABLE Asset (
    AssetID NUMBER PRIMARY KEY,
    EmployeeID NUMBER,
    AssetName VARCHAR2(100) NOT NULL,
    SerialNumber VARCHAR2(50) NOT NULL UNIQUE,
    PurchaseDate DATE NOT NULL,
    Status VARCHAR2(20) DEFAULT 'Available',
    Location VARCHAR2(100),

    CONSTRAINT fk_asset_employee
        FOREIGN KEY (EmployeeID)
        REFERENCES Employee(EmployeeID),

    CONSTRAINT chk_asset_status
        CHECK (Status IN
        ('Available','Assigned','Maintenance','Disposed'))
);




CREATE TABLE Maintenance (
    MaintenanceID NUMBER PRIMARY KEY,
    AssetID NUMBER NOT NULL,
    MaintenanceDate DATE NOT NULL,
    Description VARCHAR2(200),
    Cost NUMBER(10,2),

    CONSTRAINT fk_maintenance_asset
        FOREIGN KEY (AssetID)
        REFERENCES Asset(AssetID),

    CONSTRAINT chk_cost
        CHECK (Cost >= 0)
);





CREATE TABLE Audit (
    AuditID NUMBER PRIMARY KEY,
    AssetID NUMBER NOT NULL,
    AuditDate DATE NOT NULL,
    AuditorName VARCHAR2(100) NOT NULL,
    Findings VARCHAR2(200),

    CONSTRAINT fk_audit_asset
        FOREIGN KEY (AssetID)
        REFERENCES Asset(AssetID)
);





