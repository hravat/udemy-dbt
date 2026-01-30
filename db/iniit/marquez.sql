CREATE USER marquez WITH PASSWORD 'marquez';

GRANT ALL PRIVILEGES ON DATABASE marquez TO marquez;



-- Allow usage of the public schema
GRANT USAGE ON SCHEMA public TO marquez;

-- Allow creating tables, sequences, functions, etc.
GRANT CREATE ON SCHEMA public TO marquez;

-- Grant full privileges on future objects
ALTER DEFAULT PRIVILEGES IN SCHEMA public GRANT ALL ON TABLES TO marquez;
ALTER DEFAULT PRIVILEGES IN SCHEMA public GRANT ALL ON SEQUENCES TO marquez;
ALTER DEFAULT PRIVILEGES IN SCHEMA public GRANT ALL ON FUNCTIONS TO marquez;
