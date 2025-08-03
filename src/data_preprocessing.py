import os
import pandas as pd
from sqlalchemy.engine import Engine

def process_csv(file_name: str, table_name:str, engine: Engine) -> pd.DataFrame:
    """
    Loads, cleans, and saves data from a CSV file to a PostgreSQL database.
    - file_name: CSV file name (e.g., "gdp.csv")
    - table_name: database table name (e.g., "gdp_data")
    - engine: SQLAlchemy's connection to the database
    - base_path: project base path (defaults to one level above notebooks)
    """

    # Files paths
    raw_path = os.path.join("data", "raw", file_name)
    clean_path = os.path.join("data", "clean", file_name)

    # File loading (we skip first 3 rows with metadata)
    df = pd.read_csv(raw_path, skiprows=4)

    # Deleting unnececary columns
    df = df.drop(columns=["Indicator Name", "Indicator Code"])

    # Converting from wide to long format
    df_long = df.melt(
        id_vars=["Country Name", "Country Code"],
        var_name="Year", 
        value_name="Value"
    )

    # Data cleaning
    df_long = df_long.dropna(subset=["Value"])
    df_long["Year"] = df_long["Year"].astype(int)

    # Saving to data/clean/
    df_long.to_csv(clean_path, index=False)

    # Adding to the database
    df_long.to_sql(table_name, engine, if_exists="replace", index=False)

    print(f"Processed {file_name} -> saved to Table {table_name}")
    return df_long