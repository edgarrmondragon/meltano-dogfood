---
title: Reads
description: Pocket reads
---

## Pending

```sql pending_pocket_reads
select * from motherduck_personal.pending_pocket_reads
order by added_at desc
limit 5
```

```sql total_pending_pocket_reads
select count(*) as total from motherduck_personal.pending_pocket_reads
```

I have a total of <Value data={total_pending_pocket_reads} column=total/> pending reads in Pocket.

Recent additions:

<ul>
{#each pending_pocket_reads as read}
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

```sql recent_pocket_reads
select * from motherduck_personal.recent_pocket_reads
```

Recently read:

<ul>
{#each recent_pocket_reads as read}
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

## Tags

```sql tags_tally
select * from motherduck_personal.tags_tally
```

Most used tags:

<DataTable
    data={tags_tally}
    rows=10
/>

## Authors

```sql author_tally
select * from motherduck_personal.author_tally
```

Top authors:

<DataTable
    data={author_tally}
    rows=5
/>
