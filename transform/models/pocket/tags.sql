{%-

set items = source('pocket', 'items')

-%}

select
  {{ items }}.item_id
  , json_extract(t.value, '$.tag') as tag
from {{ items }}, json_each({{ items }}.tags) as t
