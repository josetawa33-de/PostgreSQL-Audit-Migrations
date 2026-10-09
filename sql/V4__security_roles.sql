-- V4: Least-privilege application security roles

DO $$
BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_roles WHERE rolname = 'app_read') THEN
        CREATE ROLE app_read NOLOGIN;
    END IF;

    IF NOT EXISTS (SELECT 1 FROM pg_roles WHERE rolname = 'app_write') THEN
        CREATE ROLE app_write NOLOGIN;
    END IF;

    IF NOT EXISTS (SELECT 1 FROM pg_roles WHERE rolname = 'api') THEN
        CREATE ROLE api LOGIN IN ROLE app_write;
    END IF;
END
$$;

-- Database and schema access
GRANT CONNECT ON DATABASE bootcamp TO app_read, app_write;
GRANT USAGE ON SCHEMA public TO app_read, app_write;

-- Read-only role
GRANT SELECT ON ALL TABLES IN SCHEMA public TO app_read;

-- Application write role
GRANT SELECT, INSERT, UPDATE, DELETE
ON ALL TABLES IN SCHEMA public TO app_write;

GRANT USAGE, SELECT
ON ALL SEQUENCES IN SCHEMA public TO app_write;

-- Protect Flyway's migration history
REVOKE ALL PRIVILEGES
ON TABLE public.flyway_schema_history FROM app_read, app_write;

-- Default permissions for future tables created by postgres
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public
GRANT SELECT ON TABLES TO app_read;

ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public
GRANT SELECT, INSERT, UPDATE, DELETE ON TABLES TO app_write;

ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public
GRANT USAGE, SELECT ON SEQUENCES TO app_write;

GRANT app_write TO api;
