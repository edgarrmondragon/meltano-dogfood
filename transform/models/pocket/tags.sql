{%-

set items = source('pocket', 'items')

-%}

select
  t.item_id
   , t.tag
from {{ items }} cross join unnest(tags) as t
