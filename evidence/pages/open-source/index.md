---
title: Open Source
description: Open source I maintain
---

```rtd_projects
select
  gh.name
  , extract(DATE from gh.created_at) as created
  , gh.html_url as repository
  , rtd.homepage
from tap_github.repositories as gh
left join tap_readthedocs.projects as rtd
  on rtd.name = gh.name
where gh.html_url like '%github.com/edgarrmondragon%'
```

{#each rtd_projects as project}

## {project.name}

<ul>

<li>Created: {project.created_at}</li>
<li>Description: {project.description}</li>
<li>Repository: <a href="{project.repository}" target="_blank" rel="noopener noreferrer">{project.repository}</a></li>

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
