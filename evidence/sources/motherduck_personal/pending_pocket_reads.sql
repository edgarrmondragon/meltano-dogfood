select
  item_id
  , added_at
  , resolved_title
  , time_to_read
  , given_url
from personal.items
where read_at is null
