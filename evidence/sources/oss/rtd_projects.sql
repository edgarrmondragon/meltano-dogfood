select
  gh.name
  , date_trunc('day', gh.created_at)::varchar as created
  , date_trunc('day', gh.updated_at)::varchar as updated
  , gh.description
  , gh.html_url as repository
  , gh.stargazers_count
  , rtd.homepage
from tap_github.repositories as gh
left join tap_readthedocs.projects as rtd
  on rtd.name = gh.name
where gh.html_url like '%github.com/edgarrmondragon%'
