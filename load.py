from sqlalchemy import create_engine

def load_data(df):

    print("Loading data into PostgreSQL...")

    engine = create_engine(
        "postgresql://postgres:5432@localhost:5432/postgres"
    )

    df.to_sql(
        "walmart_cleaned",
        engine,
        if_exists="replace",
        index=False
    )

    print("Data loaded successfully")

