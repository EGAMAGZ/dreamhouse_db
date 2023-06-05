from faker import Faker
from faker.providers import internet, phone_number

from dreamhouse_db.util.constants import FAKER_LOCALE

fake = Faker(FAKER_LOCALE)
fake.add_provider(internet)
fake.add_provider(phone_number)
