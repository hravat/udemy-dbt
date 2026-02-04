from pathlib import Path

from dagster_dbt import DbtProject

airbnb_dbt_fusion_data_bricks_project = DbtProject(
    project_dir=Path(__file__).joinpath("..", "..", "..", "..", "..", "airbnb_dbt_fusion_data_bricks").resolve(),
    packaged_project_dir=Path(__file__).joinpath("..", "..", "dbt-project").resolve(),
)
airbnb_dbt_fusion_data_bricks_project.prepare_if_dev()