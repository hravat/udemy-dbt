
CREATE EXTENSION IF NOT EXISTS plpython3u;
CREATE EXTENSION IF NOT EXISTS aws_s3;

-- Listings table
CREATE TABLE IF NOT EXISTS raw.listings (
    id INTEGER,
    listing_url TEXT,
    name TEXT,
    room_type TEXT,
    minimum_nights INTEGER,
    host_id INTEGER,
    price TEXT,
    created_at TIMESTAMP,
    updated_at TIMESTAMP
);

-- Reviews table
CREATE TABLE IF NOT EXISTS raw.reviews (
    listing_id INTEGER,
    date TIMESTAMP,
    reviewer_name TEXT,
    comments TEXT,
    sentiment TEXT
);

-- Hosts table
CREATE TABLE IF NOT EXISTS raw.hosts (
    id INTEGER,
    name TEXT,
    is_superhost TEXT,
    created_at TIMESTAMP,
    updated_at TIMESTAMP
);



SELECT aws_s3.table_import_from_s3(
    'raw.listings',
    '',
    '(FORMAT csv, HEADER true)',
    'dbt-datasets',   -- bucket name
    'listings.csv',   -- object
    'us-east-1',      -- region
    '',               -- AWS_ACCESS_KEY_ID empty
    ''                -- AWS_SECRET_ACCESS_KEY empty
);
