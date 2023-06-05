from mysql.connector.cursor import MySQLCursorAbstract

from dreamhouse_db.data import clients


def insert_data(cursor: MySQLCursorAbstract) -> None:
    insert_clients(cursor)


def insert_clients(
    cursor: MySQLCursorAbstract,
    clients_data=clients.DEFAULT_CLIENTS,
) -> None:
    sql_statement = """INSERT INTO Clientes (txt_nom_cli, num_tel_cli,
    txt_email_cli) VALUES(%(txt_nom_cli)s, %(num_tel_cli)s, %(txt_email_cli)s)"""
    print(clients_data)
    cursor.executemany(sql_statement, clients_data)
