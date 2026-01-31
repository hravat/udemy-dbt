select *
from airbnb.dev.scd_raw_hosts
WHERE ID=2164

UPDATE AIRBNB.RAW.HOSTS
  SET UPDATED_AT = CURRENT_TIMESTAMP
WHERE ID=2164

select *
from airbnb.raw.hosts
WHERE ID=2164

DELETE FROM HOSTS
WHERE id = 2164
AND ctid NOT IN (
  SELECT MIN(ctid)
  FROM HOSTS
  WHERE id = 2164
);

commit;
