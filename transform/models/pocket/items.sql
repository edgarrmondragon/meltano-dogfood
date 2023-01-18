select
  item_id
  , given_url
  , resolved_title
  , time_to_read
  , timestamp_seconds(time_added) as added_at
  , case when time_read > 0 then timestamp_seconds(time_read) end as read_at
  , timestamp_seconds(time_updated) as updated_at
from {{ source('pocket', 'items') }}
