from mysql.connector import Error, errorcode
from mysql.connector.cursor import MySQLConnectionAbstract

TABLES = {
    "clientes" : """CREATE TABLE Clientes (
        pk_id_cli INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
        txt_nom_cli VARCHAR(64) NOT NULL,
        num_tel_cli VARCHAR(10) NOT NULL,
        txt_email_cli VARCHAR(256) NOT NULL
    );"""
}

def create_tables(cursor: MySQLConnectionAbstract) -> None:
    for table_name in TABLES:
        table_statement = TABLES[table_name]
        try:
            print(f"Creating table {table_name}:", end=' ')
            cursor.execute(table_statement)
        except Error as exception:
            if exception.errno == errorcode.ER_TABLE_EXISTS_ERROR:
                print("already exists.")
            else:
                print(exception.msg)
        else:
            print("OK")
