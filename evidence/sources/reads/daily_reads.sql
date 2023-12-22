select
  date_trunc('day', read_at) as date
  , count(*) as total
from items
where read_at is not null and datediff('day', read_at, now()) <= 21
group by date
order by date desc
