from sqlalchemy import create_engine

# Dane dostępowe (zmień hasło na to, które ustawiłaś przy instalacji)
DB_USER = "postgres"
DB_PASSWORD = "B4zyD4nych"
DB_HOST = "localhost"
DB_PORT = "5432"
DB_NAME = "startup_db"

# Tworzymy silnik połączenia
DB_URL = f"postgresql+psycopg2://{DB_USER}:{DB_PASSWORD}@{DB_HOST}:{DB_PORT}/{DB_NAME}"
engine = create_engine(DB_URL)
