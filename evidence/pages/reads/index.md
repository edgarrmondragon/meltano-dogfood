---
title: Reads
description: Pocket reads
---

## Pending

```total_pending_pocket_reads
select
  count(*) as total
from items
where read_at is null
```

I have a total of <Value data={data.total_pending_pocket_reads} column=total/> pending reads in Pocket.

Recent additions:

```pending_pocket_reads
select
  item_id
  , resolved_title
  , time_to_read
  , given_url
from items
where read_at is null
order by added_at desc
limit 5
```

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

```recent_pocket_reads
select
  item_id
  , resolved_title
  , time_to_read
  , given_url
from items
where read_at is not null
order by read_at desc
limit 5
```

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

```daily_reads
select
  date_trunc('day', read_at) as date
  , count(*) as total
from items
where read_at is not null and datediff('day', read_at, now()::timestamp) <= 21
group by date
order by date desc
```

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

```tags_tally
select
  tag
  , count(*) as total
from tags
group by tag
order by total desc
limit 10
```

Most used tags:

<DataTable
    data={data.tags_tally}
    rows=10
/>

## Authors

```author_tally
select
  author_name
  , count(*) as total
from authors
group by author_name
order by total desc
limit 5
```

Top authors:

<DataTable
    data={data.author_tally}
    rows=5
/>
