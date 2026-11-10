import os
from urllib.parse import urlparse

import duckdb
from dotenv import load_dotenv

load_dotenv()


def connect() -> duckdb.DuckDBPyConnection:
    """Open the DuckLake warehouse read-only, under the `personal` catalog."""
    con = duckdb.connect()
    for extension in ("httpfs", "postgres", "ducklake"):
        con.execute(f"INSTALL {extension}; LOAD {extension};")
    con.execute(
        """
        CREATE OR REPLACE SECRET warehouse_s3 (
            TYPE s3,
            ENDPOINT ?,
            REGION ?,
            URL_STYLE 'path',
            KEY_ID ?,
            SECRET ?
        )
        """,
        [
            urlparse(os.environ["AWS_ENDPOINT_URL_S3"]).netloc,
            os.environ["AWS_REGION"],
            os.environ["AWS_ACCESS_KEY_ID"],
            os.environ["AWS_SECRET_ACCESS_KEY"],
        ],
    )
    con.execute(
        f"ATTACH 'ducklake:postgres:{os.environ['NEON_DATABASE_URL']}' "
        "AS personal (READ_ONLY)"
    )
    return con
