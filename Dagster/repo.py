from dagster import asset, Definitions

@asset
def airbnb_raw_data():
    return "This represents my raw Airbnb CSV data"

defs = Definitions(assets=[airbnb_raw_data])