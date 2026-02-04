from pathlib import Path
from dagster_dbt import DbtProject

# Defining the project object used in your resources
airbnb_dbt_fusion_data_bricks_project = DbtProject(
    project_dir=Path("/opt/airbnb_dbt_fusion_data_bricks"),
)