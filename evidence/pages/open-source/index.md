---
title: Open Source
description: Open source I maintain
sources:
  - rtd_projects: oss/rtd_projects.sql
---

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
