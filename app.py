from mysql import connector

from dreamhouse_db.util.constants import DATABASE_CONFIG


def main() -> None:
    cnx = connector.connect(**DATABASE_CONFIG)
    cnx.close()

if __name__ == '__main__':
    main()
