from dagster import Definitions
from dagster_dbt import DbtCliResource
from .assets import airbnb_dbt_fusion_data_bricks_dbt_assets
from .project import airbnb_dbt_fusion_data_bricks_project
from .schedules import schedules

defs = Definitions(
    # 1. The assets we defined in assets.py (the ones using the FusionTranslator)
    assets=[airbnb_dbt_fusion_data_bricks_dbt_assets],
    
    # 2. The schedules defined in schedules.py
    schedules=schedules,
    
    # 3. The Resource that tells Dagster HOW to run dbt
    resources={
        # The key "dbt" must match the argument name in your assets.py function:
        # def airbnb_dbt_fusion_data_bricks_dbt_assets(context, dbt: DbtCliResource)
        "dbt": DbtCliResource(project_dir=airbnb_dbt_fusion_data_bricks_project),
    },
)