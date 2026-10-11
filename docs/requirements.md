# PostgreSQL Audit and Data Management Capstone

## 1. Project Overview
This project demonstrates reliable relational database design, audit logging, hierarchical category queries, versioned schema migrations, database security, and query performance optimization using PostgreSQL.

## 2. Functional Requirements
- Store student records with unique identifiers and required names.
- Record INSERT, UPDATE, and DELETE operations on student records in an audit log.
- Store hierarchical categories using a self-referencing parent-child relationship.
- Manage schema changes through ordered Flyway SQL migrations.
- Provide separate read and write database roles using least-privilege access.
- Support analytical queries and document performance improvements.
- Produce database backups and verify restoration in a separate test database.

## 3. Data Entities
- Students: student ID, name, and age.
- Audit Log: event ID, table name, operation, old row, new row, database user, and timestamp.
- Categories: category ID, name, and optional parent category ID.

## 4. Security Requirements
Application accounts must not use superuser privileges. Permissions should be limited to required operations. Sensitive data must be protected, audit records must be maintained for critical changes, and queries in any application layer must use parameterized statements. Row-level security must be applied where the data model requires tenant or row-level isolation.

## 5. Reliability and Performance
Database changes must be version-controlled and tested on a disposable database before clean-build testing. Analytical queries must include before-and-after EXPLAIN ANALYZE evidence. Backups must be created and restored in a separate test environment.

## 6. NoSQL Decision
PostgreSQL remains the authoritative relational database. Redis may be added for temporary caching if a measurable performance need is demonstrated. A NoSQL component will only be integrated if its benefit, data flow, and consistency implications can be justified.

## 7. Acceptance Criteria
The project includes documented requirements and an ER diagram, ordered migrations, justified storage choices, measured query optimization, security evidence, a verified backup and restore test, and a short walkthrough presentation.
