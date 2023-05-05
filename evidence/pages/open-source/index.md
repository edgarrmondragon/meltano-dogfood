---
title: Open Source
description: Open source I maintain
---

```rtd_projects
select
  name
  , extract(DATE from created) as created
  , html_url as repository
  , homepage
from tap_github.repositories
where repository.url like '%github.com/edgarrmondragon%'
```

{#each rtd_projects as project}

## {project.name}

- Created: {project.created_at}
- Description: {project.description}
- Repository: <a href="{project.repository}" target="_blank" rel="noopener noreferrer">{project.repository}</a>

{#if project.homepage}

- Homepage: <a href="{project.homepage}" target="_blank" rel="noopener noreferrer">{project.homepage}</a>

{/if}

### Documentation

Site: <a href="{project.documentation}" target="_blank" rel="noopener noreferrer">{project.documentation}</a>

#### Builds

TODO

{/each}
