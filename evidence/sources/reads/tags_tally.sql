select
  tag
  , count(*) as total
from tags
group by tag
order by total desc
limit 10
