import os
from typing import Dict, Final

FAKER_LOCALE = "es_MX"

DEFAULT_USER: Final[str] = 'root'
DEFAULT_PASSWORD: Final[str] = 'root'
DEFAULT_HOST: Final[str] = '127.0.0.1'
DEFAULT_DATABASE: Final[str] = 'dreamhousedb'

DATABASE_CONFIG: Dict[str, str] = {
    'user' : os.getenv("DB_USER", DEFAULT_USER),
    'password' : os.getenv("DB_PASSWORD", DEFAULT_PASSWORD),
    'host' : os.getenv("DB_HOST", DEFAULT_HOST),
    'database': os.getenv("DB_DATABASE", DEFAULT_DATABASE),
    'raise_on_warnings' : True
}
