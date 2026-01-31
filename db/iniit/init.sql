-- 1. Create the user
CREATE ROLE dbt WITH LOGIN PASSWORD 'user@123';

-- 2. Create the database owned by this user
CREATE DATABASE airbnb OWNER dbt;

-- 3. Connect to the new database (from psql shell)


-- 4. Create schemas
CREATE SCHEMA IF NOT EXISTS raw AUTHORIZATION dbt;
CREATE SCHEMA IF NOT EXISTS dev AUTHORIZATION dbt;


GRANT SELECT ON ALL TABLES IN SCHEMA public TO dbt;
GRANT SELECT ON ALL TABLES IN SCHEMA raw TO dbt;
GRANT SELECT ON ALL TABLES IN SCHEMA dev TO dbt;

-- 1. Create the user
CREATE ROLE marquez  WITH LOGIN PASSWORD 'marquez';

-- 2. Create the database owned by this user
CREATE DATABASE marquez OWNER marquez;
