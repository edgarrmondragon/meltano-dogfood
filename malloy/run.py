# /// script
# dependencies = ["malloy", "pandas"]
# requires-python = "==3.13.*"
# ///

import asyncio
import pathlib

import malloy
from malloy.data.duckdb import DuckDbConnection


async def main():
    home_dir = pathlib.Path.cwd()
    duckdb_dir = home_dir / "output"

    malloy_dir = home_dir / "malloy"
    with malloy.Runtime() as runtime:
        connection = DuckDbConnection(home_dir=duckdb_dir)
        runtime.add_connection(connection)
        runtime.load_file(malloy_dir / "pocket.malloy")

        query = "stats"
        # query = "tags"

        if data := await runtime.run(named_query=query):
            df = data.to_dataframe()
            print(df)
        else:
            print("No data returned")


if __name__ == "__main__":
    asyncio.run(main())
