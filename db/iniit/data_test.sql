select id,count(*)
from airbnb.raw.listings
group by id
having  count(*) > 1

DELETE FROM airbnb.raw.listings
WHERE ctid NOT IN (
  SELECT MIN(ctid)
  FROM airbnb.raw.listings
  GROUP BY id
);

commit;


GRANT USAGE, CREATE ON SCHEMA _test_failures TO dbt;
GRANT USAGE, CREATE ON SCHEMA _test_failures TO dbt_user;


GRANT USAGE, CREATE ON SCHEMA _test_failures TO dbt;
GRANT USAGE, CREATE ON SCHEMA _test_failures TO dbt_user;



GRANT CONNECT ON DATABASE airbnb TO dbt;
GRANT TEMP ON DATABASE airbnb TO dbt;
GRANT CREATE ON DATABASE airbnb TO dbt;

GRANT CONNECT ON DATABASE airbnb TO dbt_user;
GRANT TEMP ON DATABASE airbnb TO dbt_user;
GRANT CREATE ON DATABASE airbnb TO dbt_user;

