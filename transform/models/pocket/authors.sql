with authors as (
  select
    unnest(from_json(authors, '["json"]')) as author
  from {{ source('pocket', 'items') }}
)

select
  author ->> 'author_id' as author_id
  , author ->> 'name' as name
  , author ->> 'url' as url
from authors
