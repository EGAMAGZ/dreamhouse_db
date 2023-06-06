from random import randint

from faker import Faker
from faker.providers import internet

fake = Faker("es_MX")
fake.add_provider(internet)

LOREM_IPSUM = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat."

PROPIETARIOS = [1, 2,2, 3, 4, 5]
SUPERVISORES = ["Sup001","Sup003", "Sup001"]

for index in range(3):
    print(f"({index+1}, {index+1}, '{LOREM_IPSUM}',{SUPERVISORES[index]}, '30/10/2022', '06/06/2023', '{LOREM_IPSUM}', {randint(1_000,10_000)}, {randint(0,1)})")
