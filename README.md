# PostgreSQL Audit Logging, Category Trees, and Safe Migrations

## Project Overview
This project demonstrates PostgreSQL audit logging, hierarchical category queries, database migrations, and least-privilege access control.

## Technologies
- PostgreSQL 18
- SQL and PL/pgSQL
- Flyway Community Edition 13.10.0
- Git and GitHub

## Project Structure
- `sql/V1__core_tables.sql` - Creates the students table.
- `sql/V2__audit_log.sql` - Creates audit logging and its trigger.
- `sql/V3__categories.sql` - Creates the hierarchical categories table.
- `sql/V4__security_roles.sql` - Defines application roles and permissions.
- `queries/category_tree.sql` - Demonstrates a recursive CTE for category hierarchies.

## Key Learning Outcomes
- Track database inserts, updates, and deletes.
- Query hierarchical data with a recursive CTE.
- Manage versioned database schema migrations with Flyway.
- Apply least-privilege database permissions.
- Manage project changes using Git and GitHub.

## Database
Database name: `bootcamp`

## Security
Never commit database passwords, credentials, or other secrets.
