select
  tag
  , count(*) as total
from personal.tags
group by tag
order by total desc
limit 10
