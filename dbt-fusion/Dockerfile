FROM python:3.11-slim

# Install dependencies
RUN apt-get update && \
    apt-get install -y curl git unzip bash && \
    rm -rf /var/lib/apt/lists/*

# Set working directory
WORKDIR /usr/app

# Set SHELL env so installer works
ENV SHELL=/bin/bash

# Use bash as default shell
SHELL ["/bin/bash", "-c"]

# Install dbt Fusion CLI
RUN curl -fsSL https://public.cdn.getdbt.com/fs/install/install.sh | bash -s -- --update

# Add Fusion CLI to PATH
ENV PATH="/root/.local/bin:${PATH}"

# Install pip
#RUN apt-get update && \
#    apt-get install -y python3 python3-dev curl git unzip bash && \
#    rm -rf /var/lib/apt/lists/*


# Install any python packages you need
RUN pip install dbt-databricks openlineage-dbt


# Keep container alive
CMD ["sleep", "infinity"]
