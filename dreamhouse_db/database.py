from mysql import connector

from dreamhouse_db.util.constants import DATABASE_CONFIG

database_cnx = connector.connect(**DATABASE_CONFIG)
