import os

from dotenv import load_dotenv
from psycopg import Connection, connect

load_dotenv()


def psycopg_connection() -> Connection:
    """
    Connect to the PostgreSQL database.

    Returns:
        Connection: A psycopg connection object.
    """

    return connect(
        host="database",
        port=5432,
        dbname=os.environ["POSTGRES_DB"],
        user=os.environ["POSTGRES_PIPELINE_USER"],
        password=os.environ["POSTGRES_PIPELINE_PASSWORD"],
    )
