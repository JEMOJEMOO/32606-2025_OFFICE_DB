# 32606-2025_OFFICE_DB
# Office Asset Tracker System

## Student Information

**Student Registration Number:** 32606/2025

---

## Project Overview

The **Office Asset Tracker System** is a database management system developed to help organizations efficiently manage, monitor, and track office assets.

The system provides a centralized solution for managing assets such as computers, printers, and other office equipment while maintaining information about employees, departments, asset assignments, maintenance activities, and system activities.

The project was developed using **Oracle Database, SQL, PL/SQL, and Power BI** to demonstrate database design, programming, security implementation, auditing, and reporting capabilities.

---

## Problem Statement

Organizations often face challenges when managing office assets manually. Poor asset tracking can result in:

* Loss of asset records
* Difficulty identifying asset ownership
* Poor maintenance tracking
* Incorrect asset allocation
* Lack of accountability for asset usage

The Office Asset Tracker System solves these challenges by providing a structured database system that allows organizations to store, manage, and analyze asset information efficiently.

---

## Project Objectives

The main objectives of this project are:

* To design and implement an office asset management database
* To manage employees, departments, and assets
* To track asset assignment and return processes
* To monitor maintenance activities
* To implement database security controls
* To maintain audit records of user activities
* To enforce business rules using PL/SQL triggers
* To generate reports and dashboards for decision-making

---

## Technologies Used

| Technology                      | Purpose                                                          |
| ------------------------------- | ---------------------------------------------------------------- |
| Oracle Database                 | Database management system                                       |
| SQL                             | Database creation, manipulation, and querying                    |
| PL/SQL                          | Stored procedures, functions, packages, triggers, and automation |
| Oracle SQL Developer            | Database development environment                                 |
| Oracle Enterprise Manager (OEM) | Database monitoring and management                               |
| Power BI                        | Data visualization and reporting                                 |
| GitHub                          | Project documentation and version control                        |

---

# Database Features

The system contains the following main modules:

## 1. Employee Management

Stores employee information including:

* Employee ID
* Names
* Contact information
* Department assignment

---

## 2. Department Management

Maintains organizational departments and their relationship with employees.

---

## 3. Asset Management

Tracks office assets including:

* Asset ID
* Asset name
* Asset type
* Serial number
* Purchase date
* Asset value
* Asset status

---

## 4. Asset Assignment Management

Records:

* Which employee receives an asset
* Assignment dates
* Return dates
* Assignment status

---

## 5. Maintenance Management

Stores asset maintenance information:

* Maintenance date
* Description
* Maintenance cost

---

# SQL Implementation

The SQL scripts include:

## Database Creation

`create_tables.sql`

Creates the main database tables:

* Departments
* Employees
* Assets
* Assignments
* Maintenance
* Public Holidays
* Audit Records

---

## Data Integrity

`constraints.sql`

Implements:

* Primary keys
* Foreign keys
* Unique constraints
* Check constraints
* Required fields

---

## Sample Data

`insert_data.sql`

Contains sample records used for:

* Testing database operations
* Demonstrating queries
* Connecting data to Power BI

---

## Queries

`queries.sql`

Contains SQL queries for:

* Asset reports
* Employee asset allocation
* Department statistics
* Maintenance analysis
* Audit history

---

# PL/SQL Implementation

The project includes advanced PL/SQL programming features.

## Procedures

File:

`procedures.sql`

Implemented procedures include:

* Assigning assets to employees
* Returning assets
* Recording maintenance
* Updating asset status

---

## Functions

File:

`functions.sql`

Implemented functions include:

* Counting total assets
* Counting available assets
* Calculating total asset value
* Counting employee assets
* Checking asset status
* Calculating maintenance cost

---

## Packages

File:

`packages.sql`

Contains:

`asset_management_pkg`

The package groups related asset operations into one reusable module.

---

## Triggers

File:

`triggers.sql`

Implemented triggers for:

* Business rule enforcement
* Asset validation
* Audit tracking
* Duplicate prevention

Examples of implemented business rules:

* Preventing asset changes during weekdays
* Preventing asset changes on public holidays
* Validating asset values

---

## Audit System

File:

`audit_system.sql`

The audit system records:

* Username
* Action performed
* Date and time
* Modified asset information

This provides accountability and tracking of database activities.

---

## Security Controls

File:

`security_controls.sql`

Implements:

* User roles
* Privilege management
* Access restrictions
* Database security controls

---

## Additional PL/SQL Features

The project also includes:

* Parameterized procedures
* Explicit cursors
* Exception handling
* DML operations
* DDL operations
* Transaction control using COMMIT and ROLLBACK

---

# Power BI Dashboard

The system data is visualized using Power BI dashboards.

Dashboard features include:

* Total number of assets
* Asset status overview
* Department asset distribution
* Maintenance analysis
* Interactive reporting

---

# Project Structure

```
Office-Asset-Tracker-System

│
├── Problem-Statement
│
├── SQL-Scripts
│   ├── create_tables.sql
│   ├── constraints.sql
│   ├── insert_data.sql
│   └── queries.sql
│
├── PL-SQL-Scripts
│   ├── procedures.sql
│   ├── functions.sql
│   ├── packages.sql
│   ├── triggers.sql
│   ├── audit_system.sql
│   ├── security_controls.sql
│   ├── cursors.sql
│   ├── exception_handling.sql
│   └── transactions.sql
│
├── Screenshots
│
├── Query-Explanations
│
└── README.md
```

---

# Key Achievements

The project demonstrates:

* Relational database design
* SQL database operations
* Advanced PL/SQL programming
* Database automation
* Business rule implementation
* Auditing and security management
* Data visualization and reporting

---

# Conclusion

The Office Asset Tracker System provides a reliable and efficient solution for managing organizational assets. Through Oracle SQL and PL/SQL implementation, the system improves asset tracking, accountability, security, and reporting capabilities.
