select
  item_id
  , resolved_title
  , time_to_read
  , given_url
from personal.items
where read_at is not null
order by read_at desc
limit 5
