select
  author_name
  , count(*) as total
from authors
group by author_name
order by total desc
limit 5
