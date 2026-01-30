FROM python:3.11-slim

# Install git and dependencies
RUN apt-get update && \
    apt-get install -y git && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Install dbt for Postgres
RUN pip install dbt-postgres openlineage-dbt



# Set working directory
WORKDIR /usr/app


