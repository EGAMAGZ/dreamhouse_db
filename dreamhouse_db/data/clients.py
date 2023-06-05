from typing import List, TypedDict

from dreamhouse_db.data import fake


class Cliente(TypedDict):
    txt_nom_cli: str
    num_tel_cli: str
    txt_email_cli: str

DEFAULT_CLIENTS: List[Cliente] = [
    Cliente(txt_nom_cli=fake.name(),num_tel_cli=fake.phone_number(),txt_email_cli= fake.ascii_email()) for _ in range(10)
]
