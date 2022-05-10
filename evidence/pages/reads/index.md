# Reads

```total_pending_pocket_reads
select
  count(*) as total
from prod.items
where read_at is null
```

I have a total of <Value data={data.total_pending_pocket_reads} column=total/> pending reads in Pocket.

Recent additions:

```pending_pocket_reads
select
  given_title
  , time_to_read
  , given_url
from prod.items
where read_at is null
order by added_at desc
limit 5
```

<ul>
{#each data.pending_pocket_reads as read}
  <li>
    <a href="{read.given_url}">{read.given_title} ({read.time_to_read || "?"} min)</a>
  </li>
{/each}
</ul>

## Tags

```tags_tally
select
  tag
  , count(*) as total
from prod.tags
group by tag
order by total desc
limit 10
```

Most used tags:

<DataTable
    data={data.tags_tally} 
    rows=10
/>
