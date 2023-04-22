---
title: Open Source
description: Open source I maintain
---

```rtd_projects
select
  name
  , extract(DATE from created) as created
  , repository.url as repository
  , homepage as documentation
from tap_readthedocs.projects
where repository.url like '%github.com/edgarrmondragon%'
```

{#each rtd_projects as project}

## {project.name}

- Created: {project.created}
- Repository: <a href="{project.repository}" target="_blank" rel="noopener noreferrer">{project.repository}</a>

### Documentation

Site: <a href="{project.documentation}" target="_blank" rel="noopener noreferrer">{project.documentation}</a>

#### Builds

TODO

{/each}
