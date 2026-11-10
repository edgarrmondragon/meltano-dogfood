# Meltano Personal Project 🐶🥫

[![Vercel](https://vercelbadge.vercel.app/api/edgarrmondragon/meltano-dataops)](https://vercel.com/edgarrmondragon/meltano-dataops)
[![pre-commit.ci status](https://results.pre-commit.ci/badge/github/edgarrmondragon/meltano-dataops/main.svg)](https://results.pre-commit.ci/latest/github/edgarrmondragon/meltano-dataops/main)
[![Meltano Pipeline](https://github.com/edgarrmondragon/meltano-dataops/actions/workflows/melty.yaml/badge.svg)](https://github.com/edgarrmondragon/meltano-dataops/actions/workflows/melty.yaml)

## Warehouse

Data lands in a [DuckLake] hosted on Neon. The catalog (metadata) lives in Neon Postgres and the data files live in the `ducklake` bucket on Neon Storage. [`target-ducklake`][target-ducklake] loads the raw `tap_*` schemas, dbt builds on top of them, and Quarto reads the result with read-only credentials.

### Gotcha: small tables live in the catalog, not the bucket

[DuckLake inlines very small tables][ducklake-inline]: a table created with 10 or fewer rows is stored as rows in the Postgres catalog and gets no parquet files. Browsing the bucket, you won't find them. For example, `tap_readthedocs.projects` (8 rows) and `main.question_stats` (2 rows) are inlined. They are still queryable and durable, and they are written out as parquet once they outgrow the limit.

- Tables that appear to be missing from the bucket are probably inlined, so check the catalog before assuming a load failed.
- The bucket is not a complete copy of the data on its own. Back up or restore the Postgres catalog together with the bucket.
- To write inlined data out to parquet, run `CALL ducklake_flush_inlined_data('<catalog alias>')` on a connection with the lake attached.

[ducklake]: https://ducklake.select
[ducklake-inline]: https://ducklake.select/docs/stable/duckdb/advanced_features/data_inlining#configuring-data-inlining
[target-ducklake]: https://github.com/reservoir-data/target-ducklake
