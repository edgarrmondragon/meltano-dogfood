select
  item_id
  , given_url
  , resolved_title
  , time_to_read
  , to_timestamp(time_added::bigint) as added_at
  , case when time_read > 0 then to_timestamp(time_read::bigint) end as read_at
  , to_timestamp(time_updated::bigint) as updated_at
from {{ source('pocket', 'items') }}
