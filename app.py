from mysql import connector

from dreamhouse_db.database.create import create_tables
from dreamhouse_db.database.insert import insert_data
from dreamhouse_db.util.constants import DATABASE_CONFIG


def main() -> None:
    with connector.connect(
        **DATABASE_CONFIG
    ) as connection, connection.cursor() as cursor:
        create_tables(cursor)
        insert_data(cursor)


if __name__ == "__main__":
    main()
