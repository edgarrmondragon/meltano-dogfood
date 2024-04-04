select
  author_name
  , count(*) as total
from personal.authors
group by author_name
order by total desc
limit 5
