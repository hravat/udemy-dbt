WITH raw_reviews AS (
    SELECT
        *
    FROM
        AIRBNB.RAW.hosts
)
SELECT
    id,
    name,
    is_superhost,
    created_at,
    updated_at
FROM
    raw_reviews

select count(*)
from  listings
