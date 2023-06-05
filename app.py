from mysql import connector

from dreamhouse_db.util.constants import DATABASE_CONFIG
# import mysql.connector

# config = {
#   'user': 'scott',
#   'password': 'password',
#   'host': '127.0.0.1',
#   'database': 'employees',
#   'raise_on_warnings': True
# }

# cnx = mysql.connector.connect(**config)

# cnx.close()


def main() -> None:
    cnx = connector.connect(**DATABASE_CONFIG)
    cnx.close()

if __name__ == '__main__':
    main()