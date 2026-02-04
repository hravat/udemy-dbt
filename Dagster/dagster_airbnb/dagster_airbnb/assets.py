from pathlib import Path
from dagster_dbt import dbt_assets, DagsterDbtTranslator, DbtCliResource

# Ensure this path matches where your dbt project lives in the container
MANIFEST_PATH = Path("/opt/airbnb_dbt_fusion_data_bricks/target/manifest.json")

class FusionTranslator(DagsterDbtTranslator):
    # This prevents the .lower() error by skipping dbt-fusion test metadata
    def get_asset_check_spec(self, **kwargs):
        return None

@dbt_assets(
    manifest=MANIFEST_PATH,
    dagster_dbt_translator=FusionTranslator()
)
def airbnb_dbt_fusion_data_bricks_dbt_assets(context, dbt: DbtCliResource):
    # This function name now matches your definitions.py exactly
    yield from dbt.cli(["build", "--exclude", "resource_type:unit_test"], context=context).stream()