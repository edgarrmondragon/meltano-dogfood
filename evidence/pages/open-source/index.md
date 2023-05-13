---
title: Open Source
description: Open source I maintain
---

```rtd_projects
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
```

{#each rtd_projects as project}

## {project.name}

<ul>

<li>Created: {project.created}</li>
<li>Last updated: {project.updated}</li>
<li>Description: {project.description}</li>
<li>Repository: <a href="{project.repository}" target="_blank" rel="noopener noreferrer">{project.repository}</a></li>
<li>Stars: {project.stargazers_count}</li>

{#if project.homepage}

<li>Homepage: <a href="{project.homepage}" target="_blank" rel="noopener noreferrer">{project.homepage}</a></li>

{/if}

</ul>

{#if project.documentation}

### Documentation

Site: <a href="{project.documentation}" target="_blank" rel="noopener noreferrer">{project.documentation}</a>

#### Builds

TODO

{/if}

{/each}
