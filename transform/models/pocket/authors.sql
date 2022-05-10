select
  a.author_id
  , a.name
  , a.url
from {{ source('pocket', 'items') }} cross join unnest(authors) as a
