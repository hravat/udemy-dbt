from dagster import job, op, Definitions
from dagster_dbt import DbtCliResource

# Path inside the container
DBT_PROJECT_DIR = "/opt/dagster/app/airbnb_dbt_fusion_data_bricks"

@op
def trigger_dbt_run(dbt: DbtCliResource):
    """
    Executes 'dbt run' and waits for it to finish.
    This is the most compatible way to run dbt without 'KeyError' or 'AttributeError'.
    """
    # This executes the command and waits for it to complete
    # It will automatically log the dbt output to the Dagster event log
    dbt_invocation = dbt.cli(["run"])
    
    # wait() ensures the op stays active until dbt is done
    # If dbt fails, this will raise an exception and mark the job as Failed
    dbt_invocation.wait()

@job
def my_simple_dbt_job():
    trigger_dbt_run()

defs = Definitions(
    jobs=[my_simple_dbt_job],
    resources={
        "dbt": DbtCliResource(
            project_dir=DBT_PROJECT_DIR,
            dbt_executable="dbt"
        ),
    },
)