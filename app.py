from random import randint

from faker import Faker
from faker.providers import internet

fake = Faker("es_MX")
fake.add_provider(internet)

LOREM_IPSUM = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat."

PROPIETARIOS = [1, 2,2, 3, 4, 5]

for _ in range(6):
    print(
        f"('{fake.street_name()},{fake.city()},{fake.postcode()}',{randint(1, 10)},'{randint(4,50)}m2',{randint(100_000,99_999_999)}, '{LOREM_IPSUM}', {PROPIETARIOS[_]})"
    )
