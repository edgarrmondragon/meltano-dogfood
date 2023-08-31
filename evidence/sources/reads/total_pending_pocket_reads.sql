select
  count(*) as total
from items
where read_at is null
