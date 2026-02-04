-- 1. Create a new Postgres user for Dagster
CREATE USER dagster_user WITH PASSWORD 'dagster_pass';

-- 2. Create a new database for Dagster
CREATE DATABASE dagster;

-- 3. Connect to the new database
\c dagster;

-- 4. Create a schema (optional, but recommended)
CREATE SCHEMA dagster;

-- 5. Grant all privileges to the user on the database and schema
GRANT ALL PRIVILEGES ON DATABASE dagster TO dagster_user;
GRANT ALL PRIVILEGES ON SCHEMA dagster TO dagster_user;


-- 1. Grant the user ownership of the public schema
ALTER SCHEMA public OWNER TO dagster_user;

-- 2. Ensure the user has all rights to that schema
GRANT ALL ON SCHEMA public TO dagster_user;

-- 3. Give the user superuser status (the most reliable fix for local dev)
ALTER USER dagster_user WITH SUPERUSER;