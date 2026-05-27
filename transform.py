import pandas as pd
import numpy as np

df = pd.read_csv("data/Walmart_Sales.csv")

print(df.head())
print(df.info())

# Transform Process

'''df.drop_duplicates(inplace=True)
df.dropna(inplace=True)'''

# Standardize Column Names
df.columns = df.columns.str.lower()
df.columns = df.columns.str.replace(" ", "_")

# Change Date Format
df['date'] = pd.to_datetime(
    df['date'],
    dayfirst=True
)
print(df['date'].head())

# Total Sales Category
df['sales_category'] = np.where(
    df['weekly_sales'] > 1500000,
    'High Sales',
    'Low Sales'
)

df = df[df['weekly_sales'] > 0]
df['month'] = df['date'].dt.month_name()
print (df.head())

df.to_csv("data/walmart_cleaned_data.csv", index=False)

# =======================================
# Load

from sqlalchemy import create_engine

# STEP 3 — LOAD
# PostgreSQL connection
engine = create_engine(
    "postgresql://postgres:5432@localhost:5432/postgres"
)

# Upload data to PostgreSQL
df.to_sql(
    "walmart_cleaned",
    engine,
    if_exists="replace",
    index=False
)

print("Data uploaded successfully!")