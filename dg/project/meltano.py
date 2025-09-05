import dagster as dg
from dagster_meltano import load_jobs_from_meltano_project


@dg.repository()
def meltano_jobs():
    return [
        load_jobs_from_meltano_project(
            meltano_project_dir="/Users/edgarramirez/Arch/meltano-dogfood",
            retries=1,
        )
    ]
