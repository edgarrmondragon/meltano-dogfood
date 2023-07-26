{%-

set items = source('pocket', 'items')

-%}

with tags as (
  select unnest(from_json(tags, '["json"]')) as tag
  from {{ source('pocket', 'items') }}
)

select
  tag ->> 'item_id' as item_id
  , tag ->> 'tag' as tag
from tags
