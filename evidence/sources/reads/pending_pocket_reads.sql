select
  item_id
  , resolved_title
  , time_to_read
  , given_url
from items
where read_at is null
order by added_at desc
limit 5
