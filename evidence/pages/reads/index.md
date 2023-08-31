---
title: Reads
description: Pocket reads
sources:
  - total_pending_pocket_reads: reads/total_pending_pocket_reads.sql
  - pending_pocket_reads: reads/pending_pocket_reads.sql
  - recent_pocket_reads: reads/recent_pocket_reads.sql
  - daily_reads: reads/daily_reads.sql
  - tags_tally: reads/tags_tally.sql
  - author_tally: reads/author_tally.sql
---

## Pending

I have a total of <Value data={data.total_pending_pocket_reads} column=total/> pending reads in Pocket.

Recent additions:

<ul>
{#each data.pending_pocket_reads as read}
  <li>
    <a href="https://getpocket.com/read/{read.item_id}" target="_blank" rel="noopener noreferrer">
      {read.resolved_title} ({read.time_to_read || "?"} min)
    </a>
    <small>
      (<a href="{read.given_url}" target="_blank" rel="noopener noreferrer">source</a>)
    </small>
  </li>
{/each}
</ul>

## Recent

Recently read:

<ul>
{#each data.recent_pocket_reads as read}
  <li>
    <a href="https://getpocket.com/read/{read.item_id}" target="_blank" rel="noopener noreferrer">
      {read.resolved_title} ({read.time_to_read || "?"} min)
    </a>
    <small>
      (<a href="{read.given_url}" target="_blank" rel="noopener noreferrer">source</a>)
    </small>
  </li>
{/each}
</ul>

### Daily reads

{#if daily_reads != null && daily_reads.length !== 0}

<BarChart
    data={data.daily_reads}
    x=date
    y=total
/>

{:else }

No reads in the last 7 days.

{/if}

## Tags

Most used tags:

<DataTable
    data={data.tags_tally}
    rows=10
/>

## Authors

Top authors:

<DataTable
    data={data.author_tally}
    rows=5
/>
