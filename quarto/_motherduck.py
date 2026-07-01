import os

import duckdb
from dotenv import load_dotenv

load_dotenv()


def connect() -> duckdb.DuckDBPyConnection:
    return duckdb.connect(
        "md:",
        config={"motherduck_token": os.environ["MOTHERDUCK_TOKEN"]},
    )
